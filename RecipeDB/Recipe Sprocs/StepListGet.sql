create or alter procedure dbo.StepsGet(@RecipeId int = 0,@Message varchar(1000)= '' output)
as 
begin 
    select @RecipeId = ISNULL(@RecipeId,0) 
    
    declare @return int = 0
    select s.StepDesc
    from Recipe r
    join Step s
    on r.RecipeId = s.RecipeID
    where r.RecipeId = @RecipeId
    order by s.StepSequence
    return @return
end 

go 

