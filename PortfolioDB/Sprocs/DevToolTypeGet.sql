create or alter procedure dbo.DevToolTypeGet(
    @DevToolTypeId int = 0,
    @All bit = 0,
     @Message varchar(500) = '' output
)

as
begin 
    declare @ReturnCode int = 0

    select @DevToolTypeId = isnull(@DevToolTypeId,0),@All = isnull(@All,0)

    select t.DevToolTypeId,t.DevToolTypeName, t.DevToolTypeCode, t.ShowHomePage,t.DevToolTypeSequence
    from DevToolType t 
    where t.DevToolTypeId = @DevToolTypeId
    or @All = 1 
    order by t.DevToolTypeSequence



    return @ReturnCode


end