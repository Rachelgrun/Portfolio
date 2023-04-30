-- 1. The only column that should allow a null value is YearDied 
-- 2. Varchar columns should not allow blanks 
-- 3. All int columns must be greater than zero
-- 4. Rerun the Invention data

-- Test your constraints! Try inserting the bad data to ensure that your table is protected (save test script in test folder).


-- The following rules must be enforced:

-- 1. No American invention can be invented before 1776

-- 2. Inventors must be at least 10 years old to have their inventions patented

-- 3. Rerun the Invention data

-- 4. Test your constraints! Show 2 insert statements attempting to insert bad data - one which violates each constraint




--use RecordKeeperDB
go
drop table if exists Invention
go
create table dbo.Invention(
	InventionId int not null identity primary key,
	InventionName varchar (200) not null constraint ck_invention_Invention_Name_cannot_be_blank check(InventionName <> ''),
	InventionDesc varchar (max) not null constraint ck_invention_Invention_Desc_cannot_be_blank check(InventionDesc <> ''),
	YearInvented int not null constraint ck_Year_Invented_must_be_greater_than_zero check(YearInvented > 0),
	InventorFirstName varchar (100) not null constraint ck_invention_Inventor_First_Name_cannot_be_blank check(InventorFirstName <> ''),
	InventorLastName varchar (100) not null constraint ck_invention_Invention_Last_Name_cannot_be_blank check(InventorLastName <> ''),
	Country varchar (50) not null constraint ck_invention_Country_cannot_be_blank check(country <> ''),
	YearBorn int not null constraint ck_Year_Born_must_be_greater_than_zero check(YearBorn > 0),
	YearDied int constraint ck_Year_died_must_be_greater_than_zero check(YearDied> 0),
	)
go


