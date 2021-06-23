/*
1.	Design a Database for a company to Manage all its projects.
Company has diverse offices in several countries, which manage and co-ordinate the project of that country.
Head office has a unique name, city, country, address, phone number and name of the director.
Every head office manages a set of projects with Project code, title, project starting and end date, assigned budget and name of the person in-charge. One project is formed by the set of operations that can affect to several cities.
We want to know what actions are realized in each city storing its name, country and number of inhabitants.
*/
--Database Name: CompanyDB
create table HeadOffice(
	OfficeName varchar(40) unique,
	City varchar(30),
	Country varchar(50),
	Address varchar(100),
	PhoneNumber varchar(15),
	Director varchar(30),
	Constraint HeadOffice primary key(OfficeName,City)
)

create table Projects(
	ProjectCode int primary key identity(1,1),
	Title varchar(30),
	StartDate DATETIME,
	EndDate DATETIME,
	Budget decimal(6,2),
	ProjectManager varchar(30)
)

create table Actions(
	ProjectCode int foreign key references Projects(ProjectCode),
	OfficeName varchar(40) foreign key references HeadOffice(OfficeName),
	Country varchar(100),
	Inhabitants int check(Inhabitants > 0)
)

/*
2.	Design a database for a lending company which manages lending among people (p2p lending)
Lenders that lending money are registered with an Id, name and available amount of money for the financial operations. 
Borrowers are identified by their id and the company registers their name and a risk value depending on their personal situation.
When borrowers apply for a loan, a new loan code, the total amount, the refund deadline, the interest rate and its purpose are stored in database. 
Lenders choose the amount they want to invest in each loan. A lender can contribute with different partial amounts to several loans.
*/
--Database name: Microfinance
create table Lenders(
	Id int primary key identity(1,1),
	LenderName varchar(30),
	Investment decimal
)

create table Borrowers(
	Id int primary key,
	BorrowerName varchar(30),
	RiskValue int
)

create table LoanDetails(
	LenderId int foreign key references Lenders(Id),
	BorrowerId int foreign key references Borrowers(Id),
	LoanCode varchar(15),
	TotalAmount decimal(6,2),
	RefundDeadline DATETIME,
	InterestRate decimal,
	Purpose text
)

/*
3.	Design a database to maintain the menu of a restaurant.
Each course has its name, a short description, photo and final price.
Each course has categories characterized by their names, short description, name of the employee in-charge of them.
Besides the courses some recipes are stored. They are formed by the name of their ingredients, the required amount, units of measurements and the current amount in the store.
*/
--Database Name -- Restaurant_Menu
create table Course(
	CourseName varchar(40) primary key,
	Description text,
	Photo image,
	Price decimal(6,2)
)

create table CourseCategory(
	CategoryName varchar(40) foreign key references Course(CourseName),
	Description text,
	DesignatedEmployee varchar(40),
)

create table Recipes(
	Ingredients text,
	RequiredQuantity varchar,
	Measurement varchar,
	QuantityAvailable int
)
