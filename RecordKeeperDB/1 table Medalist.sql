--YP Wow!!! Amazing Work! 100%
/* 1
Medalist 
   Recently somebody entered bad data into the medalist table (mixed up the year born and the olympic year),
   and that data was used to create an advertisement targeting an international audience.
   The advertisement was viewed by millions of people around the world. It was very embarassing.
   Strengthen the table in order to ensure that no bad data is ever inserted again.
   The following rules must be enforced:
      --The year born must be before olympic year.
      --The first olympic games happened in 1896. No data is allowed to be inserted before that.
      --No null data is allowed.
      --Columns should not allow blank data, zeros or negative numbers to be inserted. 
      --Gymnasts must be at least 16 years old in order to compete.
      Boxers must be between 18 and 40 years old in order to compete.
      Each olympic year can only have one of each medal for each sport and its sport subcategory.
    After adding in the constraints, rerun the medalist data and include test scripts for the constraints to prove that you have succeeded in strengthening the table.
*/




use RecordKeeperDB
go
drop table if exists Medalist
go
create table dbo.Medalist(
	MedalistId int not null identity primary key,
	OlympicYear int not null constraint ck_Medalist_Olympic_Year_must_be_at_least_1896 check(OlympicYear>=1896),
	Season varchar (50) not null constraint ck_Medalist_Season_should_not_be_blank check(Season <>''),
	OlympicLocation varchar (100) not null constraint ck_Medalist_Olympic_Location_should_not_be_blank check (OlympicLocation<>''),
	Sport varchar (100) not null constraint ck_Medalist_Sport_should_not_be_blank check(Sport<>''),
	SportSubcategory varchar (100) not null constraint ck_Medalist_Sport_Subcategory_should_not_be_blank check(SportSubcategory<>''),
	Medal varchar (6) not null constraint ck_Medalist_Medal_should_not_be_blank check(Medal<>''),
	FirstName varchar (50) not null constraint ck_Medalist_First_Name_should_not_be_blank check(FirstName<>''),
	LastName varchar (50) not null constraint ck_Medalist_Last_Name_should_not_be_blank check(LastName<>''),
	Country varchar (50) not null constraint ck_Medalist_Country_should_not_be_blank check(Country<>''),
	YearBorn int not null constraint ck_Medalist_Year_Born_should_not_be_Zero check(Yearborn >0),
	constraint ck_Medalist_Year_Born_must_be_before_Olympic_Year check(YearBorn<OlympicYear),
	constraint ck_Medalist_Gymnasts_must_be_at_least_14 check (not(Sport = 'Gymnastics' and OlympicYear - YearBorn < 14)),
	constraint ck_Medalist_Boxers_must_be_between_18_and_40 check (not(sport= 'Boxing' and OlympicYear - YearBorn not between 18 and 40)),
	constraint u_Medalist_Olympic_Year_sport_sport_Subcategory unique (OlympicYear,medal,sport,SportSubcategory)
)
go


alter table medalist drop column if exists AgeAtOlympic
	alter table medalist add AgeAtOlympic as OlympicYear - YearBorn persisted

alter table medalist drop column if exists MedalistSummary
	alter table medalist add MedalistSummary as concat(medal,' - ',SUBSTRING(FirstName,1,1),'.',SUBSTRING(LastName,1,1),'.: ',OlympicYear) persisted

alter table medalist drop column if exists gold
	alter table medalist add gold  as case medal when  'gold' then 1 else 0 end persisted

alter table medalist drop constraint if exists d_Medalist_MeadalistAddress
	alter table medalist drop column if exists MedalistAddress
	alter table medalist add MedalistAddress varchar(500) not null constraint d_Medalist_MeadalistAddress default ''