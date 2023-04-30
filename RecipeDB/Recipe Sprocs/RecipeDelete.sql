-- LL 100% Wow! Great Job!
create or alter procedure dbo.RecipeDelete(@RecipeId int,@Message varchar(1000) = '' output)
as 
begin 
declare @return int = 0


delete re
from RecipeIngredient re 
join recipe r 
on r.RecipeId = re.RecipeId
where r.RecipeId= @RecipeId



delete s
from step s 
join recipe r 
on s.RecipeId = r.RecipeId
where r.RecipeId= @RecipeId

delete rm 
from  RecipeMealCourse rm 
join recipe r 
on rm.RecipeId = r.RecipeId
where r.RecipeId= @RecipeId

delete rb
from  RecipeCookBook rb 
join recipe r 
on rb.RecipeId = r.RecipeId
where r.RecipeId= @RecipeId


delete r
from Recipe r 
where r.RecipeId= @RecipeId


return @return
end 
go 



