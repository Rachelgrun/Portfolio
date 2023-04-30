/*declare @PresidentId int

select top 1 @PresidentId = p.PresidentId
from President p

order by p.PresidentId

exec PresidentDelete @PresidentId = @PresidentId

select * from President p where p.PresidentId = @PresidentId
*/

declare @PresidentId int

select top 1 @PresidentId = p.PresidentId
from President p
left join ExecutiveOrders e
on p.PresidentId = e.PresidentId
where e.ExecutiveOrdersId is null
order by p.PresidentId


select * from President p where p.PresidentId = @PresidentId
exec PresidentDelete @PresidentId = @PresidentId

select * from President p where p.PresidentId = @PresidentId
