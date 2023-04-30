create or alter procedure dbo.UsersGet(
    @UserId int = 0 output,
    @All bit = 0,
    @IncludeBlank bit = 0,
    @Message varchar(1000) = '' output
)
as
begin
declare @return int 
select @UserId = isnull(@UserId,0), @All = isnull(@All,0), @IncludeBlank = isnull(@IncludeBlank,0)

    select UsersId = u.UserId,FullName = concat(u.UserFirstName,' ',u.UserLastName)
    from Users u 
    where u.UserId = @UserId
    or @All = 1


    union select 0,'' where @IncludeBlank = 1

    order by FullName

return @return
    end 
    go 

    exec UsersGet @all = 1

