module Api
    module V1
        class EmployeesController < ApplicationController

            def enter_availability

                @employee = Employee.where(emp_id: params[:emp_id]).first
                if !params[:attending_lunch].nil? && params[:attending_lunch].upcase == 'YES'
                    @employee.attending_lunch = true

                elsif !params[:attending_lunch].nil? && params[:attending_lunch].upcase != 'YES'
                    @employee.attending_lunch = false

                end        
               
                if !@employee.nil? && @employee.save!
                    flash[:notice] = 'Employee Attending Lunch Updated for this week!'
                    # render json: {status: 'SUCCESS', meesage: 'Employee Attending Lunch Updated for this week', data: employees}, status: :ok
                elsif !@employee.nil? && !@employee.save!
                    flash[:notice] = @employee.errors

                    # render json: {status: 'ERROR', meesage: 'Employee not updated', data: employee.errors}, status: :unprocessable_entity
                end   
                
                @employee

            end  

            def available_employees
                @employees = Employee.where(attending_lunch: true)
                # render json: {status: 'SUCCESS', meesage: 'Employees Attending Lunch Gathering this week', data: @employees}, status: :ok
            end     

            def all_employees
                 employees = Employee.order('created_at DESC');
                 render json: {status: 'SUCCESS', meesage: 'All Employees', data: employees}, status: :ok
            end  
            

            def create
                employee =  Employee.new(employee_params)

                if employee.save
                    render json: {status: 'SUCCESS', meesage: 'Employee Added', data: employee}, status: :ok
                else 
                    render json: {status: 'ERROR', meesage: 'Employee not added', data: employee.errors}, status: :unprocessable_entity
                end    
            end   
    

            def destroy
                employee = Employee.find(params[:id])

                if employee.destroy
                    render json: {status: 'SUCCESS', meesage: 'Employee Deleted', data: employee}, status: :ok
                else
                    render json: {status: 'ERROR', meesage: 'Employee not deleted', data: employee.errors}, status: :unprocessable_entity.errors
                end       
            end    

            
            private

            def employee_params
                params.permit(:emp_id, :attending_lunch, :department, :name, :is_leader, :team_ids)
            end    
        end
    end
end           