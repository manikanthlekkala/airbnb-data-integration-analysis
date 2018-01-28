ALTER TABLE [dbo].[Calendar]  WITH CHECK ADD  CONSTRAINT [FK_Calendar_Listings] FOREIGN KEY([listing_id])
REFERENCES [dbo].[Listings] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[Calendar] CHECK CONSTRAINT [FK_Calendar_Listings]
ALTER TABLE [dbo].[Hosts]  WITH CHECK ADD  CONSTRAINT [FK_Hosts_Location] FOREIGN KEY([location_id])
REFERENCES [dbo].[Location] ([location_id])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[Hosts] CHECK CONSTRAINT [FK_Hosts_Location]
ALTER TABLE [dbo].[Listings]  WITH CHECK ADD  CONSTRAINT [FK_Listings_Hosts] FOREIGN KEY([host_id])
REFERENCES [dbo].[Hosts] ([host_id])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[Listings] CHECK CONSTRAINT [FK_Listings_Hosts]
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Listings] FOREIGN KEY([listing_id])
REFERENCES [dbo].[Listings] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Listings]
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Reviewers] FOREIGN KEY([reviewer_id])
REFERENCES [dbo].[Reviewers] ([reviewer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Reviewers]