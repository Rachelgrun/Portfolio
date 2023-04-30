create or alter procedure dbo.CuisineTypeGet(
    @CuisineId int = 0 output,
    @All bit = 0,
    @IncludeBlank bit = 0,
    @Message varchar(1000) = '' output
)
as
begin
declare @Return int 
select @CuisineId = isnull(@CuisineId,0), @All = isnull(@All,0), @IncludeBlank = isnull(@IncludeBlank,0)

    select c.CuisineTypeId,c.CuisineTypeName
    from CuisineType c 
    where c.CuisineTypeId = @CuisineId
    or @All = 1


    union select 0,'' where @IncludeBlank = 1

    order by c.CuisineTypeName

 return @return
    end 
    go 

