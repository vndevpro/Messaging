/****** Object:  StoredProcedure [dbo].[usp_GetUnSentMessages]    Script Date: 09/17/2018 16:34:41 ******/
create proc [dbo].[usp_GetUnSentMessages]
as
begin
	select * from dbo.Messages
	where DelivieredAt is null
end
GO
