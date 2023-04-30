create or alter procedure dbo.RecipeGet(@RecipeId int = 0,@All bit= 0,@Message varchar(1000) = '' output)
AS 
begin 
declare @Return int = 0 
    SELECT @RecipeId = ISNULL(@RecipeId,0),@All = ISNULL(@All,0) 
    select r.RecipeId,r.CreatedByUserId,r.CuisineTypeId,r.RecipeName,r.Calories,r.DateDrafted,r.DatePublished,r.DateArchived,r.RecipeStatus,NumberOfIngredients = count (distinct ri.IngredientID),NumberOfSteps = COUNT(distinct s.StepDesc)
        from Recipe r 
    left join RecipeIngredient ri 
    on r.RecipeId = ri.RecipeId
    left join Step s 
    on r.RecipeId = s.RecipeID 
    where r.RecipeId  =  @RecipeId or @All = 0
   
    group by r.RecipeName,r.Calories ,r.RecipeId,r.CreatedByUserId,r.CuisineTypeId,r.RecipeName,r.Calories,r.DateDrafted,r.DatePublished,r.DateArchived,r.RecipeStatus
    return @Return
end

GO


