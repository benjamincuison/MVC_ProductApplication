USE [master]
GO
/****** Object:  Database [MVC_ProductDB]    Script Date: 3/21/2025 1:29:50 PM ******/
CREATE DATABASE [MVC_ProductDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVC_ProductDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MVC_ProductDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVC_ProductDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MVC_ProductDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MVC_ProductDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVC_ProductDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVC_ProductDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVC_ProductDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVC_ProductDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVC_ProductDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVC_ProductDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MVC_ProductDB] SET  MULTI_USER 
GO
ALTER DATABASE [MVC_ProductDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVC_ProductDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVC_ProductDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVC_ProductDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVC_ProductDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVC_ProductDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVC_ProductDB', N'ON'
GO
ALTER DATABASE [MVC_ProductDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MVC_ProductDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MVC_ProductDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/21/2025 1:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerEmail] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/21/2025 1:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerEmail]) VALUES (1, N'Benjamin C', N'benjaminc@email')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerEmail]) VALUES (2, N'Burger K', N'burgerk@email.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerEmail]) VALUES (3, N'Arsenne Lupin', N'thegoat@email.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerEmail]) VALUES (4, N'Jackie Chan', N'winnersandsinners@email.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerEmail]) VALUES (5, N'Keanu Reeves', N'reeves@email.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductQuantity], [CustomerID]) VALUES (1, N'Dell Coolboard', 4, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductQuantity], [CustomerID]) VALUES (2, N'Dell Deluxe', 2, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductQuantity], [CustomerID]) VALUES (3, N'Lenovo Legion 5i', 1, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductQuantity], [CustomerID]) VALUES (8, N'xxWhopperxx', 5, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Customer]
GO
/****** Object:  StoredProcedure [dbo].[CreateCustomer]    Script Date: 3/21/2025 1:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateCustomer]
	-- Add the parameters for the stored procedure here
	
	@CustomerName varchar(50),
	@CustomerEmail varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Customer (CustomerName,CustomerEmail) 
	VALUES (@CustomerName, @CustomerEmail)

	SELECT * FROM CUSTOMER;

END
GO
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 3/21/2025 1:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateProduct]
	-- Add the parameters for the stored procedure here
	@ProductName varchar(50),
	@ProductQuantity int,
	@CustomerID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Products (ProductName,ProductQuantity,CustomerID) 
	VALUES(@ProductName, @ProductQuantity, @CustomerID)

	SELECT * FROM Products;
	
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 3/21/2025 1:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProduct]
	-- Add the parameters for the stored procedure here
	@ProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Products WHERE ProductID = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerList]    Script Date: 3/21/2025 1:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerList]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Customer;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustProdList]    Script Date: 3/21/2025 1:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustProdList]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Customer.CustomerID, CustomerName, CustomerEmail, ProductID, ProductName, ProductQuantity
	FROM Customer LEFT JOIN Products ON Customer.CustomerID = Products.CustomerID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductList]    Script Date: 3/21/2025 1:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProductList] 
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM PRODUCTS;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 3/21/2025 1:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProduct]
	-- Add the parameters for the stored procedure here
	@ProductID int,
	@ProductName varchar(50),
	@ProductQuantity int,
	@CustomerID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Products
    SET ProductName = @ProductName, ProductQuantity = @ProductQuantity, CustomerID = @CustomerID
    WHERE ProductID = @ProductID; 

	Select *
	FROM  Products;
END
GO
USE [master]
GO
ALTER DATABASE [MVC_ProductDB] SET  READ_WRITE 
GO
