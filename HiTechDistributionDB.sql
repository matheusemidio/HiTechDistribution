USE [master]
GO
/****** Object:  Database [HiTechDistributionDB]    Script Date: 2020-12-15 5:39:22 PM ******/
CREATE DATABASE [HiTechDistributionDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HiTechDistributionDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HiTechDistributionDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HiTechDistributionDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HiTechDistributionDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HiTechDistributionDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HiTechDistributionDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HiTechDistributionDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HiTechDistributionDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HiTechDistributionDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HiTechDistributionDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HiTechDistributionDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HiTechDistributionDB] SET  MULTI_USER 
GO
ALTER DATABASE [HiTechDistributionDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HiTechDistributionDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HiTechDistributionDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HiTechDistributionDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HiTechDistributionDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HiTechDistributionDB', N'ON'
GO
ALTER DATABASE [HiTechDistributionDB] SET QUERY_STORE = OFF
GO
USE [HiTechDistributionDB]
GO
/****** Object:  Table [dbo].[AuthorBooks]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorBooks](
	[ISBN] [nvarchar](20) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[YearPublished] [int] NOT NULL,
	[Edition] [int] NOT NULL,
 CONSTRAINT [PK_AuthorBooks] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC,
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ISBN] [nvarchar](20) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[QOH] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PublisherId] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] NOT NULL,
	[CustomerName] [nvarchar](20) NOT NULL,
	[StreetName] [nvarchar](15) NOT NULL,
	[City] [nchar](10) NOT NULL,
	[Province] [nchar](10) NOT NULL,
	[PostalCode] [nchar](10) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[FaxNumber] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[CreditLimit] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[JobId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobId] [int] NOT NULL,
	[JobDescription] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ISBN] [nvarchar](20) NOT NULL,
	[QuantityOrdered] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShippingDate] [datetime] NOT NULL,
	[DeliveringDate] [datetime] NOT NULL,
	[OrderStatus] [nchar](10) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherId] [int] NOT NULL,
	[PublisherName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2020-12-15 5:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[Password] [nvarchar](15) NOT NULL,
	[UserStatus] [nvarchar](10) NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AuthorBooks] ([ISBN], [AuthorId], [YearPublished], [Edition]) VALUES (N'1111111111111', 10, 2019, 2)
INSERT [dbo].[AuthorBooks] ([ISBN], [AuthorId], [YearPublished], [Edition]) VALUES (N'1111111111111', 12, 2020, 1)
INSERT [dbo].[AuthorBooks] ([ISBN], [AuthorId], [YearPublished], [Edition]) VALUES (N'2222222222222', 10, 2018, 6)
INSERT [dbo].[AuthorBooks] ([ISBN], [AuthorId], [YearPublished], [Edition]) VALUES (N'2222222222222', 12, 2020, 3)
GO
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (10, N'Matheus', N'Test', N'another@gmail.com')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (11, N'Radek', N'Vystavel', N'radek@gmail.com')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (12, N'Test', N'Author', N'test@gmail.com')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (22, N'Bjarne', N'Stroustrup', N'bjarne@gmail.com')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (33, N'David', N'Flanagan', N'david@gmail.com')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (44, N'Jon', N'Duckett', N'jon@gmail.com')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (55, N'Matt', N'Neuburg', N'matt@gmail.com')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (66, N'Barry', N'Burd', N'barry@gmail.com')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (77, N'Michael', N'Dawson', N'michael@gmail.com')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [LastName], [Email]) VALUES (88, N'Matheus', N'Emidio', N'matheus@gmail.com')
GO
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [QOH], [CategoryId], [PublisherId]) VALUES (N'1111111111111', N'Test Title', 10, 10, 11, 11)
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [QOH], [CategoryId], [PublisherId]) VALUES (N'2222222222222', N'Another Test', 10, 9, 11, 11)
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [QOH], [CategoryId], [PublisherId]) VALUES (N'978-0321563842', N'C++ Programming Language', 92.15, 6, 22, 22)
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [QOH], [CategoryId], [PublisherId]) VALUES (N'978-0596805524', N'JavaScript: The definitive Guide', 83.17, 4, 55, 55)
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [QOH], [CategoryId], [PublisherId]) VALUES (N'978-1118008188', N'HTML and CSS: Design and Build Websites', 35.63, 2, 44, 44)
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [QOH], [CategoryId], [PublisherId]) VALUES (N'978-1119235538', N'Beginning Programming with Java For Dummies', 34.17, 3, 66, 66)
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [QOH], [CategoryId], [PublisherId]) VALUES (N'978-1435455009', N'Python Programming for the Absolut Beginner', 31.94, 4, 77, 77)
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [QOH], [CategoryId], [PublisherId]) VALUES (N'978-1484233177', N'C# Programming for Absolut Beginners', 43.5, 5, 11, 11)
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [QOH], [CategoryId], [PublisherId]) VALUES (N'978-1492074533', N'IOS 13 Programming Fundamentals with Swift', 45.83, 2, 55, 55)
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (11, N'C#')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (22, N'C++')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (33, N'JavaScript')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (44, N'Web Development')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (55, N'Swift')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (66, N'Java')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (77, N'Python')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (88, N'Test')
GO
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [StreetName], [City], [Province], [PostalCode], [PhoneNumber], [FaxNumber], [Email], [CreditLimit]) VALUES (11, N'College LaSalle', N'Saint Catherine', N'Montreal  ', N'Quebec    ', N'H3H 2T3   ', N'111 111 1111', N'222 222 2222', N'lasall@gmail.com', 0)
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [StreetName], [City], [Province], [PostalCode], [PhoneNumber], [FaxNumber], [Email], [CreditLimit]) VALUES (22, N'Dawson College', N'Sherbrooke', N'Montreal  ', N'Quebec    ', N'H3Z 1A4   ', N'(514)333-3333', N'(514)333-3333', N'dawson@gmail.com', 2000)
GO
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [PhoneNumber], [Email], [JobId]) VALUES (1111, N'Henry               ', N'Brown               ', N'(514)111-1111', N'henry_brown@gmail.com', 1)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [PhoneNumber], [Email], [JobId]) VALUES (2222, N'Thomas              ', N'Moore               ', N'(514)222-2222', N'thomas_moore@gmail.com', 2)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [PhoneNumber], [Email], [JobId]) VALUES (3333, N'Peter               ', N'Wang                ', N'(514)333-3333', N'peter@gmail.com', 3)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [PhoneNumber], [Email], [JobId]) VALUES (4444, N'Mary                ', N'Brown               ', N'(514)444-4444', N'mary@gmail.com', 4)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [PhoneNumber], [Email], [JobId]) VALUES (5555, N'Jennifer            ', N'Bouchard            ', N'(514)555-5555', N'jennifer@gmail.com', 4)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [PhoneNumber], [Email], [JobId]) VALUES (6666, N'Matheus             ', N'Emidio              ', N'(514)666-6666', N'matheus@gmail.com', 4)
GO
INSERT [dbo].[Jobs] ([JobId], [JobDescription]) VALUES (1, N'MIS Manager                                       ')
INSERT [dbo].[Jobs] ([JobId], [JobDescription]) VALUES (2, N'Sales Manager                                     ')
INSERT [dbo].[Jobs] ([JobId], [JobDescription]) VALUES (3, N'Inventory Controller                              ')
INSERT [dbo].[Jobs] ([JobId], [JobDescription]) VALUES (4, N'Order Clerks                                      ')
INSERT [dbo].[Jobs] ([JobId], [JobDescription]) VALUES (5, N'Accountant                                        ')
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ISBN], [QuantityOrdered]) VALUES (11, N'1111111111111', 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ISBN], [QuantityOrdered]) VALUES (11, N'2222222222222', 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ISBN], [QuantityOrdered]) VALUES (11, N'978-0321563842', 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ISBN], [QuantityOrdered]) VALUES (11, N'978-1118008188', 1)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [ShippingDate], [DeliveringDate], [OrderStatus], [CustomerId], [EmployeeId]) VALUES (11, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-15T00:00:00.000' AS DateTime), CAST(N'2020-12-20T00:00:00.000' AS DateTime), N'ordered   ', 11, 4444)
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [ShippingDate], [DeliveringDate], [OrderStatus], [CustomerId], [EmployeeId]) VALUES (22, CAST(N'2020-12-15T00:00:00.000' AS DateTime), CAST(N'2020-12-16T00:00:00.000' AS DateTime), CAST(N'2020-12-17T00:00:00.000' AS DateTime), N'shipped   ', 11, 4444)
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [ShippingDate], [DeliveringDate], [OrderStatus], [CustomerId], [EmployeeId]) VALUES (33, CAST(N'2020-12-15T00:00:00.000' AS DateTime), CAST(N'2020-12-15T00:00:00.000' AS DateTime), CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'delivered ', 22, 4444)
GO
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName]) VALUES (11, N'Apress')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName]) VALUES (22, N'Addison-Wesley Professional')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName]) VALUES (44, N'Wiley')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName]) VALUES (55, N'O''Reilly Media')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName]) VALUES (66, N'For Dummies')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName]) VALUES (77, N'Course Technology PTR')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName]) VALUES (88, N'Test')
GO
INSERT [dbo].[Users] ([UserId], [Password], [UserStatus], [EmployeeId]) VALUES (1111, N'henrybrown', N'active', 1111)
INSERT [dbo].[Users] ([UserId], [Password], [UserStatus], [EmployeeId]) VALUES (2222, N'thomasmoore', N'active', 2222)
INSERT [dbo].[Users] ([UserId], [Password], [UserStatus], [EmployeeId]) VALUES (3333, N'peterwang', N'active', 3333)
INSERT [dbo].[Users] ([UserId], [Password], [UserStatus], [EmployeeId]) VALUES (4444, N'marybrown', N'active', 4444)
INSERT [dbo].[Users] ([UserId], [Password], [UserStatus], [EmployeeId]) VALUES (5555, N'jennifer', N'active', 5555)
INSERT [dbo].[Users] ([UserId], [Password], [UserStatus], [EmployeeId]) VALUES (6666, N'matheus', N'inactive', 6666)
GO
ALTER TABLE [dbo].[AuthorBooks]  WITH CHECK ADD  CONSTRAINT [FK_AuthorBooks_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([AuthorId])
GO
ALTER TABLE [dbo].[AuthorBooks] CHECK CONSTRAINT [FK_AuthorBooks_Authors]
GO
ALTER TABLE [dbo].[AuthorBooks]  WITH CHECK ADD  CONSTRAINT [FK_AuthorBooks_Books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Books] ([ISBN])
GO
ALTER TABLE [dbo].[AuthorBooks] CHECK CONSTRAINT [FK_AuthorBooks_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([PublisherId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([JobId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Jobs]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Books] ([ISBN])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Books]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employees]
GO
USE [master]
GO
ALTER DATABASE [HiTechDistributionDB] SET  READ_WRITE 
GO
