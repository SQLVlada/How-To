-- Declare variable and Read the JSON file as NVARCHAR(MAX)--
declare @json nvarchar(max)
select @json = BulkColumn
from openrowset (bulk 'PATH TO .json FILE', single_clob) as JSONTable
-- Check if the JSON is properly formated--
select isjson(@json)
-- See if the JSON is a single row field--
select @json as 'JSON Table'
-- Create a Table from Single row field --
select * into IoT_Table from
openjson(@json)
with (	ID	varchar(200)	'$.id',
		Room	varchar(200)	'$.room_id',
		DayTime	nvarchar(20)	'$.noted_date',
		Temp	int	'$.temp',
		Loc		char(3)			'$.location');