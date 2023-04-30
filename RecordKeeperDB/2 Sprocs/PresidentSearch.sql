create or alter procedure dbo.PresidentSearch(@SearchCriteria varchar(1000),@Message varchar(1000) = ''output)
as
begin 
declare @return int = 0

select * from President p where p.LastName like '%' +@SearchCriteria +'%'
or p.FirstName like '%' + @SearchCriteria +'%'

return @return 
end


exec PresidentSearch @SearchCriteria = 'bush'