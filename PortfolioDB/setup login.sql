use master
go
create login portfolio_login with password = 'RUCHIEg19'
--alter login portfolio_login with password = 'RUCHIEg19'
--alter login portfolio_login with password = 'localRUCHIEG'

go 
--use PortfolioDB 
--use RecordKeeperDB
--use RecipeDB
--drop user portfolio_user
create user portfolio_user from login portfolio_login

create role portfolio_role

alter role portfolio_role add member portfolio_user