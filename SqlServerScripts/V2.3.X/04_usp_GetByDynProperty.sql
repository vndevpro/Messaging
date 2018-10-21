create proc [dbo].[usp_GetByDynProperty]
	@key varchar(100),
	@value nvarchar(max)
as
begin
	select m.*
	from dbo.Messages m
		cross apply m.MetadataXml.nodes('items/item') as x(i)
	where x.i.value('(@key)[1]', 'varchar(max)') = @key
	and x.i.value('(@value)[1]', 'nvarchar(max)') = @value
end
GO
