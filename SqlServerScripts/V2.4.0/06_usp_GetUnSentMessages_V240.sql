IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetUnSentMessages]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetUnSentMessages]
GO

create proc [dbo].[usp_GetUnSentMessages]
as
begin
	select m.* from dbo.Messages m
		cross apply m.MetadataXml.nodes('items/item') as x(i)
	where DelivieredAt is null
	and [Status] <> 'Done'
	and x.i.value('(@key)[1]', 'varchar(max)') = 'DeliveryType'
	and x.i.value('(@value)[1]', 'nvarchar(max)') in ('Mail', 'SMS')
end
GO
