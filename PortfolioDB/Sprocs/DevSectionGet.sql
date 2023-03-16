create or alter procedure dbo.DevSectionGet(
    @DevSectionId int = 0,
    @All bit = 0,
    @Message varchar(1000)= '' output)
as 
begin 
    select @DevSectionId = ISNULL(@DevSectionId,0) 
    
   
    select
    ds.DevSectionId,
     ds.DevSectionName,
    ds.DevSectionCode,
    ds.DevSectionOverview,
    ds.DevSectionBlurb,
    ds.HasPicture,
    ds.DevSectionSequenceNum
    from DevSection ds
    where ds.DevSectionId = isnull(@DevSectionId,0)
    or @All = 1

    order by ds.DevSectionSequenceNum
  
end 

go 
exec DevSectionGet @All =1


