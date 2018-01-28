ALTER TABLE [dbo].[Calendar] DROP CONSTRAINT if exists [FK_Calendar_Listings]
GO
ALTER TABLE [dbo].Hosts DROP CONSTRAINT if exists FK_Hosts_Location
GO
ALTER TABLE [dbo].Listings DROP CONSTRAINT if exists FK_Listings_Hosts
GO
ALTER TABLE [dbo].Review DROP CONSTRAINT if exists FK_Review_Listings
GO
ALTER TABLE [dbo].Review DROP CONSTRAINT if exists FK_Review_Reviewers
GO



truncate table Calendar
truncate table Reviewers
truncate table review
truncate table Listings
truncate table Hosts
truncate table Location