-- LL 99% Great Job! Please fix one more comment and resubmit.
create or alter procedure dbo.RecipeUpdate(
@RecipeId int output,
@CreatedByUserId int,
@CuisineId int,
@RecipeName varchar(80),
@CalorieCount int,
@DateDrafted date,
@DatePublished date = null,
@DateArchived date = null

)
as
begin 
         select @RecipeId = ISNULL(@RecipeId,0), @CalorieCount = ISNULL(@CalorieCount, 0)
   
    if @RecipeId = 0
        begin
        -- LL these isnulls should happen for both insert and update they shouldn't only happen in the insert 
   
        if ISNULL(@CreatedByUserId,0) = 0
            begin
                select top 1 @CreatedByUserId = u.UserId
                from Users u 
            end
        if ISNULL(@CuisineId,0) = 0
            begin
                select top 1 @CuisineId = c.CuisineTypeId
                from CuisineType c 
            end    
            insert Recipe(CreatedByUserId, CuisineTypeId, RecipeName,Calories, DateRecipeCreated, DatePublished, DateArchived)
            values(@CreatedByUserId, @CuisineId, @RecipeName, @CalorieCount, @DateDrafted, @DatePublished, @DateArchived)
    
            select @RecipeId = scope_identity()
    end
    else
    begin
        update r 
        set
            CreatedByUserId = r.CreatedByUserId,
            CuisineTypeId = r.CuisineTypeId,
            RecipeName = @RecipeName,
            Calories = @CalorieCount,
            DateDrafted= @DateDrafted,
            DatePublished = @DatePublished,
            DateArchived = @DateArchived
        from Recipe r 
        where r.RecipeId = @RecipeId
    end
end