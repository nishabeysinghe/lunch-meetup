Rails.application.routes.draw do
   namespace 'api'  do
    namespace 'v1'  do
      root to: "employees#index"

      resources :employees do 
        collection do
          get 'enter_availability' => 'employees#enter_availability'
          get 'all_employees'
          get 'available_employees'

        end 

      end  

      resources :teams do
        collection do
          get 'all_teams'
          get 'create_teams_and_get_new_team_leads'

          get 'change_the_leader' => 'teams#change_the_leader'
          get 'get_my_team' => 'teams#get_my_team'

        end  

      end  

      resources :blind_dates do         
        collection do
          get 'employee_blind_date' => 'blind_dates#employee_blind_date'
        end  
      end  

    end 
  end 

end
