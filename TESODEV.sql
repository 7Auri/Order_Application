USE [master]
GO
/****** Object:  Database [TESODEV]    Script Date: 7.04.2022 22:27:47 ******/
CREATE DATABASE [TESODEV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TESODEV', FILENAME = N'C:\Users\dell\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\TESODEV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TESODEV_log', FILENAME = N'C:\Users\dell\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\TESODEV.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TESODEV] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TESODEV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TESODEV] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [TESODEV] SET ANSI_NULLS ON 
GO
ALTER DATABASE [TESODEV] SET ANSI_PADDING ON 
GO
ALTER DATABASE [TESODEV] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [TESODEV] SET ARITHABORT ON 
GO
ALTER DATABASE [TESODEV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TESODEV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TESODEV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TESODEV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TESODEV] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [TESODEV] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [TESODEV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TESODEV] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [TESODEV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TESODEV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TESODEV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TESODEV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TESODEV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TESODEV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TESODEV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TESODEV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TESODEV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TESODEV] SET RECOVERY FULL 
GO
ALTER DATABASE [TESODEV] SET  MULTI_USER 
GO
ALTER DATABASE [TESODEV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TESODEV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TESODEV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TESODEV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TESODEV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TESODEV] SET QUERY_STORE = OFF
GO
USE [TESODEV]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [TESODEV]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7.04.2022 22:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 7.04.2022 22:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressLine] [nvarchar](450) NOT NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[CityCode] [int] NOT NULL,
	[CustomerId] [uniqueidentifier] NULL,
	[OrderId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressLine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7.04.2022 22:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7.04.2022 22:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7.04.2022 22:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[OrderId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220406211758_TESODEV', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220406223313_TESODEV', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220407001609_TESODEV', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220407002636_TESODEV', N'5.0.15')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'12, rue des Bouchers', N'Marseille', N'France', 13008, N'0c797bd2-a172-4509-bec5-180ededa0916', N'bf1d7ac0-cb64-4cd9-8859-05ec53610db6')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'120 Hanover Sq.', N'London', N'UK', 5642, N'176d82f6-1335-4d98-877e-2415123de188', N'bc41e9de-5f27-417b-a1d9-156ffe6212f4')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'23 Tsawassen Blvd.', N'Tsawassen', N'Canada', 67824, N'245b9d0c-d67d-494f-bd86-24bca5660451', N'6c5f1d3a-4f95-4a98-9929-15e2218e2cf2')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'24, place Kléber', N'Strasbourg', N'France', 67000, N'6502c4f9-2596-49f1-baed-ef81e4d1064d', N'70e95132-0937-49a9-8438-4d210dffddbf')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'Av. dos Lusíadas, 23', N'Sao Paulo', N'Brazil', 5432, N'd2319431-46ad-461d-8a41-42fc4b20d669', N'46a8e064-bcd5-4fe8-b5d8-4e7f88c6ad9b')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'Avda. de la Constitución 2222', N'México D.F.', N'Mexico', 5021, N'b72d6d23-3f40-4046-a5e6-476826e7192d', N'bfa3248c-2f57-493e-8f7c-6f09b3dc72a2')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'Berguvsvägen  8', N'Luleå', N'Sweden', 95822, N'b3f0357c-0a3f-487a-949c-56a0b3facaa9', N'ff25363c-dc53-49ad-b0ac-7666f3a27fe9')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'C/ Araquil, 67', N'Madrid', N'Spain', 28023, N'230e6246-bf02-4454-9240-5f34c6b4d5a3', N'5deb1f27-2a54-4bc9-8486-7724d228fae5')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'Cerrito 333', N'Buenos Aires', N'Argentina', 24647, N'c68fc1c4-3637-492f-ba7c-747ff919e543', N'cf4c7d6a-6733-4091-927d-a98ea7910179')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'Fauntleroy Circus', N'London', N'UK', 5651, N'd472398e-1e88-4719-adde-939523a43188', N'33da07f6-579c-442a-82a8-ae577ef4ba0f')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'Forsterstr. 57', N'Mannheim', N'Germany', 68306, N'1f8313c0-9aa4-47c4-a970-9b5d1f45fa37', N'9740ceaa-e6fe-4109-9761-af267b63838a')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'Hauptstr. 29', N'Bern', N'Switzerland', 3012, N'435e1f7c-d9d8-43a5-9275-a7ac6b735131', N'393e47c7-a10d-449e-a609-b535e7371c4f')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'Mataderos  2312', N'México D.F.', N'Mexico', 5023, N'f6f3f07f-2083-4df8-9226-bf54e20e011c', N'088f130a-5d5d-4d6b-8dfd-ce58194c6e47')
INSERT [dbo].[Addresses] ([AddressLine], [City], [Country], [CityCode], [CustomerId], [OrderId]) VALUES (N'Obere Str. 57', N'Berlin', N'Germany', 12209, N'f2cbd9d5-3d18-4c4b-a47f-c3d97faa6fad', N'44dc0527-8743-4809-81ad-fd65bc3b2d01')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'0c797bd2-a172-4509-bec5-180ededa0916', N'Kaela Harsnipe', N'kharsnipe9@tinyurl.com', CAST(N'2019-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-26T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'176d82f6-1335-4d98-877e-2415123de188', N'Lorrin Bettam', N'lbettam7@sourceforge.net', CAST(N'2020-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'245b9d0c-d67d-494f-bd86-24bca5660451', N'Stanford Halford', N'shalforde@unesco.org', CAST(N'2021-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'string', N'string@string', CAST(N'2022-04-07T00:17:28.0000000' AS DateTime2), CAST(N'2022-04-07T00:17:28.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'd2319431-46ad-461d-8a41-42fc4b20d669', N'Ambur Winship', N'awinship6@xing.com', CAST(N'2019-07-11T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'b72d6d23-3f40-4046-a5e6-476826e7192d', N'Morlee Garred', N'mgarredc@uol.com.br', CAST(N'2019-04-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-03-22T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'b3f0357c-0a3f-487a-949c-56a0b3facaa9', N'Weston Vequaud', N'wvequaud3@bizjournals.com', CAST(N'2020-03-20T00:00:00.0000000' AS DateTime2), CAST(N'2021-04-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'230e6246-bf02-4454-9240-5f34c6b4d5a3', N'Talbot Denison', N'tdenisona@parallels.com', CAST(N'2019-04-07T00:00:00.0000000' AS DateTime2), CAST(N'2021-11-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'c68fc1c4-3637-492f-ba7c-747ff919e543', N'Gerhard Chadwen', N'gchadwen4@walmart.com', CAST(N'2019-09-18T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'd472398e-1e88-4719-adde-939523a43188', N'Lindsy Walbridge', N'lwalbridge1@1688.com', CAST(N'2019-10-04T00:00:00.0000000' AS DateTime2), CAST(N'2022-03-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'1f8313c0-9aa4-47c4-a970-9b5d1f45fa37', N'Didi Rizzello', N'drizzello8@economist.com', CAST(N'2019-08-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'435e1f7c-d9d8-43a5-9275-a7ac6b735131', N'Neall Shouler', N'nshouler2@1und1.de', CAST(N'2020-05-07T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'f6f3f07f-2083-4df8-9226-bf54e20e011c', N'Hollyanne Cumberland', N'hcumberland0@so-net.ne.jp', CAST(N'2018-04-02T00:00:00.0000000' AS DateTime2), CAST(N'2021-08-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'f2cbd9d5-3d18-4c4b-a47f-c3d97faa6fad', N'Lorry Jaksic', N'ljaksicd@eventbrite.com', CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), CAST(N'2021-07-28T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'623aecca-0af6-4e75-a5ef-e736300abe8f', N'Rianon Waldron', N'rwaldron5@unc.edu', CAST(N'2016-12-22T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreatedAt], [UpdatedAt]) VALUES (N'6502c4f9-2596-49f1-baed-ef81e4d1064d', N'Courtnay Muckloe', N'cmuckloeb@economist.com', CAST(N'2021-01-03T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-31T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'bf1d7ac0-cb64-4cd9-8859-05ec53610db6', N'0c797bd2-a172-4509-bec5-180ededa0916', 14, 74766.9, N'Sold', CAST(N'2017-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'bc41e9de-5f27-417b-a1d9-156ffe6212f4', N'176d82f6-1335-4d98-877e-2415123de188', 56, 23889.72, NULL, CAST(N'2017-08-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'6c5f1d3a-4f95-4a98-9929-15e2218e2cf2', N'245b9d0c-d67d-494f-bd86-24bca5660451', 99, 69046.77, NULL, CAST(N'2019-10-02T00:00:00.0000000' AS DateTime2), CAST(N'2020-07-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'70e95132-0937-49a9-8438-4d210dffddbf', N'6502c4f9-2596-49f1-baed-ef81e4d1064d', 8, 46656.27, NULL, CAST(N'2017-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'46a8e064-bcd5-4fe8-b5d8-4e7f88c6ad9b', N'd2319431-46ad-461d-8a41-42fc4b20d669', 72, 43059.84, NULL, CAST(N'2018-08-22T00:00:00.0000000' AS DateTime2), CAST(N'2020-01-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'bfa3248c-2f57-493e-8f7c-6f09b3dc72a2', N'b72d6d23-3f40-4046-a5e6-476826e7192d', 55, 46399.97, NULL, CAST(N'2017-12-30T00:00:00.0000000' AS DateTime2), CAST(N'2020-09-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'ff25363c-dc53-49ad-b0ac-7666f3a27fe9', N'b3f0357c-0a3f-487a-949c-56a0b3facaa9', 21, 59651.72, NULL, CAST(N'2018-01-08T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'5deb1f27-2a54-4bc9-8486-7724d228fae5', N'230e6246-bf02-4454-9240-5f34c6b4d5a3', 1, 99027.08, NULL, CAST(N'2019-08-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-05-30T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'cf4c7d6a-6733-4091-927d-a98ea7910179', N'c68fc1c4-3637-492f-ba7c-747ff919e543', 53, 12104.19, NULL, CAST(N'2018-04-29T00:00:00.0000000' AS DateTime2), CAST(N'2020-01-22T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'33da07f6-579c-442a-82a8-ae577ef4ba0f', N'd472398e-1e88-4719-adde-939523a43188', 65, 6748.47, NULL, CAST(N'2017-03-11T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-30T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'9740ceaa-e6fe-4109-9761-af267b63838a', N'1f8313c0-9aa4-47c4-a970-9b5d1f45fa37', 35, 37011.24, NULL, CAST(N'2019-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-09T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'393e47c7-a10d-449e-a609-b535e7371c4f', N'435e1f7c-d9d8-43a5-9275-a7ac6b735131', 43, 82436.32, NULL, CAST(N'2016-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2020-05-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'088f130a-5d5d-4d6b-8dfd-ce58194c6e47', N'f6f3f07f-2083-4df8-9226-bf54e20e011c', 45, 80225.69, NULL, CAST(N'2017-02-20T00:00:00.0000000' AS DateTime2), CAST(N'2021-07-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [CreatedAt], [UpdatedAt]) VALUES (N'44dc0527-8743-4809-81ad-fd65bc3b2d01', N'f2cbd9d5-3d18-4c4b-a47f-c3d97faa6fad', 28, 79951.5, NULL, CAST(N'2019-06-22T00:00:00.0000000' AS DateTime2), CAST(N'2020-05-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'028196ae-8265-4c16-8361-2586538a6e82', N'http://dummyimage.com/139x100.png/dddddd/000000', N'Marjoram - Dried, Rubbed', N'6c5f1d3a-4f95-4a98-9929-15e2218e2cf2')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'e204a2b8-d0e9-46e8-81ef-2a6654a78afa', N'http://dummyimage.com/118x100.png/ff4444/ffffff', N'Monkfish - Fresh', N'44dc0527-8743-4809-81ad-fd65bc3b2d01')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'8217e9b2-3e60-455e-9be2-44f1545c6733', N'http://dummyimage.com/201x100.png/5fa2dd/ffffff', N'Wine - Red, Pinot Noir, Chateau', N'088f130a-5d5d-4d6b-8dfd-ce58194c6e47')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'1c8ad943-bbe4-4263-b11f-46808f221c80', N'http://dummyimage.com/155x100.png/5fa2dd/ffffff', N'Cookies - Englishbay Oatmeal', N'393e47c7-a10d-449e-a609-b535e7371c4f')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'53973207-508a-4a3c-be66-5a94623f5b14', N'http://dummyimage.com/210x100.png/ff4444/ffffff', N'Squid - U - 10 Thailand', N'9740ceaa-e6fe-4109-9761-af267b63838a')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'061539d5-0615-4a62-8a9b-7aedd9431257', N'http://dummyimage.com/107x100.png/cc0000/ffffff', N'Yogurt - Assorted Pack', N'33da07f6-579c-442a-82a8-ae577ef4ba0f')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'1158587e-c7fa-46f3-9edc-7b31263d7166', N'http://dummyimage.com/133x100.png/ff4444/ffffff', N'Ketchup - Tomato', N'cf4c7d6a-6733-4091-927d-a98ea7910179')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'41ea680e-7494-44ac-a533-95813e0741af', N'http://dummyimage.com/194x100.png/ff4444/ffffff', N'True - Vue Containers', N'5deb1f27-2a54-4bc9-8486-7724d228fae5')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'3c2e5e91-5764-4b27-ad94-a430ee2adaf8', N'http://dummyimage.com/248x100.png/cc0000/ffffff', N'Wine - White, Riesling, Semi - Dry', N'ff25363c-dc53-49ad-b0ac-7666f3a27fe9')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'a87ffa29-e936-4227-b22f-bac81b75d20c', N'http://dummyimage.com/137x100.png/cc0000/ffffff', N'Muffin Hinge Container 6', N'bfa3248c-2f57-493e-8f7c-6f09b3dc72a2')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'a6303465-7c54-49d9-8475-c2912706622b', N'http://dummyimage.com/138x100.png/cc0000/ffffff', N'Lamb Rack Frenched Australian', N'46a8e064-bcd5-4fe8-b5d8-4e7f88c6ad9b')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'84256eff-a41a-4f03-af1e-c48467a183c8', N'http://dummyimage.com/116x100.png/5fa2dd/ffffff', N'Foil - Round Foil', N'70e95132-0937-49a9-8438-4d210dffddbf')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'7cdb546e-43af-4f10-ac32-c53b5d77d464', N'http://dummyimage.com/204x100.png/cc0000/ffffff', N'Salt - Sea', N'6c5f1d3a-4f95-4a98-9929-15e2218e2cf2')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'6c623c20-8904-4299-85ac-e0b2f8ff28fd', N'http://dummyimage.com/181x100.png/5fa2dd/ffffff', N'Bagel - 12 Grain Preslice', N'bc41e9de-5f27-417b-a1d9-156ffe6212f4')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name], [OrderId]) VALUES (N'da6d2f05-4662-4f05-8cec-ed04a25e36d7', N'http://dummyimage.com/176x100.png/cc0000/ffffff', N'Cheese - Asiago', N'bf1d7ac0-cb64-4cd9-8859-05ec53610db6')
/****** Object:  Index [IX_Addresses_CustomerId]    Script Date: 7.04.2022 22:27:47 ******/
CREATE NONCLUSTERED INDEX [IX_Addresses_CustomerId] ON [dbo].[Addresses]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Addresses_OrderId]    Script Date: 7.04.2022 22:27:47 ******/
CREATE NONCLUSTERED INDEX [IX_Addresses_OrderId] ON [dbo].[Addresses]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CustomerId]    Script Date: 7.04.2022 22:27:47 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_OrderId]    Script Date: 7.04.2022 22:27:47 ******/
CREATE NONCLUSTERED INDEX [IX_Products_OrderId] ON [dbo].[Products]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Orders_OrderId]
GO
USE [master]
GO
ALTER DATABASE [TESODEV] SET  READ_WRITE 
GO
