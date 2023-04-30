--1) Present the list of Recipies
select * from Recipe r 

--2) List the meals.
select * from meal m 

--3)List Of Recipes in each Cook Book     
select r.RecipeName,c.CookbookTitle 
from recipe r 
join RecipeCookbook rc
on r.RecipeId = rc.RecipeId
join Cookbook c 
on rc.CookbookId = c.CookbookId

--4)What is total calories per meal
select m.MealTitle,sum(r.Calories)
from Recipe r 
join RecipeMealCourse rm 
on r.RecipeId = rm. recipeId
join MealCourse mc 
on mc.MealCourseId = rm.MealCourseId
join meal m 
on m.MealId = mc.MealId 
group by m.MealTitle