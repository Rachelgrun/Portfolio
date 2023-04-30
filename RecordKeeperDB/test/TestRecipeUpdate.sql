declare @RecipeId int, @RecipeName varchar(100),@NumberOfCalories int



select top 1 @RecipeId = r.RecipeId,@RecipeName = r.RecipeName,@NumberOfCalories = r.calories
from Recipe r 
 order by r.RecipeId desc

select * from Recipe r where r.RecipeId = @RecipeId
exec RecipeUpdate
@RecipeId = @RecipeId,
@RecipeName = "Chocalate Cake",
@NumberOfCalories = @NumberOfCalories

select * from Recipe r where r.RecipeId = @RecipeId


