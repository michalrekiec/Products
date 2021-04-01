USE [master]
GO
/****** Object:  Database [Enterprise1]    Script Date: 27/03/2021 19:43:16 ******/
CREATE DATABASE [Enterprise1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Enterprise1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MICHALRSQL\MSSQL\DATA\Enterprise1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Enterprise1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MICHALRSQL\MSSQL\DATA\Enterprise1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Enterprise1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Enterprise1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Enterprise1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Enterprise1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Enterprise1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Enterprise1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Enterprise1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Enterprise1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Enterprise1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Enterprise1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Enterprise1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Enterprise1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Enterprise1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Enterprise1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Enterprise1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Enterprise1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Enterprise1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Enterprise1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Enterprise1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Enterprise1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Enterprise1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Enterprise1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Enterprise1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Enterprise1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Enterprise1] SET RECOVERY FULL 
GO
ALTER DATABASE [Enterprise1] SET  MULTI_USER 
GO
ALTER DATABASE [Enterprise1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Enterprise1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Enterprise1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Enterprise1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Enterprise1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Enterprise1', N'ON'
GO
ALTER DATABASE [Enterprise1] SET QUERY_STORE = OFF
GO
USE [Enterprise1]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 27/03/2021 19:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoicePositions]    Script Date: 27/03/2021 19:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicePositions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_InvoicePositions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 27/03/2021 19:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [varchar](50) NOT NULL,
	[ClientNumber] [int] NOT NULL,
	[CreationDate] [date] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27/03/2021 19:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Invoices]    Script Date: 27/03/2021 19:43:17 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Invoices] ON [dbo].[Invoices]
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InvoicePositions]  WITH CHECK ADD  CONSTRAINT [FK_InvoicePositions_InvoicePositions] FOREIGN KEY([Id])
REFERENCES [dbo].[InvoicePositions] ([Id])
GO
ALTER TABLE [dbo].[InvoicePositions] CHECK CONSTRAINT [FK_InvoicePositions_InvoicePositions]
GO
ALTER TABLE [dbo].[InvoicePositions]  WITH CHECK ADD  CONSTRAINT [FK_InvoicePositions_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[InvoicePositions] CHECK CONSTRAINT [FK_InvoicePositions_Products]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Clients] FOREIGN KEY([ClientNumber])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Clients]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Invoices] FOREIGN KEY([Id])
REFERENCES [dbo].[Invoices] ([Id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Invoices]
GO
USE [master]
GO
ALTER DATABASE [Enterprise1] SET  READ_WRITE 
GO


/*  Homework week 6  */

/*  1. Invoice number, First Name, Last Name  */

SELECT i.Number AS [Numer Faktury], c.FirstName AS [Imię], c.LastName AS [Nazwisko]
FROM Invoices i
INNER JOIN Clients c ON c.Id = i.ClientNumber

/*  2. Invoice number, Product name, and price  */

SELECT i.Number AS [Numer faktury], p.Name AS [Nazwa produktu], p.Price AS [Cena]
FROM InvoicePositions ip
INNER JOIN Invoices i ON i.Id = ip.InvoiceId
INNER JOIN Products p ON p.Id = ip.ProductId

/*  3. Invoice number, sum of product quantity  */

SELECT i.Number AS [Numer Faktury], SUM(ip.Quantity) AS [Ilość produktów]
FROM InvoicePositions ip
INNER JOIN Invoices i ON i.Id = ip.InvoiceId
GROUP BY i.Number

/*  4. Invoice number, final price  */

SELECT i.Number AS [Numer Faktury], SUM(ip.Quantity * p.Price) AS [Cena całkowita] 
FROM InvoicePositions ip
INNER JOIN Invoices i ON i.Id = ip.InvoiceId
INNER JOIN Products p ON p.Id = ip.ProductId
GROUP BY i.Number