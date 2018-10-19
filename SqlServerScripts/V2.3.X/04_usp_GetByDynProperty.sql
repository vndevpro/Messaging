create proc [dbo].[usp_GetByDynProperty]
	@key varchar(100),
	@value nvarchar(max)
as
begin
	select * from dbo.Messages
	where MetadataXml.value('(/items/item/@key)[1]', 'varchar(max)') = @key
			and MetadataXml.value('(/items/item/@value)[1]', 'varchar(max)') = @value
end
GO
