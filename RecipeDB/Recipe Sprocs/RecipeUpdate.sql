-- LL Great Job! 
create or alter procedure dbo.RecipeUpdate(
@RecipeId int output,
@CreatedByUserId int,
@CuisineTypeId int,
@RecipeName varchar(80),
@Calories int,
@DateDrafted date output,
@DatePublished date = null output,
@DateArchived date = null output,
@NumberOfIngredients int = 0 output,
@NumberOfSteps int = 0 output,
@RecipeStatus varchar(15) = '' output,
@CuisineTypeName varchar(100) ='' output,
@UserFullName varchar(150) ='' output,
@code varchar (250) ='' output,
@Message varchar(1000) = '' output

)
as
begin 


declare @Return int = 0
    
    select @RecipeId = ISNULL(@RecipeId,0), @Calories = ISNULL(@Calories, 0)


    if(@CuisineTypeId = (select c.CuisineTypeId from cuisinetype c where c.cuisineTypeName = 'Zero Calorie') )and @Calories > 0 
    begin 
    select @return = 1, @Message = 'A "Zero Calorie" Cuisine Type must be zero calories'
    goto Finished
    end 

    if @RecipeId = 0
        begin

            
            insert Recipe(CreatedByUserId, CuisineTypeId, RecipeName,Calories, DateDrafted, DatePublished, DateArchived)
            values(@CreatedByUserId, @CuisineTypeId, @RecipeName, @Calories, @DateDrafted, @DatePublished, @DateArchived)
    
            select @RecipeId = scope_identity()
    end
    else
    begin


        update r 
        set
            CreatedByUserId = @createdByUserId,
            CuisineTypeId = @CuisineTypeId,
            RecipeName = @RecipeName,
            Calories = @Calories,
            DateDrafted= @DateDrafted,
            DatePublished = @DatePublished,
            DateArchived = @DateArchived
         
           
        from Recipe r 
        where r.RecipeId = @RecipeId
    end


    select @NumberOfIngredients = count (distinct ri.IngredientID)
    from Recipe r 
    join RecipeIngredient ri 
    on r.RecipeId = ri.RecipeId
    where r.RecipeId  =  @RecipeId
    group by r.RecipeId

        select @NumberOfSteps = COUNT(distinct s.StepDesc)
    from Recipe r 
    join Step s 
    on r.RecipeId = s.RecipeID 
    where r.RecipeId  =  @RecipeId
    group by r.RecipeId


    select @RecipeStatus = r.RecipeStatus from recipe r where r.recipeId = @RecipeId
    select @code = code from recipe r where r.RecipeId = @RecipeId
  
    Finished:
    return @Return 
end


go 
