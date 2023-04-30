create or alter procedure dbo.ExecutiveOrderGet(@PresidentId int)
AS
begin 
    select e.ExecutiveOrdersId,e.PresidentId,e.OrderName,e.PageNumber,e.YearIssued,e.OrderNumber,e.ExecutiveOrdersDesc
    from ExecutiveOrders e
    where e.PresidentId = @PresidentId
    Order By e.ExecutiveOrdersDesc
end
go 

exec ExecutiveOrderGet @PresidentId = 1043

select * from President p 