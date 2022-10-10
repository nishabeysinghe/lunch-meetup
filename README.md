# **Lunch Group App**

## **This projects consists of below functionalities**

- There are two Dashboards which you can access as Employees and HR personal.
- View all created teams for this week.

## **HR Dashboard**
- View the list of leaders
- Create new teams 
- Change the leader of a team
- Show all blind dates of all employees
- Filter blind dates of a single employee

## **Employee Dahsboard**
- Edit lunch availability for the week
- View your assigned team 
- View All blind  dates You have attened


## **Assumptions**

- Each team consists of 5 members
- HR personnel has the ability to manage teams .
- Each week before Monday 10am teams should be created.
- After that you only can view. 
- Some of the code snippets are commented out -> explanations are given
- Exposed APIs are also commented out. 

## **Improvements and further work**
-  Tests are only being written for models
-  Authentication with devise should be implemented, Due to this employee signup is not there, Hence the seed file is used to add
 employees to the system.
- Use of partials should have become handy. 
 


Rails version - 7.0.4
Ruby verison - 3.1

- bundle install
- rails db:migrate
- rake db:seed

**Can view the system from here**
route to HR Dashboard api/v1/teams
