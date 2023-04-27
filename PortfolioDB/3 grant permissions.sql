--Portfolio
use PortfolioDB
go
grant execute on DevSectionGet to portfolio_role 
grant execute on DevSubsectionElementGet to portfolio_role 
grant execute on DevSubSectionGet to portfolio_role 
grant execute on DevSubsectionToolGet to portfolio_role 
grant execute on DevToolGet to portfolio_role 
grant execute on DevToolTypeGet to portfolio_role 
grant execute on ProfileGet to portfolio_role 
grant select on DevSection to portfolio_role
grant select on DevSectionTool to portfolio_role
grant select on DevSubsection to portfolio_role
grant select on DevSubsectionElement to portfolio_role
grant select on DevSubsectionTool to portfolio_role
grant select on DevTool to portfolio_role
grant select on DevToolType to portfolio_role
grant select on Profile to portfolio_role

--Recipe
use RecipeDB
go
grant execute on CuisineTypeGet to portfolio_role 
grant execute on RecipeBookGet to portfolio_role 
grant execute on RecipeDelete to portfolio_role 
grant execute on RecipeGet to portfolio_role 
grant execute on RecipeIngredientGet to portfolio_role 
grant execute on RecipeUpdate to portfolio_role 
grant execute on StepsGet to portfolio_role 
grant execute on UsersGet to portfolio_role 
grant select on Cookbook to portfolio_role
grant select on Course to portfolio_role
grant select on CuisineType to portfolio_role
grant select on Ingredient to portfolio_role
grant select on Meal to portfolio_role
grant select on MealCourse to portfolio_role
grant select on MeasurementType to portfolio_role
grant select on Recipe to portfolio_role
grant select on RecipeCookbook to portfolio_role
grant select on RecipeIngredient to portfolio_role
grant select on RecipeMealCourse to portfolio_role
grant select on Step to portfolio_role
grant select on Users to portfolio_role

--Record Keeper
use RecordKeeperDB
go
grant execute on PartyGet to portfolio_role 
grant execute on PresidentDelete to portfolio_role 
grant execute on PresidentGet to portfolio_role 
grant select on ExecutiveOrders to portfolio_role
grant select on Invention to portfolio_role
grant select on Medalist to portfolio_role
grant select on party to portfolio_role
grant select on president to portfolio_role
grant select on WorldRecord to portfolio_role