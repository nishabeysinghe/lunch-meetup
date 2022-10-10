Employee.destroy_all
Team.destroy_all

#SignUp was not implemented here. Hence adding employees manually 
#Assumption -> Only four departments are there , HR, IT, Marketing, Accounting and Engineering 

emp_id = 1  
department_id = 0
departments = %w(HR IT Marketing Accounting Engineering)


50.times do 
    employee = Employee.create({
        emp_id: emp_id,
        department: departments[department_id],
        name: Faker::Name.name , 
        email: Faker::Internet.email,
        is_leader: false,
        attending_lunch: true
    })
    emp_id += 1 
    department_id += 1 if emp_id % 10 == 0
end   


#A test team with 5 members below

# emp_id =1 

# team  = Team.create(name: "Team1")
# 5.times do 
#     employee = Employee.create({
#         emp_id: emp_id,
#         department: departments[emp_id - 1],
#         name: Faker::Name.name , 
#         is_leader: false,
#         attending_lunch: true
#     })
#     employee.teams << team
#     employee.save!
#     emp_id += 1;
# end  