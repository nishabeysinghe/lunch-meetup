require "rails_helper"
require "spec_helper"

describe Team do

    before(:all) do
        @employee1 = Employee.new(emp_id: 005, department: "HR_test")
        @employee2 = Employee.new(emp_id: 006, department: "HR_test2")
    

        @team = Team.create(
            name: "Test Team5")
        @team.employees << @employee1
        @team.save!
    end   
   
    it "should include the :id attribute" do
        expect(@team.attributes).to include("id")
    end

     
    it "should include the :name attribute" do
        expect(@team.attributes).to include("name")
    end

      
    it "should include the :created_at attribute" do
        expect(@team.attributes).to include("created_at")
    end
      
    it "should include the :created_at attribute" do
        expect(@team.attributes).to include("created_at")
    end  

    
end 