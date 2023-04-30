create or Alter PROCEDURE dbo.PartyGet
AS
begin 
    select p.PartyId,p.PartyName,p.YearStarted,p.Color
    from Party p 
    Order By p.PartyName
end 

go 

exec PartyGet