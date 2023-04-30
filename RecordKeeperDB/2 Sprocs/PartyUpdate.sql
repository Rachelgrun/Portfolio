create or alter procedure dbo.PartyUpdate(
    @PartyId int = 0 output,
	@PartyName varchar(35),
	@YearStarted smallint, 
	@Color varchar(20),
    @PresidentCount int =0,
    @Message varchar(1000) = '' output
)
as
begin
    declare @Return int = 0

    select @PartyId = isnull(@PartyId,0), @PartyName = isnull(@PartyName,''), @Color = isnull(@Color,'')

    if @PartyId = 0
    begin
        insert party(PartyName, YearStarted, Color)
        values (@PartyName, @YearStarted, @Color)

        select @PartyId = scope_identity()
    end
    else
    begin
        update Party
        set PartyName = @PartyName, 
            YearStarted = @YearStarted,
            Color = @Color
        where PartyId = @PartyId
    end

    return @Return
end

