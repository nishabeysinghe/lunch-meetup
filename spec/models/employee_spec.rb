require "rails_helper"
require "spec_helper"

describe Employee do

    before(:all) do
        @employee = Employee.create(emp_id: 001, department: "HR_test", is_leader: true, attending_lunch: false, email: "123@gmail.com")

    end   
   
    it "should include the :id attribute" do
        expect(@employee.attributes).to include("id")
    end

     
    it "should include the :emp_id attribute" do
        expect(@employee.attributes).to include("emp_id")
    end

      
    it "should include the :department attribute" do
        expect(@employee.attributes).to include("department")
    end
      
    it "should include the :is_leader attribute" do
        expect(@employee.attributes).to include("is_leader")
    end  

    it "should include the :attending_lunch attribute" do
        expect(@employee.attributes).to include("attending_lunch")
    end
      
    it "should include the :email attribute" do
        expect(@employee.attributes).to include("email")
    end  


    it "should include the :created_at attribute" do
        expect(@employee.attributes).to include("created_at")
    end
      
    it "should include the :updated_at attribute" do
        expect(@employee.attributes).to include("updated_at")
    end  


end 