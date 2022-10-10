require "rails_helper"
require "spec_helper"

describe BlindDate do

    before(:all) do
        @employee = Employee.create(emp_id: 101, department: "HR_test", is_leader: true, attending_lunch: false, email: "123@gmail.com")
        @team = Team.create(name: "Team for spec")
        @blind_date = BlindDate.new(employee_id: @employee.id, team_id: @team_id)

    end   
   
    it "should include the :id attribute" do
        expect(@blind_date.attributes).to include("id")
    end

     
    it "should include the :employee_id attribute" do
        expect(@blind_date.attributes).to include("employee_id")
    end

           
    it "should include the :team_id attribute" do
        expect(@blind_date.attributes).to include("team_id")
    end

    it "should include the :created_at attribute" do
        expect(@blind_date.attributes).to include("created_at")
    end
      
    it "should include the :updated_at attribute" do
        expect(@blind_date.attributes).to include("updated_at")
    end  

    
end 