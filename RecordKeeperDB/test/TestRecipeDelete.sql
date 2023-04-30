declare @RecipeId int

select top 1 @RecipeId = r.RecipeId
from Recipe r 
join RecipeIngredient re 
on r.RecipeId = re.RecipeId
join Step s 
on s.RecipeId = r.RecipeId
join RecipeMealCourse rm 
on rm.RecipeId = r.RecipeId
join RecipeCookBook rb 
on rb.RecipeId = r.RecipeId

order by r.RecipeId


select * from Recipe r where r.RecipeId =@RecipeId


exec RecipeDelete @RecipeId =@RecipeId



select * from Recipe r where r.RecipeId =@RecipeId