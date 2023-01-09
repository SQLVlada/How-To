-- "Your_Table" has DayTime column with NVARCHAR(20) data that needs to be in SMALLDATETIME YYYY-MM-DD HH:MM:SS format --
update Your_Table
set DayTime = convert(nvarchar(20),convert(smalldatetime, DayTime, 105))
alter table Your_Table
alter column DayTime smalldatetime;