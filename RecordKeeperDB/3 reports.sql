--AS: Nice work! 100% 
--reports and tasks
	--a) list all executive orders sorted by page number, display the official executive order format
select e.ExecutiveOrdersDesc,e.PageNumber
from ExecutiveOrders e 
order by e.PageNumber

	--b) same as a but include the presidents name
select e.ExecutiveOrdersDesc,e.PageNumber,p.FirstName,p.LastName
from ExecutiveOrders e 
join president p 
on e.PresidentId = p.PresidentId
order by e.PageNumber
	--c) same as b but include the party name
select e.ExecutiveOrdersDesc,e.PageNumber,p.FirstName,p.LastName,z.PartyName
from ExecutiveOrders e 
join president p 
on e.PresidentId = p.PresidentId
join party z
on z.partyID = p.PartyId
order by e.PageNumber
	--d) show number of executive orders per presidents, include zero if none for president, sort by highest number of orders
select NumOrders=count(e.OrderNumber),p.Num
from president p  
left join ExecutiveOrders e 
on p.PresidentId = e.PresidentId
group by p.Num
order by NumOrders desc

	--e) show number of executive orders per party, include zero if none for party
select Numorders=count(e.ordernumber),z.PartyName
from party z 
join president p 
on z.partyID=p.PartyId
left join ExecutiveOrders e 
on e.PresidentId = p.PresidentId
group by z.PartyName


	--f) delete a party that has one or more executive orders
	
delete e
from party z 
join president p 
on p.PartyId = z.partyID
join ExecutiveOrders e 
on e.PresidentId= p.PresidentId
where z.PartyName ='Democrat'

delete p 
from party z 
join president p 
on p.PartyId = z.partyID
where  z.PartyName ='Democrat'

delete z
from party z 
where z.PartyName ='Democrat'





    
	--g) for a particular party with exec orders update all to not upheld
--select * 
update e
set e.UpheldByCourt = 0
from party z 
join president p 
on p.PartyId = z.partyID
join ExecutiveOrders e 
on p.PresidentId = e.PresidentId
where z.PartyName = 'Democrat'