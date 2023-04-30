create or alter procedure dbo.RecipeIngredientGet(@RecipeId int = 0,@Message varchar(1000) = '' output)     
as
begin 
declare @Return int  = 0
    select @RecipeId= ISNULL(@RecipeId,0)

    select IngredientDesc= concat(ri.MeasurementQuantity,' ',mt.MeasurementTypeName,' ',i.IngredientName),r.recipeId
    from Recipe r 
    join RecipeIngredient ri 
    on r.RecipeId = ri.RecipeId
    join Ingredient i 
    on i.IngredientID = ri.IngredientID
    join MeasurementType mt 
    on mt.MeasurementTypeId = ri.MeasurementTypeId 
    where r.RecipeId = @RecipeId
   
   
  order by ri.IngredientSequence
  return @Return
end

go 

