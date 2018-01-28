USE [master]
GO
/****** Object:  Database [Airbnb]    Script Date: 5/10/2017 1:23:16 AM ******/
CREATE DATABASE [Airbnb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Airbnb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Airbnb.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Airbnb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Airbnb_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Airbnb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Airbnb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Airbnb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Airbnb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Airbnb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Airbnb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Airbnb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Airbnb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Airbnb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Airbnb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Airbnb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Airbnb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Airbnb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Airbnb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Airbnb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Airbnb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Airbnb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Airbnb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Airbnb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Airbnb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Airbnb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Airbnb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Airbnb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Airbnb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Airbnb] SET RECOVERY FULL 
GO
ALTER DATABASE [Airbnb] SET  MULTI_USER 
GO
ALTER DATABASE [Airbnb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Airbnb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Airbnb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Airbnb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Airbnb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Airbnb', N'ON'
GO
ALTER DATABASE [Airbnb] SET QUERY_STORE = OFF
GO
USE [Airbnb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Airbnb]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 5/10/2017 1:23:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[listing_id] [int] NULL,
	[date] [datetime] NULL,
	[available] [nvarchar](255) NULL,
	[price] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hosts]    Script Date: 5/10/2017 1:23:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hosts](
	[host_id] [int] NOT NULL,
	[host_name] [nvarchar](255) NULL,
	[host_url] [nvarchar](255) NULL,
	[host_since] [datetime] NULL,
	[location_id] [int] NULL,
	[host_response_rate] [int] NULL,
	[host_acceptance_rate] [int] NULL,
	[host_is_superhost] [nvarchar](255) NULL,
	[host_has_profile_pic] [nvarchar](255) NULL,
	[host_identity_verified] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[host_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Listings]    Script Date: 5/10/2017 1:23:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listings](
	[id] [int] NOT NULL,
	[listing_url] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[host_id] [int] NULL,
	[street] [nvarchar](255) NULL,
	[property_type] [nvarchar](255) NULL,
	[room_type] [nvarchar](255) NULL,
	[accommodates] [int] NULL,
	[bedrooms] [int] NULL,
	[beds] [int] NULL,
	[amenities] [nvarchar](max) NULL,
	[number_of_reviews] [int] NULL,
	[review_scores_rating] [int] NULL,
	[review_scores_accuracy] [int] NULL,
	[review_scores_cleanliness] [int] NULL,
	[review_scores_checkin] [int] NULL,
	[review_scores_communication] [int] NULL,
	[review_scores_location] [int] NULL,
	[review_scores_value] [int] NULL,
	[instant_bookable] [nvarchar](255) NULL,
	[cancellation_policy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 5/10/2017 1:23:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[location_id] [int] NOT NULL,
	[host_location] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/10/2017 1:23:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[id] [int] NOT NULL,
	[reviewer_id] [int] NULL,
	[listing_id] [int] NULL,
	[date] [datetime] NULL,
	[comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviewers]    Script Date: 5/10/2017 1:23:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviewers](
	[reviewer_id] [int] NOT NULL,
	[reviewer_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[reviewer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Calendar]  WITH CHECK ADD  CONSTRAINT [FK_Calendar_Listings] FOREIGN KEY([listing_id])
REFERENCES [dbo].[Listings] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Calendar] CHECK CONSTRAINT [FK_Calendar_Listings]
GO
ALTER TABLE [dbo].[Hosts]  WITH CHECK ADD  CONSTRAINT [FK_Hosts_Location] FOREIGN KEY([location_id])
REFERENCES [dbo].[Location] ([location_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hosts] CHECK CONSTRAINT [FK_Hosts_Location]
GO
ALTER TABLE [dbo].[Listings]  WITH CHECK ADD  CONSTRAINT [FK_Listings_Hosts] FOREIGN KEY([host_id])
REFERENCES [dbo].[Hosts] ([host_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Listings] CHECK CONSTRAINT [FK_Listings_Hosts]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Listings] FOREIGN KEY([listing_id])
REFERENCES [dbo].[Listings] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Listings]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Reviewers] FOREIGN KEY([reviewer_id])
REFERENCES [dbo].[Reviewers] ([reviewer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Reviewers]
GO
USE [master]
GO
ALTER DATABASE [Airbnb] SET  READ_WRITE 
GO
