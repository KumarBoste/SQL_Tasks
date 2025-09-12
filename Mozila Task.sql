# Create databse: xyz
# Create schema for company domain : mozila
# Create tables: employee,HR,Performance
# Apply insert, update and delete
# Create er diagram for company

Drop database if exists xyz;
Create database if not exists xyz;
Use xyz;
Create table employee (
Employee_id int primary key not null unique,
Employee_Name Varchar(10) not null,
Employee_Age int not null,
Employee_MobileNo int not null,
Employee_Gender enum('Male','Female','Others'),
Employee_mail varchar(30) not null
);

Create table HR (
Employee_ID int not null,
HR_ID int primary key not null unique,
HR_Name varchar(10) not null,
HR_MobileNo int not null,
HR_Age int not null,
HR_Gender enum('Male','Female'),
HR_mail varchar(20) not null,
foreign key (Employee_id)
references Employee (Employee_id)
);

Create table Performance (
Employee_id int not null,
HR_ID int not null,
Salary int not null,
Department varchar(15) not null,
Feedback varchar(50) not null,
Tenure date not null,
area_of_improvement varchar(50) not null,
Ratings int not null,
foreign key (Employee_id)
references Employee (Employee_Id),
foreign key (HR_ID)
references HR (HR_ID) 
);
alter table employee
modify Employee_Gender enum('Male','Female','Others') not null;
describe employee;
alter table HR
modify HR_Gender enum('Male','Female') not null;
describe HR;
describe performance;

select * from employee;
