USE [PortfolioDB]
GO
/****** Object:  StoredProcedure [dbo].[DevSubsectionElementGet]    Script Date: 4/3/2023 5:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   procedure [dbo].[DevSubsectionElementGet](
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
s.URL,
DevSubsectionElementSequence = row_number() over(partition by s.DevSubsectionCode order by d.DevSubsectionElementPriority)

    from DevSubsectionElement d
    join DevSubsection s
    on s.DevSubsectionId = d.DevSubsectionId
    where d.DevSubsectionElementId = isnull(@DevSubSectionElementId,0)
    or @All = isnull(@All,0)
    order by DevSubsectionCode, DevSubsectionElementSequence

    end
	go 
	grant execute on DevSectionGet to portfolio_role