--AS 100%
/*
Recipe Schema:


Ingredients
    PK
    IngredientName Varchar(50) not null not blank 
    Unique

MeasurementType
    PK
    MeasurementTypeName Varchar(15) not null not blank     
    Unique
User
    PK 
    UserFirstName varchar(20) not null  not blank 
    UserLastName Varchar(30) not null not blank
    UserPassword varchar (15) not null not blank
    Unique FirstName,LastName,Password

CuisineType
    PK
    CuisineTypeName varchar (15) not null cannot be blank 
    Unique




Recipe
    PK
    RecipeStatusId not null (FK RecipeStatus)
    CreatedByUserId not null (FK User)
    CuisineTypeId not null (FK CuisineType)
    RecipeName Varchar (100) not null not blank  unique
    Calories int not null must be greater than zero
    DateRecipeCreated date not null  not in future default getdate after the website was created
    DatePublished date null  not in future
    DateArchived date null   not in future
    RecipeStatus as case when then 
    when date published and date archived is null then 'Drafted'
    when date published is not null and date archived is null then 'Published'
    when dateArchived is not null then archived 
    end 
    constraint datepublished should be after dateDrafted
   Constraint date archived should be after date published






RecipeIngredient
    PK    
    RecipeId not null (FK Recipe)
    IngredientID not null (FK Ingredient)
    MeasurmentTypeId not null (FK MeasurementType)
    MeasurementQuantity Decimal (5,2) not null must be greater than zero
    IngredientSequence int not null must be greater than zero
   RecipeId,IngredientID unique 



Step
    PK
    RecipeID not null (fk Recipe)
    StepDesc Varchar(300) not null cannot be blank
    StepSequence int not null must be greater than zero
    StepSequence,recipeId unique 

Course
    PK
    CourseName Varchar(20) not null cannot be blank unique 
    CourseSequence int not null must be greater than zero


Meal
    PK
    UserId (FK user)
    MealTitle varchar (100) not null cannot be blank
    DateMealCreated date not null default getdate  not in future after website was created
    MealActive bit not null default 1
    UserId,MealTitle unique 


 MealCourse
    PK
    CourseId not null (FK Course)
    MealId not null (FK Meal)
    CourseId,MealId unique

RecipeMealCourse
    PK
    RecipeId not null (FK Recipe)
    MealCourseId not null (FK MealCourse)
    DishTypeMain bit not null default 1
    constraint in side or main 
    RecipeId,MealCourseId unique


Cookbook
    PK
    UserId not null (FK User)
    CookbookTitle varchar (30) not null cannot be blank unique
    Price decimal(5,2) not null must be greater than zero
    DateCookbookCreated date not null default getdate not future after website created 
    CookbookActive bit not null default 1 
    unique CookbookTitle,UserId

RecipeCookBook
    PK
    RecipeId not null(FK Recipe)
    CookbookId not null (FK CookBook)
    RecipeSequence int not null must be greater than zero
 
