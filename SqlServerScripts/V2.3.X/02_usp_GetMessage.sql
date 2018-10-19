/****** Object:  StoredProcedure [dbo].[usp_GetMessage]    Script Date: 09/17/2018 16:34:18 ******/
create proc [dbo].[usp_GetMessage]
	@id int
as
begin
	select * from dbo.Messages
	where Id = @id
end
GO


