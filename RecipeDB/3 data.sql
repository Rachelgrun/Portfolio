
--use RecipeDB

delete RecipeCookBook
delete CookBook
delete RecipeMealCourse
delete MealCourse
delete Meal
delete Course
delete Step
delete RecipeIngredient
delete Recipe
delete CuisineType
delete Users 
delete MeasurementType
delete Ingredient

go



insert ingredient(IngredientName)
select 'Sugar'
union select 'Flour'
union select 'Eggs'
union select 'Oil'
union select 'Cocoa'
union select 'Chocolate Chips'
union select 'Vanilla Extract'
union select 'Vanilla Sugar'
union select 'Oats'
union select 'Magerine'
union select 'Butter'
union select 'Peanut Butter'
union select 'Cheese'
union select 'Confectioner''s Sugar'
union select 'Honey'
union select 'Apple Sauce'
union select 'Brown Sugar'
union select 'Baking Powder'
union select 'Baking Soda'
union select 'Salt'
union select 'Steak'
union select 'Potatoe'
union select 'pepper'
union select 'chicken'
union select 'Tomatoe Sauce'
union select 'onion'
union select 'Sushi rice'
union select 'Kani'
union select 'Avacodo'
union select 'Sweet potaoe'
union select 'Sweet sauce'
union select 'spicy mayo'
union select 'Teriaki sauce'
union select 'bread loaf'

insert MeasurementType(MeasurementTypeName)
select 'OZ'
union select 'Cup(s)'
union select 'teaspoon(s)'
union select 'Tbsp'
union select 'Pounds'
union select 'Pints'
union select 'Small'
union select 'Medium'
union select 'Large'

insert Users(UserFirstName,UserLastName,UserPassword)
select 'Rachel','Lan','rachel123'
union select 'Jacob','Loewy','JL569'
union select 'Cilia','Cohen','CC854'
union select 'Joseph','Leon','JL398'
union select 'Victoria','Dwek','VD378'
union select 'Leah','Schapira','LS347'


insert CuisineType(CuisineTypeName)
 select 'Australian '
union select 'Ethiopian'
union select 'French'
union select 'Hawaiian'
union select 'Indian'
union select 'Italian'
union select 'Japanese'
union select 'Zero Calorie'


insert Recipe(CreatedByUserId,CuisineTypeId,RecipeName,Calories,DateDrafted,DatePublished,DateArchived)
select (select u.userId from users u where u.UserLastName = 'Cohen'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'French'),
    'Homemade French croissants',300,'2019-10-26','2020-07-20',null
union select (select u.userId from users u where u.UserLastName = 'Loewy'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'French'),
    'French Onion Soup',450,'2021-02-13',null,'2022-01-01'
union select (select u.userId from users u where u.UserLastName = 'Leon'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'Italian'),
    'The Real Pizza',347,'2019-09-08',null,null
union select (select u.userId from users u where u.UserLastName = 'Dwek'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'Indian'),
    'Apple Muffin',200,'2020-09-06','2021-09-07',null
union select (select u.userId from users u where u.UserLastName = 'Dwek'),
        (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'Japanese'),
        'Sushi Salad',300,'2020-05-03','2020-09-04',null
union select (select u.userId from users u where u.UserLastName = 'Cohen'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'French'),
    'French Beguette',459,'2019-12-17','2021-09-06',null
union select (select u.userId from users u where u.UserLastName = 'Lan'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'Hawaiian'),
    'Chicken steak and vegi Kabbob',489,'2020-04-29','2020-05-29',null
union select (select u.userId from users u where u.UserLastName = 'Loewy'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'Japanese'),
    'Sesame chicken',489,'2020-04-29','2020-05-29',null
union select (select u.userId from users u where u.UserLastName = 'Cohen'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'French'),
    'Chocolate Hazelnut Pastry Twist',234,'2020-04-29','2020-05-29',null
union select (select u.userId from users u where u.UserLastName = 'Schapira'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'Italian'),
    'Pizza Rolls',390,'2020-12-23','2021-12-12','2022-01-10'
union select (select u.userId from users u where u.UserLastName = 'Schapira'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'French'),
    'Chocolate Souffle',750,'2020-12-12','2021-03-09',null
union select (select u.userId from users u where u.UserLastName = 'Cohen'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'French'),
    'French Toast',675,'2020-04-28','2021-04-28','2022-01-01'
union select (select u.userId from users u where u.UserLastName = 'Dwek'),
    (select c.CuisineTypeId from CuisineType c where c.CuisineTypeName = 'French'),
    'French Fries',1000,'2019-12-12',null,null






insert RecipeIngredient(RecipeId,IngredientID,MeasurementTypeId,MeasurementQuantity,IngredientSequence)
select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Homemade French croissants'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Homemade French croissants'
    and i.IngredientName = 'eggs'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Homemade French croissants'
    and i.IngredientName = 'Butter'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Homemade French croissants'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Homemade French croissants'
    and i.IngredientName = 'Vanilla Sugar'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Homemade French croissants'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Onion Soup'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Onion Soup'
    and i.IngredientName = 'butter'
    and m.MeasurementTypeName = 'cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Onion Soup'
    and i.IngredientName = 'onion'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Onion Soup'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Onion Soup'
    and i.IngredientName = 'Sugar'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Onion Soup'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'The Real Pizza'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'The Real Pizza'
    and i.IngredientName = 'eggs'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'The Real Pizza'
    and i.IngredientName = 'Butter'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'The Real Pizza'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,2,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'The Real Pizza'
    and i.IngredientName = 'Tomatoe Sauce'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'The Real Pizza'
    and i.IngredientName = 'Cheese'
    and m.MeasurementTypeName = 'Cup(s)'


union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Apple Muffin'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Apple Muffin'
    and i.IngredientName = 'eggs'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Apple Muffin'
    and i.IngredientName = 'honey'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Apple Muffin'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Apple Muffin'
    and i.IngredientName = 'apple sauce'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Apple Muffin'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Sushi Salad'
    and i.IngredientName = 'sushi rice'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Sushi Salad'
    and i.IngredientName = 'kani'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Sushi Salad'
    and i.IngredientName = 'carrot'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Sushi Salad'
    and i.IngredientName = 'avacodo'
    and m.MeasurementTypeName = 'medium'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Sushi Salad'
    and i.IngredientName = 'sweet sauce'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.25,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Sushi Salad'
    and i.IngredientName = 'spicy mayo'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,7
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Sushi Salad'
    and i.IngredientName = 'sweet potatoe'
    and m.MeasurementTypeName = 'large'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Beguette'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Beguette'
    and i.IngredientName = 'eggs'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Beguette'
    and i.IngredientName = 'Butter'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName ='French Beguette'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Beguette'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,16,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chicken steak and vegi Kabbob'
    and i.IngredientName = 'steak'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,10,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName ='Chicken steak and vegi Kabbob'
    and i.IngredientName ='chicken'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chicken steak and vegi Kabbob'
    and i.IngredientName = 'pepper'
    and m.MeasurementTypeName = 'medium'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chicken steak and vegi Kabbob'
    and i.IngredientName = 'onion'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName ='Chicken steak and vegi Kabbob'
    and i.IngredientName = 'sweet potatoe'
    and m.MeasurementTypeName = 'Large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chicken steak and vegi Kabbob'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,2,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chicken steak and vegi Kabbob'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'


union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'sesame chicken'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'sesame chicken'
    and i.IngredientName = 'eggs'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,16,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'sesame chicken'
    and i.IngredientName = 'chicken'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'sesame chicken'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'sesame chicken'
    and i.IngredientName = 'Teriaki sauce'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'sesame chicken'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'


union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Hazelnut Pastry Twist'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName ='Chocolate Hazelnut Pastry Twist'
    and i.IngredientName = 'eggs'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Hazelnut Pastry Twist'
    and i.IngredientName = 'Butter'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Hazelnut Pastry Twist'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Hazelnut Pastry Twist'
    and i.IngredientName = 'Vanilla Sugar'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Hazelnut Pastry Twist'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,7
    from recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Hazelnut Pastry Twist'
    and i.IngredientName = 'cocoa'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Pizza Rolls'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName ='Pizza Rolls'
    and i.IngredientName = 'eggs'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Pizza Rolls'
    and i.IngredientName = 'Butter'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Pizza Rolls'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Pizza Rolls'
    and i.IngredientName = 'cheese'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Pizza Rolls'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'


union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,7
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Pizza Rolls'
    and i.IngredientName = 'tomatoe sauce'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Souffle'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Souffle'
    and i.IngredientName = 'eggs'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Souffle'
    and i.IngredientName = 'Butter'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Souffle'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName ='Chocolate Souffle'
    and i.IngredientName = 'Vanilla Sugar'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Souffle'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,7
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Souffle'
    and i.IngredientName = 'cocoa'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,8
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'Chocolate Souffle'
    and i.IngredientName = 'chocolate chips'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Toast'
    and i.IngredientName = 'bread loaf'
    and m.MeasurementTypeName = 'medium'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,4,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Toast'
    and i.IngredientName = 'eggs'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,3,3
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName ='French Toast'
    and i.IngredientName = 'Butter'
    and m.MeasurementTypeName = 'oz'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Toast'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Toast'
    and i.IngredientName = 'Vanilla Sugar'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Toast'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'

union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,1
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Fries'
    and i.IngredientName = 'Flour'
    and m.MeasurementTypeName = 'Cup(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,5,2
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Fries'
    and i.IngredientName = 'Potatoes'
    and m.MeasurementTypeName = 'large'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,.5,4
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Fries'
    and i.IngredientName = 'salt'
    and m.MeasurementTypeName = 'teaspoon(s)'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,5
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName ='French Fries'
    and i.IngredientName = 'pepper'
    and m.MeasurementTypeName = 'Tbsp'
union select r.recipeId,i.Ingredientid,m.MeasurementTypeId,1,6
    from Recipe r 
    cross join Ingredient i 
    cross join MeasurementType m 
    where r.RecipeName = 'French Fries'
    and i.IngredientName = 'oil'
    and m.MeasurementTypeName = 'Cup(s)'

insert step(RecipeID,StepDesc,StepSequence)
select (select r.recipeId from recipe r where r.RecipeName = 'Homemade French croissants'),'Mix together eggs,oil,sugar,flour,salt,vanilla sugar',1
union select (select r.recipeId from recipe r where r.RecipeName = 'Homemade French croissants'),'Knead the dough until smooth',2
union select (select r.recipeId from recipe r where r.RecipeName = 'Homemade French croissants'),'Roll into croissant shapes',3
union select (select r.recipeId from recipe r where r.RecipeName = 'Homemade French croissants'),'Bake on 350 from 30 min',4
union select (select r.recipeId from recipe r where r.RecipeName = 'French Onion Soup'),'chop the onions',1
union select (select r.recipeId from recipe r where r.RecipeName = 'French Onion Soup'),'saute in oil until golden',2
union select (select r.recipeId from recipe r where r.RecipeName = 'French Onion Soup'),'add flour,water and other ingredients',3
union select (select r.recipeId from recipe r where r.RecipeName = 'French Onion Soup'),'let it simmer on a medium flame for 2 hours',4
union select (select r.recipeId from recipe r where r.RecipeName = 'The Real Pizza'),'mix together ingredients for the dough',1
union select (select r.recipeId from recipe r where r.RecipeName = 'The Real Pizza'),'Kneed the dough until smooth',2
union select (select r.recipeId from recipe r where r.RecipeName = 'The Real Pizza'),'roll it out into an 18 inch pie',3
union select (select r.recipeId from recipe r where r.RecipeName = 'The Real Pizza'),'spread sauce and cheese and bake on 400 for 20 min',4
union select (select r.recipeId from recipe r where r.RecipeName = 'Apple Muffin'),'mix together the dry ingredients and set aside',1
union select (select r.recipeId from recipe r where r.RecipeName = 'Apple Muffin'),'in a separate bowl beat the eggs and add applauce ane honey',2
union select (select r.recipeId from recipe r where r.RecipeName = 'Apple Muffin'),'slowly add the dry ingredients',3
union select (select r.recipeId from recipe r where r.RecipeName = 'Apple Muffin'),'bake muffins at 350 for 30 min',4
union select (select r.recipeId from recipe r where r.RecipeName = 'sushi salad'),'cook the sushi rice according to the directions on package',1
union select (select r.recipeId from recipe r where r.RecipeName =  'sushi salad'),'roast or deep fry the sweet potatoe',2
union select (select r.recipeId from recipe r where r.RecipeName =  'sushi salad'),'chop the carrot and slice the avacodo',3
union select (select r.recipeId from recipe r where r.RecipeName =  'sushi salad'),'mix together desired toppings and drizzle with spicy mayo and sweet sauce',4
union select (select r.recipeId from recipe r where r.RecipeName = 'French Beguette'),'mix all ingredients together and set aside to rise',1
union select (select r.recipeId from recipe r where r.RecipeName = 'French Beguette'),'After dough doubles in size roll into 6 inch beguette',2
union select (select r.recipeId from recipe r where r.RecipeName ='French Beguette'),'smear with an egg',3
union select (select r.recipeId from recipe r where r.RecipeName = 'French Beguette'),'set oven to 350 and bake for 40 min or until golden',4
union select (select r.recipeId from recipe r where r.RecipeName ='Chicken steak and vegi Kabbob'),'cut the chicken and steaks into one inch cubes',1
union select (select r.recipeId from recipe r where r.RecipeName ='Chicken steak and vegi Kabbob'),'slice the vegies into wedges',2
union select (select r.recipeId from recipe r where r.RecipeName ='Chicken steak and vegi Kabbob'),'slide the squares onto the skewer in desired pattern',3
union select (select r.recipeId from recipe r where r.RecipeName ='Chicken steak and vegi Kabbob'),'grill the kabbobs ont medium heat',4
union select (select r.recipeId from recipe r where r.RecipeName ='sesame chicken'),'cut the chicken one inch cubes',1
union select (select r.recipeId from recipe r where r.RecipeName ='sesame chicken'),'bread the pieces of chicken in flour and spices',2
union select (select r.recipeId from recipe r where r.RecipeName ='sesame chicken'),'deep fry the breded chicken until crispy',3
union select (select r.recipeId from recipe r where r.RecipeName ='sesame chicken'),'In a pan,mix it with teriyaki sauce and put in oven for 10 min',4
union select (select r.recipeId from recipe r where r.RecipeName ='Chocolate Hazelnut Pastry Twist'),'mix together all ingredients for the dough and set aside to rise',1
union select (select r.recipeId from recipe r where r.RecipeName ='Chocolate Hazelnut Pastry Twist'),'divide the dough into four parts',2
union select (select r.recipeId from recipe r where r.RecipeName ='Chocolate Hazelnut Pastry Twist'),'roll out each section of dough and fill with chocolate filling',3
union select (select r.recipeId from recipe r where r.RecipeName ='Chocolate Hazelnut Pastry Twist'),'roll up the choc filled dough and slice into 3 inch twists',4
union select (select r.recipeId from recipe r where r.RecipeName ='Chocolate Hazelnut Pastry Twist'),'Bake on 350 for 30 min',5
union select (select r.recipeId from recipe r where r.RecipeName ='Pizza Rolls'),'mix together all ingredients for the dough and set aside to rise',1
union select (select r.recipeId from recipe r where r.RecipeName ='Pizza Rolls'),'divide the dough into four parts',2
union select (select r.recipeId from recipe r where r.RecipeName ='Pizza Rolls'),'roll out each section of dough and fill sauce and cheese',3
union select (select r.recipeId from recipe r where r.RecipeName ='Pizza Rolls'),'roll up the  filled dough and slice into 3 inch pizza rolls and bake',4
union select (select r.recipeId from recipe r where r.RecipeName ='Chocolate Souffle'),'melt the chocolate butter and oil over a low flame',1
union select (select r.recipeId from recipe r where r.RecipeName ='Chocolate Souffle'),'slowly add the eggs sugar and flour',2
union select (select r.recipeId from recipe r where r.RecipeName ='Chocolate Souffle'),'add the rest of the ingredients and mix well',3
union select (select r.recipeId from recipe r where r.RecipeName ='Chocolate Souffle'),'divide the batter into ramkins and bake on 425 for 15 min',4
union select (select r.recipeId from recipe r where r.RecipeName ='French Toast'),'beat the eggs',1
union select (select r.recipeId from recipe r where r.RecipeName ='French Toast'),'Dip each slice of bread into the beaten egg',2
union select (select r.recipeId from recipe r where r.RecipeName ='French Toast'),'Heat up oil in a frying pan',3
union select (select r.recipeId from recipe r where r.RecipeName ='French Toast'),'Fry each slice for about 2 min on each side',4
union select (select r.recipeId from recipe r where r.RecipeName ='French Fries'),'Slice the potatoes into wedges',1
union select (select r.recipeId from recipe r where r.RecipeName ='French Fries'),'cover in flour salt and pepper',2
union select (select r.recipeId from recipe r where r.RecipeName ='French Fries'),'Heat up oil in a frying pan',3
union select (select r.recipeId from recipe r where r.RecipeName ='French Fries'),'Test the oil to make sure its hot and fry french fries until crispy',4



insert Course(CourseName,CourseSequence)
select 'Appetizer',1
union select 'Main Dish',2
union select 'Dessert',3



insert meal(UserId,MealTitle,DateMealCreated,MealActive)
select (select u.userId from Users u where u.UserLastName = 'Dwek'),'Sun Basket','2020-12-23',1
union select (select u.userId from Users u where u.UserLastName = 'Loewy'),'Feast Favour','2021-02-12',1
union select (select u.userId from Users u where u.UserLastName = 'Cohen'),'Plate Joy','2022-01-01',1
union select (select u.userId from Users u where u.UserLastName = 'Leon'),'Modern Meal','2020-07-02',0
union select (select u.userId from Users u where u.UserLastName = 'Dwek'),'Eat Dessert First!','2022-02-01',1
union select (select u.userId from Users u where u.UserLastName = 'Schapira'),'Chef''s Best','2021-09-23',1
union select (select u.userId from Users u where u.UserLastName = 'Leon'),'Upper Crust','2021-12-13',1
union select (select u.userId from Users u where u.UserLastName = 'Cohen'),'Tasty Bite','2021-09-23',1
union select (select u.userId from Users u where u.UserLastName = 'Lan'),'Fresh n fit','2019-04-21',1
union select (select u.userId from Users u where u.UserLastName = 'Lan'),'Dinner Swift','2021-08-12',1
union select (select u.userId from Users u where u.UserLastName = 'Dwek'),'Dine Diana','2021-06-12',1



insert MealCourse(CourseId,MealId)
select c.CourseId,m.MealId 
from Meal m 
cross join Course c  
where m.MealTitle not in ('Sun Basket','Tasty Bite')


insert MealCourse(CourseId,MealId)
select (select c.CourseId from Course c where c.CourseName = 'Main Dish'),(select m.MealId from meal m where m.MealTitle = 'Sun Basket')
union select (select c.CourseId from Course c where c.CourseName = 'Dessert'),(select m.MealId from meal m where m.MealTitle = 'Tasty Bite')


insert RecipeMealCourse(RecipeId,MealCourseId,DishTypeMain)
select (select r.RecipeId from Recipe r where r.RecipeName = 'French Toast'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Sun Basket' and c.CourseName = 'Main Dish'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Muffin'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Tasty Bite' and c.CourseName = 'Dessert'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Sushi Salad'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Feast Favour' and c.CourseName = 'appetizer'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chicken steak and vegi Kabbob'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Feast Favour' and c.CourseName = 'Main Dish'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'French Fries'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Feast Favour' and c.CourseName = 'Main Dish'),0
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Souffle'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Feast Favour' and c.CourseName = 'Dessert'),1
union select (select r.RecipeId from Recipe r where r.RecipeName ='Homemade French croissants'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Plate Joy' and c.CourseName = 'appetizer'),1
union select (select r.RecipeId from Recipe r where r.RecipeName ='sesame chicken'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Plate Joy' and c.CourseName = 'Main Dish'),1
union select (select r.RecipeId from Recipe r where r.RecipeName ='Chocolate Hazelnut Pastry Twist'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Plate Joy' and c.CourseName = 'Dessert'),1
union select (select r.RecipeId from Recipe r where r.RecipeName ='French onion Soup'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Modern Meal' and c.CourseName = 'appetizer'),1
union select (select r.RecipeId from Recipe r where r.RecipeName ='French Beguette'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Modern Meal' and c.CourseName = 'appetizer'),0
union select (select r.RecipeId from Recipe r where r.RecipeName = 'The Real Pizza' ),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle ='Modern Meal' and c.CourseName = 'Main Dish'),1
union select (select r.RecipeId from Recipe r where r.RecipeName ='Chocolate Souffle'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Eat Dessert First!' and c.CourseName = 'Dessert'),1
union select (select r.RecipeId from Recipe r where r.RecipeName ='French Fries'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Eat Dessert First!' and c.CourseName = 'Appetizer'),1
union select (select r.RecipeId from Recipe r where r.RecipeName ='Pizza Rolls'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Eat Dessert First!' and c.CourseName = 'Main Dish'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Homemade French croissants'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Chef''s Best' and c.CourseName = 'Appetizer'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chicken steak and vegi Kabbob'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Chef''s Best' and c.CourseName = 'Main Dish'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Muffin'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Chef''s Best' and c.CourseName = 'Dessert'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'French Fries'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Upper Crust' and c.CourseName = 'appetizer'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'The Real Pizza'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Upper Crust' and c.CourseName = 'Main Dish'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Homemade French croissants'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Upper Crust' and c.CourseName = 'Dessert'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Fresh n fit' and c.CourseName = 'appetizer'),1
union select (select r.RecipeId from Recipe r where r.RecipeName =  'Chicken steak and vegi Kabbob'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Fresh n fit' and c.CourseName ='Main Dish'),1
union select (select r.RecipeId from Recipe r where r.RecipeName =  'Apple Muffin'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Fresh n fit' and c.CourseName ='Dessert'),1
union select (select r.RecipeId from Recipe r where r.RecipeName =  'French Fries'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Dinner Swift' and c.CourseName ='appetizer'),1
union select (select r.RecipeId from Recipe r where r.RecipeName =  'sesame chicken'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Dinner Swift' and c.CourseName ='Main Dish'),1
union select (select r.RecipeId from Recipe r where r.RecipeName =  'Chocolate Hazelnut Pastry Twist'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle = 'Dinner Swift' and c.CourseName ='Dessert'),1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'French Beguette'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle ='Dine Diana' and c.CourseName ='appetizer'),1
union select (select r.RecipeId from Recipe r where r.RecipeName =  'Pizza Rolls'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle ='Dine Diana' and c.CourseName ='Main Dish'),1
    union select (select r.RecipeId from Recipe r where r.RecipeName =  'Apple Muffin'),
    (select mc.MealCourseId from MealCourse mc join meal m on m.MealId = mc.MealId join course c on c.CourseId = mc.CourseId where m.MealTitle ='Dine Diana' and c.CourseName ='Dessert'),1




insert Cookbook(UserId,CookbookTitle,Price,DateCookbookCreated,CookbookActive)
select u.UserId,'#1 Chef',25.99,'2020-01-01',1 from Users u where u.UserLastName = 'Cohen'
union select u.UserId, 'Fairytale Flavors',21.99,'2021-01-01',1 from Users u where u.UserLastName = 'Dwek'
union select u.UserId ,'Full of Flavor',26.99,'2020-10-01',1 from Users u where u.UserLastName = 'Lan'



insert RecipeCookbook(RecipeId,CookbookId,RecipeSequence)
select r.recipeId,c.CookbookId,1
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = '#1 Chef'
    and r.RecipeName = 'Homemade French croissants'
union select r.recipeId,c.CookbookId,2
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = '#1 Chef'
    and r.RecipeName = 'French Beguette'
union select r.recipeId,c.CookbookId,3
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = '#1 Chef'
    and r.RecipeName = 'Chocolate Hazelnut Pastry Twist'
union select r.recipeId,c.CookbookId,4
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = '#1 Chef'
    and r.RecipeName = 'French Toast'
union select r.recipeId,c.CookbookId,5
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = '#1 Chef'
    and r.RecipeName = 'Chicken steak and vegi Kabbob'
union select r.recipeId,c.CookbookId,1
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Fairytale Flavors'
    and r.RecipeName ='Apple Muffin'
union select r.recipeId,c.CookbookId,2
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Fairytale Flavors'
    and r.RecipeName ='Sushi Salad'

union select r.recipeId,c.CookbookId,3
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Fairytale Flavors'
    and r.RecipeName ='French Fries'

union select r.recipeId,c.CookbookId,4
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Fairytale Flavors'
    and r.RecipeName ='sesame Chicken'

union select r.recipeId,c.CookbookId,5
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Fairytale Flavors'
    and r.RecipeName ='Chocolate Hazelnut Pastry Twist'
union select r.recipeId,c.CookbookId,6
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Fairytale Flavors'
    and r.RecipeName ='Pizza Rolls'
union select r.recipeId,c.CookbookId,1
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Full of Flavor'
    and r.RecipeName = 'The Real Pizza'
union select r.recipeId,c.CookbookId,2
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Full of Flavor'
    and r.RecipeName = 'French Beguette'
    union select r.recipeId,c.CookbookId,3
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Full of Flavor'
    and r.RecipeName = 'French onion Soup'
    union select r.recipeId,c.CookbookId,4
    from Recipe r 
    cross join Cookbook c 
    where c.CookbookTitle = 'Full of Flavor'
    and r.RecipeName = 'Chocolate Souffle'