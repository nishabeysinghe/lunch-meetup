module Api
    module V1
        class BlindDatesController < ApplicationController
            helper BlindDateHelper

            def index
                @blind_dates = BlindDate.order('created_at DESC');
                flash[:notice] = 'All Blind Dates Loaded!'
                # render json: {status: 'SUCCESS', meesage: 'All Blind Dates', data: @blind_dates}, status: :ok
            end   
            
            def employee_blind_date
                @employee_blind_date = BlindDate.where(employee_id:  params[:employee_id])
                
                if @employee_blind_date.nil? || @employee_blind_date.empty?

                    flash[:notice] = 'Blind Dates of Employee Not Found!'

                else
                    flash[:notice] = 'Blind Dates of Employee Loaded!'

                end        
               
                # render json: {status: 'SUCCESS', meesage: 'Blind Dates of employee ', data: @employee_blind_date}, status: :ok
            end 

    
            private

            def blind_date_params
                params.permit(:employee_id, :team_id)
            end   
            
         
        end   
    end
end       


