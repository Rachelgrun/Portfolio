create or alter procedure dbo.DevSubsectionElementGet(
    @DevSubSectionElementId int =0,
    @All bit = 0, 
    @Message varchar(500)='' output 
    )
    as
    begin 
    select 
    d.DevSubsectionElementId,
d.DevSubsectionId,
s.DevSubsectionCode,
d.DevSubsectionElementCode,
d.ButtonText,
d.HtmlTag,
d.FileExtension,
DevSubsectionElementSequence = row_number() over(partition by s.DevSubsectionCode order by d.DevSubsectionElementPriority)

    from DevSubsectionElement d
    join DevSubsection s
    on s.DevSubsectionId = d.DevSubsectionId
    where d.DevSubsectionElementId = isnull(@DevSubSectionElementId,0)
    or @All = isnull(@All,0)
    order by DevSubsectionCode, DevSubsectionElementSequence

    end
go
    exec DevSubSectionElementGet @All = 1