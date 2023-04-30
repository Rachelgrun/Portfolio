
-- World Record

-- 1. All columns should block nulls
-- 2. Block blank values for all varchar columns
-- 3. Block negative numbers for all int columns
-- 4. Rerun the World Record data

-- Test your constraints! Try inserting bad data to ensure that your table is protected (save test script in test folder).
use RecordKeeperDB
go
drop table if exists WorldRecord
go
create table dbo.WorldRecord(
	WorldRecordId int not null identity primary key,
	Category varchar (100) not null constraint ck_worldrecord_Category_cannot_be_blank check(Category <> ''),
	RecordName varchar (200)not  null
		 constraint ck_worldrecord_RecordName_cannot_be_blank check(RecordName <> '') 
		constraint u_WorldRecord_Record_Name unique,
	RecordDesc varchar (max)not null constraint ck_worldrecord_RecordDesc_cannot_be_blank check(RecordDesc <> ''),
	FullName varchar (100)not null constraint ck_worldrecord_FullName_cannot_be_blank check(FullName <> ''),
	Amount decimal not null constraint ck_worldrecord_Amount_must_be_greater_than_zero check (Amount > 0),
	UnitOfMeasure varchar (100)not null constraint ck_worldrecord_UnitOfMeasure_cannot_be_blank check(UnitOfMeasure <> ''),
	YearAchieved int not null constraint ck_WorldRecord_Year_Achieved_must_be_greater_than_1200 check(YearAchieved>=1200),
	RecordBreakerAddress varchar(500) not null default '',
	Country varchar (50) not null constraint ck_worldrecord_Country_cannot_be_blank check(Country <> '') ,
	DateInserted datetime not null default getdate(),
	constraint ck_WorldRecord_USA_record_must_be_1776_0r_later check(not(country = 'USA' and YearAchieved < 1776))
	)
go


alter table WorldRecord drop constraint if exists u_WorldRecord_code

alter table WorldRecord drop column if exists code
alter table WorldRecord add code as concat(left(replace(RecordName,' ',''),20),YearAchieved) persisted
constraint u_WorldRecord_code unique 
