create or alter procedure dbo.RecipeBookGet(@Message varchar(1000) = '' output)
as 
begin
declare @return int = 0
  select   NumCookBooks= COUNT(Distinct rc.CookbookId),NumMeals = COUNT(Distinct mc.MealId),NumRecipes = COUNT(Distinct r.RecipeName)
    from Recipe r 
    join  RecipeMealCourse rm 
    on r.RecipeId = rm.recipeId
    join MealCourse mc
    on mc.MealCourseId = rm.MealCourseId
    join RecipeCookBook rc 
    on r.recipeId = rc.recipeId
return @return
end 

go 

