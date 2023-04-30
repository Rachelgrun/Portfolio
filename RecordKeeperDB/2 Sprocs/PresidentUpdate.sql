create or alter procedure dbo.PresidentUpdate(
    @PresidentId int output,
    @PartyId int output,
    @Num int output,
    @FirstName varchar(100) ,
    @LastName varchar (100),
    @DateBorn date ,
    @DateDied datetime2 = null,
    --@YearBorn int ,
    --@YearDied int ,
    @TermStart int ,
    @TermEnd int ,
    @Code varchar(1000) = '' output,
    @Message varchar (1000) = '' output
)
as
begin

    declare @return int = 0
    select @PresidentId = isnull(@PresidentId,0), @TermEnd = nullif(@TermEnd,0),@Num = isnull(@Num,0)

    if @PresidentId = 0
    begin





        if @Num = 0
        begin 
               select @Num = max(p.Num) +1 from president p
        end


        insert President(PartyId, Num, FirstName, LastName, DateBorn, DateDied, TermStart, TermEnd)
        values(@PartyId, @Num, @FirstName, @LastName, @DateBorn, @DateDied, @TermStart, @TermEnd)

        select @PresidentId = scope_identity()
       
       
    end
    else
    begin

if(@Num <> (select num from president p where p.PresidentId = @PresidentId))
begin 
select @return = 1, @Message = 'You cannot change presidents number'
goto Finished
end

        update p
        set
            PartyId = @PartyId, 
            Num = @Num, 
            FirstName = @FirstName, 
            LastName = @LastName, 
            DateBorn = @DateBorn, 
            DateDied = @DateDied, 
            TermStart = @TermStart, 
            TermEnd = @TermEnd 
        from President p
        where p.PresidentId = @PresidentId
    end
    
 select @Code = Code from president p where p.PresidentId = @PresidentId
    Finished:
return @return
end