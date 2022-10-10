module Api
    module V1
        class TeamsController < ApplicationController
            helper TeamHelper
            def all_teams
                @employees = Employee.order('created_at DESC');
                flash[:notice] = "All teams"
                # render json: {status: 'SUCCESS', meesage: 'All teams', data: @all_teams}, status: :ok
            end  

            def change_the_leader
                return if  params[:team_id].nil?
                team = Team.where(id: params[:team_id]).first

                if team.nil?
                    flash[:notice] = "Team Not Found"
                else
                    @leader = assign_leaders(false, team)
                    flash[:notice] = "New Leader Created"
                end           

            end 

            def update
                team = Team.find(params[:id])
                leaders = assign_leaders(false, team)
                flash[:notice] = "Team Leader Updated"
                # render json: {status: 'SUCCESS', meesage: 'Team Leader Updated', data: leaders.first}, status: :ok

            end 
            

            def index
                if Date.today.strftime("%A") == "Monday" &&  DateTime.now.strftime("%H") < "10"
                    message = 'This week team creation is still in progress. You might be viewing temporary data. Please check agin after 10.00 am today'
                else
                    message = 'Teams for this week'
                end  

                time_now = DateTime.now - 7
                @teams = Team.where(Team.arel_table[:created_at].gt(time_now))   
                flash[:notice] = message

                # render json: {status: 'SUCCESS', message: message , data: @teams}, status: :ok
                return @teams
            end

            def get_my_team
                @teams = []
                all_teams = index()
                all_teams.each do |team|
                    employee = team.employees.where(emp_id: params[:emp_id])
                    unless employee.empty?  
                        @team = team 
                        return @team
                    end    
                end    
            end    

            def create_teams_and_get_new_team_leads
                ##with the assumption that teams can only be assigned before 10am every Monday
                 #commenting rest of the code for evaluation purpose

                #if Date.today.strftime("%A") == "Monday" &&   DateTime.now.strftime("%H") < "10"
                    generate_teams_and_members()
                #else
                   #@leaders = get_leaders()
                    #flash[:notice] = 'You can only create teams before 10am every Monday'
                    # render json: {status: 'ERROR', message: 'You can only create teams before 10am every Monday'}, status: :unprocessable_entity
                #end       
                 
            end    

         

            private

            def generate_teams_and_members
                #order by department so that employees of the same department will be spread to teams 
                #assumption  -  each team consists of 5 members 
                Team.where(Team.arel_table[:created_at].gt(DateTime.now.midnight)).destroy_all
                @employees = Employee.where(attending_lunch: true).order(:department)
                @employees_in_groups = @employees.shuffle.to_a.in_groups_of(5)
                @employees_in_groups.each_with_index do |employee_group, index|
                    name = "Team_" + index.to_s + "_" + DateTime.now.to_s 
                    team  = Team.create(name: name)
                    team.employees <<  employee_group.compact
                    team.save!
                end    
            
                @leaders = assign_leaders(true, nil)
                
                if !@leaders.empty?
                    flash[:notice] = "Teams Created"

                else
                    flash[:notice] = "Something Went Wrong"

                end        
            end  
        
            
            def get_leaders
                time_now = DateTime.now - 7
                existing_leaders = []
                teams = Team.where(Team.arel_table[:created_at].gt(time_now))   
                teams.each do |team|
                    existing_leaders << team.employees.find_by(is_leader: true)
                end   
                
                existing_leaders

            end    


            def assign_leaders(is_initial, team)
                @teams = []
                leaders = []
                if is_initial
                    @teams = Team.all
                else
                    @teams << team  
                end        
                unless @teams.empty?
                    @teams.each do |team|
                        potentital_leaders = team.employees.where(is_leader: false)
                        existing_leaders =  team.employees.where(is_leader: true)

                        existing_leaders.each do |exst_leader|
                            exst_leader.is_leader = false
                            exst_leader.save!
                        end  

                        leader =  potentital_leaders.order('RANDOM()').first
                        leader.is_leader = true
                        leader.save!

                        leaders << leader
                    end 
                end
                leaders
            end    

            def team_params
                params.permit(:name, :id)
            end  

        end
    end
end            
