USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 20-03-2025 11:23:41 ******/
CREATE DATABASE [IMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventrySystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\InventrySystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventrySystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\InventrySystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IMS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [IMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IMS] SET  MULTI_USER 
GO
ALTER DATABASE [IMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IMS] SET QUERY_STORE = OFF
GO
USE [IMS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [IMS]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20-03-2025 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 20-03-2025 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](255) NOT NULL,
	[ContactName] [varchar](255) NULL,
	[sAddress] [varchar](255) NULL,
	[City] [varchar](100) NULL,
	[PostalCode] [varchar](20) NULL,
	[Country] [varchar](100) NULL,
 CONSTRAINT [PK__Customer__A4AE64B841D52B95] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20-03-2025 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[First] [varchar](50) NULL,
	[Middle] [varchar](50) NULL,
	[Last] [varchar](50) NULL,
	[MobileNo] [int] NULL,
	[ProductId] [int] NULL,
	[NumberShipped] [varchar](50) NULL,
	[OrderDate] [date] NULL,
	[SuppliersId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20-03-2025 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[PartNumber] [int] NULL,
	[ProductLabel] [varchar](50) NULL,
	[StartingInventory] [int] NULL,
	[InventoryReceived] [int] NULL,
	[Inventoryshipped] [int] NULL,
	[InventoryOnHand] [int] NULL,
	[MinimumRequired] [int] NULL,
	[Price] [numeric](10, 2) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 20-03-2025 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NULL,
	[ProductId] [int] NULL,
	[Number_Received] [int] NULL,
	[Purchase_date] [date] NOT NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 20-03-2025 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[subjects] [varchar](50) NULL,
	[TeacherId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 20-03-2025 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 20-03-2025 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[Id] [int] NOT NULL,
	[teacher_Name] [varchar](50) NULL,
 CONSTRAINT [PK_teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vishnuCustomers]    Script Date: 20-03-2025 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vishnuCustomers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](255) NOT NULL,
	[ContactName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](100) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Country] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Id], [Name], [Image]) VALUES (1, N'Foods', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image]) VALUES (2, N'Electronics', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image]) VALUES (3, N'Automobiles', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image]) VALUES (4, N'Fasions', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image]) VALUES (5, N'car', NULL)
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (0, N'mala thakur', N'mala', N'h1005', N'lucknow', N'201309', N'india')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (1, N'Alfreds Futterkiste ', N'Maria Anders ', N'Obere Str. 57 ', N'Berlin ', N'12209 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (2, N'Ana Trujillo Emparedados y helados ', N'Ana Trujillo ', N'Avda. de la Constitución 2222 ', N'México D.F. ', N'05021 ', N'Mexico ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (3, N'Antonio Moreno Taquería ', N'Antonio Moreno ', N'Mataderos 2312 ', N'México D.F. ', N'05023 ', N'Mexico ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (4, N'Around the Horn ', N'Thomas Hardy ', N'120 Hanover Sq. ', N'London ', N'WA1 1DP ', N'UK ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (5, N'Berglunds snabbköp ', N'Christina Berglund ', N'Berguvsvägen 8 ', N'Luleå ', N'S-958 22 ', N'Sweden ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (6, N'Blauer See Delikatessen ', N'Hanna Moos ', N'Forsterstr. 57 ', N'Mannheim ', N'68306 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (7, N'Blondel père et fils ', N'Frédérique Citeaux ', N'24, place Kléber ', N'Strasbourg ', N'67000 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (8, N'Bólido Comidas preparadas ', N'Martín Sommer ', N'C/ Araquil, 67 ', N'Madrid ', N'28023 ', N'Spain ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (9, N'Bon app'' ', N'Laurence Lebihans ', N'12, rue des Bouchers ', N'Marseille ', N'13008 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (10, N'Bottom-Dollar Marketse ', N'Elizabeth Lincoln ', N'23 Tsawassen Blvd. ', N'Tsawassen ', N'T2F 8M4 ', N'Canada ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (11, N'B''s Beverages ', N'Victoria Ashworth ', N'Fauntleroy Circus ', N'London ', N'EC2 5NT ', N'UK ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (12, N'Cactus Comidas para llevar ', N'Patricio Simpson ', N'Cerrito 333 ', N'Buenos Aires ', N'1010 ', N'Argentina ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (13, N'Centro comercial Moctezuma ', N'Francisco Chang ', N'Sierras de Granada 9993 ', N'México D.F. ', N'05022 ', N'Mexico ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (14, N'Chop-suey Chinese ', N'Yang Wang ', N'Hauptstr. 29 ', N'Bern ', N'3012 ', N'Switzerland ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (15, N'Comércio Mineiro ', N'Pedro Afonso ', N'Av. dos Lusíadas, 23 ', N'São Paulo ', N'05432-043 ', N'Brazil ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (16, N'Consolidated Holdings ', N'Elizabeth Brown ', N'Berkeley Gardens 12 Brewery  ', N'London ', N'WX1 6LT ', N'UK ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (17, N'Drachenblut Delikatessend ', N'Sven Ottlieb ', N'Walserweg 21 ', N'Aachen ', N'52066 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (18, N'Du monde entier ', N'Janine Labrune ', N'67, rue des Cinquante Otages ', N'Nantes ', N'44000 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (19, N'Eastern Connection ', N'Ann Devon ', N'35 King George ', N'London ', N'WX3 6FW ', N'UK ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (20, N'Ernst Handel ', N'Roland Mendel ', N'Kirchgasse 6 ', N'Graz ', N'8010 ', N'Austria ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (21, N'Familia Arquibaldo ', N'Aria Cruz ', N'Rua Orós, 92 ', N'São Paulo ', N'05442-030 ', N'Brazil ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (22, N'FISSA Fabrica Inter. Salchichas S.A. ', N'Diego Roel ', N'C/ Moralzarzal, 86 ', N'Madrid ', N'28034 ', N'Spain ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (23, N'Folies gourmandes ', N'Martine Rancé ', N'184, chaussée de Tournai ', N'Lille ', N'59000 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (24, N'Folk och fä HB ', N'Maria Larsson ', N'Åkergatan 24 ', N'Bräcke ', N'S-844 67 ', N'Sweden ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (25, N'Frankenversand ', N'Peter Franken ', N'Berliner Platz 43 ', N'München ', N'80805 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (26, N'France restauration ', N'Carine Schmitt ', N'54, rue Royale ', N'Nantes ', N'44000 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (27, N'Franchi S.p.A. ', N'Paolo Accorti ', N'Via Monte Bianco 34 ', N'Torino ', N'10100 ', N'Italy ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (28, N'Furia Bacalhau e Frutos do Mar ', N'Lino Rodriguez  ', N'Jardim das rosas n. 32 ', N'Lisboa ', N'1675 ', N'Portugal ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (29, N'Galería del gastrónomo ', N'Eduardo Saavedra ', N'Rambla de Cataluña, 23 ', N'Barcelona ', N'08022 ', N'Spain ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (30, N'Godos Cocina Típica ', N'José Pedro Freyre ', N'C/ Romero, 33 ', N'Sevilla ', N'41101 ', N'Spain ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (31, N'Gourmet Lanchonetes ', N'André Fonseca ', N'Av. Brasil, 442 ', N'Campinas ', N'04876-786 ', N'Brazil ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (32, N'Great Lakes Food Market ', N'Howard Snyder ', N'2732 Baker Blvd. ', N'Eugene ', N'97403 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (33, N'GROSELLA-Restaurante ', N'Manuel Pereira ', N'5ª Ave. Los Palos Grandes ', N'Caracas ', N'1081 ', N'Venezuela ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (34, N'Hanari Carnes ', N'Mario Pontes ', N'Rua do Paço, 67 ', N'Rio de Janeiro ', N'05454-876 ', N'Brazil ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (35, N'HILARIÓN-Abastos ', N'Carlos Hernández ', N'Carrera 22 con Ave. Carlos Soublette #8-35 ', N'San Cristóbal ', N'5022 ', N'Venezuela ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (36, N'Hungry Coyote Import Store ', N'Yoshi Latimer ', N'City Center Plaza 516 Main St. ', N'Elgin ', N'97827 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (37, N'Hungry Owl All-Night Grocers ', N'Patricia McKenna ', N'8 Johnstown Road ', N'Cork ', N' ', N'Ireland ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (38, N'Island Trading ', N'Helen Bennett ', N'Garden House Crowther Way ', N'Cowes ', N'PO31 7PJ ', N'UK ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (39, N'Königlich Essen ', N'Philip Cramer ', N'Maubelstr. 90 ', N'Brandenburg ', N'14776 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (40, N'La corne d''abondance ', N'Daniel Tonini ', N'67, avenue de l''Europe ', N'Versailles ', N'78000 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (41, N'La maison d''Asie ', N'Annette Roulet ', N'1 rue Alsace-Lorraine ', N'Toulouse ', N'31000 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (42, N'Laughing Bacchus Wine Cellars ', N'Yoshi Tannamuri ', N'1900 Oak St. ', N'Vancouver ', N'V3F 2K1 ', N'Canada ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (43, N'Lazy K Kountry Store ', N'John Steel ', N'12 Orchestra Terrace ', N'Walla Walla ', N'99362 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (44, N'Lehmanns Marktstand ', N'Renate Messner ', N'Magazinweg 7 ', N'Frankfurt a.M.  ', N'60528 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (45, N'Let''s Stop N Shop ', N'Jaime Yorres ', N'87 Polk St. Suite 5 ', N'San Francisco ', N'94117 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (46, N'LILA-Supermercado ', N'Carlos González ', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo ', N'Barquisimeto ', N'3508 ', N'Venezuela ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (47, N'LINO-Delicateses ', N'Felipe Izquierdo ', N'Ave. 5 de Mayo Porlamar ', N'I. de Margarita ', N'4980 ', N'Venezuela ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (48, N'Lonesome Pine Restaurant ', N'Fran Wilson ', N'89 Chiaroscuro Rd. ', N'Portland ', N'97219 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (49, N'Magazzini Alimentari Riuniti ', N'Giovanni Rovelli ', N'Via Ludovico il Moro 22 ', N'Bergamo ', N'24100 ', N'Italy ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (50, N'Maison Dewey ', N'Catherine Dewey ', N'Rue Joseph-Bens 532 ', N'Bruxelles ', N'B-1180 ', N'Belgium ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (51, N'Mère Paillarde ', N'Jean Fresnière ', N'43 rue St. Laurent ', N'Montréal ', N'H1J 1C3 ', N'Canada ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (52, N'Morgenstern Gesundkost ', N'Alexander Feuer ', N'Heerstr. 22 ', N'Leipzig ', N'04179 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (53, N'North/South ', N'Simon Crowther ', N'South House 300 Queensbridge ', N'London ', N'SW7 1RZ ', N'UK ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (54, N'Océano Atlántico Ltda. ', N'Yvonne Moncada ', N'Ing. Gustavo Moncada 8585 Piso 20-A ', N'Buenos Aires ', N'1010 ', N'Argentina ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (55, N'Old World Delicatessen ', N'Rene Phillips ', N'2743 Bering St. ', N'Anchorage ', N'99508 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (56, N'Ottilies Käseladen ', N'Henriette Pfalzheim ', N'Mehrheimerstr. 369 ', N'Köln ', N'50739 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (57, N'Paris spécialités ', N'Marie Bertrand ', N'265, boulevard Charonne ', N'Paris ', N'75012 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (58, N'Pericles Comidas clásicas ', N'Guillermo Fernández ', N'Calle Dr. Jorge Cash 321 ', N'México D.F. ', N'05033 ', N'Mexico ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (59, N'Piccolo und mehr ', N'Georg Pipps ', N'Geislweg 14 ', N'Salzburg ', N'5020 ', N'Austria ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (60, N'Princesa Isabel Vinhoss ', N'Isabel de Castro ', N'Estrada da saúde n. 58 ', N'Lisboa ', N'1756 ', N'Portugal ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (61, N'Que Delícia ', N'Bernardo Batista ', N'Rua da Panificadora, 12 ', N'Rio de Janeiro ', N'02389-673 ', N'Brazil ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (62, N'Queen Cozinha ', N'Lúcia Carvalho ', N'Alameda dos Canàrios, 891 ', N'São Paulo ', N'05487-020 ', N'Brazil ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (63, N'QUICK-Stop ', N'Horst Kloss ', N'Taucherstraße 10 ', N'Cunewalde ', N'01307 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (64, N'Rancho grande ', N'Sergio Gutiérrez ', N'Av. del Libertador 900 ', N'Buenos Aires ', N'1010 ', N'Argentina ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (65, N'Rattlesnake Canyon Grocery ', N'Paula Wilson ', N'2817 Milton Dr. ', N'Albuquerque ', N'87110 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (66, N'Reggiani Caseifici ', N'Maurizio Moroni ', N'Strada Provinciale 124 ', N'Reggio Emilia ', N'42100 ', N'Italy ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (67, N'Ricardo Adocicados ', N'Janete Limeira ', N'Av. Copacabana, 267 ', N'Rio de Janeiro ', N'02389-890 ', N'Brazil ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (68, N'Richter Supermarkt ', N'Michael Holz ', N'Grenzacherweg 237 ', N'Genève ', N'1203 ', N'Switzerland ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (69, N'Romero y tomillo ', N'Alejandra Camino ', N'Gran Vía, 1 ', N'Madrid ', N'28001 ', N'Spain ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (70, N'Santé Gourmet ', N'Jonas Bergulfsen ', N'Erling Skakkes gate 78 ', N'Stavern ', N'4110 ', N'Norway ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (71, N'Save-a-lot Markets ', N'Jose Pavarotti ', N'187 Suffolk Ln. ', N'Boise ', N'83720 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (72, N'Seven Seas Imports ', N'Hari Kumar ', N'90 Wadhurst Rd. ', N'London ', N'OX15 4NB ', N'UK ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (73, N'Simons bistro ', N'Jytte Petersen ', N'Vinbæltet 34 ', N'København ', N'1734 ', N'Denmark ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (74, N'Spécialités du monde ', N'Dominique Perrier ', N'25, rue Lauriston ', N'Paris ', N'75016 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (75, N'Split Rail Beer & Ale ', N'Art Braunschweiger ', N'P.O. Box 555 ', N'Lander ', N'82520 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (76, N'Suprêmes délices ', N'Pascale Cartrain ', N'Boulevard Tirou, 255 ', N'Charleroi ', N'B-6000 ', N'Belgium ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (77, N'The Big Cheese ', N'Liz Nixon ', N'89 Jefferson Way Suite 2 ', N'Portland ', N'97201 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (78, N'The Cracker Box ', N'Liu Wong ', N'55 Grizzly Peak Rd. ', N'Butte ', N'59801 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (79, N'Toms Spezialitäten ', N'Karin Josephs ', N'Luisenstr. 48 ', N'Münster ', N'44087 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (80, N'Tortuga Restaurante ', N'Miguel Angel Paolino ', N'Avda. Azteca 123 ', N'México D.F. ', N'05033 ', N'Mexico ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (81, N'Tradição Hipermercados ', N'Anabela Domingues ', N'Av. Inês de Castro, 414 ', N'São Paulo ', N'05634-030 ', N'Brazil ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (82, N'Trail''s Head Gourmet Provisioners ', N'Helvetius Nagy ', N'722 DaVinci Blvd. ', N'Kirkland ', N'98034 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (83, N'Vaffeljernet ', N'Palle Ibsen ', N'Smagsløget 45 ', N'Århus ', N'8200 ', N'Denmark ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (84, N'Victuailles en stock ', N'Mary Saveley ', N'2, rue du Commerce ', N'Lyon ', N'69004 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (85, N'Vins et alcools Chevalier ', N'Paul Henriot ', N'59 rue de l''Abbaye ', N'Reims ', N'51100 ', N'France ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (86, N'Die Wandernde Kuh ', N'Rita Müller ', N'Adenauerallee 900 ', N'Stuttgart ', N'70563 ', N'Germany ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (87, N'Wartian Herkku ', N'Pirkko Koskitalo ', N'Torikatu 38 ', N'Oulu ', N'90110 ', N'Finland ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (88, N'Wellington Importadora ', N'Paula Parente ', N'Rua do Mercado, 12 ', N'Resende ', N'08737-363 ', N'Brazil ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (89, N'White Clover Markets ', N'Karl Jablonski ', N'305 - 14th Ave. S. Suite 3B ', N'Seattle ', N'98128 ', N'USA ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (90, N'Wilman Kala ', N'Matti Karttunen ', N'Keskuskatu 45 ', N'Helsinki ', N'21240 ', N'Finland ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (91, N'Wolski ', N'Zbyszek ', N'ul. Filtrowa 68 ', N'Walla ', N'01-012 ', N'Poland ')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (92, N'Vishnu thakur', N'mala', N'h1005', N'lucknow', N'201309', N'india')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (93, N'Vishnu thakur', N'mala', N'h1005', N'lucknow', N'201309', N'india')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (94, N'Vishnu thakur', N'mala', N'h1005', N'lucknow', N'201309', N'india')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (95, N'Mala thakur', N'mala', N'h1005', N'lucknow', N'201309', N'india')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [sAddress], [City], [PostalCode], [Country]) VALUES (96, N'Vishnu thakur', N'mala', N'h1005', N'lucknow', N'201309', N'india')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (1, N'vkt', N'mukeshadnivishnu', N'dheerubhai', N'Ambani', NULL, 7, N'five', CAST(N'2024-08-01' AS Date), 111)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (2, NULL, N'adf', N'adg', N'asdfg', NULL, 7, N'adg', CAST(N'2024-07-27' AS Date), 222)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (3, NULL, N'anil', N'dheeru', N'Ambani', 2000, 8, N'Six', CAST(N'2024-07-27' AS Date), 111)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (6, N'adg', N'fdff', N'ffd', N'fgg', 24678898, 7, N'1', CAST(N'2024-07-30' AS Date), 222)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (10, N'vishnu', N'vishnu', N'kant', N'thakur', 12527, 7, N'vishnu', CAST(N'2024-07-31' AS Date), 111)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (11, N'kantaa', N'mukesh', N'dheerubhai', N'Ambani', NULL, 9, N'five', CAST(N'0001-01-01' AS Date), 222)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (12, N'kantaaaaaaaaaaaaaa', N'mukesh', N'dheerubhai', N'Ambani', NULL, 9, N'five', CAST(N'0001-01-01' AS Date), 222)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (13, N'vishnu', N'mukesh', N'dheerubhai', N'Ambani', NULL, 7, N'five', CAST(N'0001-01-01' AS Date), 222)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (14, N'Murli', N'mukesh', N'dheerubhai', N'Ambani', NULL, 7, N'five', CAST(N'2024-08-01' AS Date), 111)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (1007, N'vkt', N'mukesh', N'dheerubhai', N'Ambani', NULL, 7, N'five', NULL, 111)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (1008, N'vkt', N'mukesh', N'dheerubhai', N'Ambani', NULL, 7, N'five', NULL, 111)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (2007, N'vkt', N'mittal', N'mittal', N'mittal', 123, 7, N'six', NULL, 111)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (2008, N'vkt', N'mittal', N'mittal', N'mittal', 123, 7, N'six', NULL, 111)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (2009, N'vkt', N'mittal', N'mittal', N'mittal', 123, 7, N'six', NULL, 111)
INSERT [dbo].[Orders] ([Id], [Title], [First], [Middle], [Last], [MobileNo], [ProductId], [NumberShipped], [OrderDate], [SuppliersId]) VALUES (2010, N'vkt', N'mittalvishnu', N'mittalkabsthakur', N'mittal', 123, 7, N'six', NULL, 111)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductName], [PartNumber], [ProductLabel], [StartingInventory], [InventoryReceived], [Inventoryshipped], [InventoryOnHand], [MinimumRequired], [Price], [CategoryId]) VALUES (7, N'Pepsi', 0, N'Cocacola Private Limit', 5, 10, 4, 1, 2, CAST(15.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [PartNumber], [ProductLabel], [StartingInventory], [InventoryReceived], [Inventoryshipped], [InventoryOnHand], [MinimumRequired], [Price], [CategoryId]) VALUES (8, N'Maaza', 0, N'Cocacola private Limit', 5, 4, 3, 6, 3, CAST(20.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [PartNumber], [ProductLabel], [StartingInventory], [InventoryReceived], [Inventoryshipped], [InventoryOnHand], [MinimumRequired], [Price], [CategoryId]) VALUES (9, N'Mirinda', 0, N'bakery.Limited', 4, 2, 1, 1, 5, CAST(10.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [PartNumber], [ProductLabel], [StartingInventory], [InventoryReceived], [Inventoryshipped], [InventoryOnHand], [MinimumRequired], [Price], [CategoryId]) VALUES (16, N'thumup', 0, N'jio.PrivateLimited', 5, 5, 5, 5, 5, CAST(18.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [PartNumber], [ProductLabel], [StartingInventory], [InventoryReceived], [Inventoryshipped], [InventoryOnHand], [MinimumRequired], [Price], [CategoryId]) VALUES (17, N'Limkavdfgbdfbgvvvvvvvvv', 0, N'relaince.privateLimited', 5, 6, 6, 6, 6, CAST(20.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [PartNumber], [ProductLabel], [StartingInventory], [InventoryReceived], [Inventoryshipped], [InventoryOnHand], [MinimumRequired], [Price], [CategoryId]) VALUES (18, N'pepsi', 0, N'jioprivatevvv', 1, 2, 3, 3, 2, NULL, NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [PartNumber], [ProductLabel], [StartingInventory], [InventoryReceived], [Inventoryshipped], [InventoryOnHand], [MinimumRequired], [Price], [CategoryId]) VALUES (19, N'Maazavishnu', 0, N'tata', 5, 5, 5, 5, 5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchases] ON 

INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (2, 34, 8, 66, CAST(N'1999-01-01' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (3, 111, 9, 0, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (4, 111, 7, 55, CAST(N'2024-06-26' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (5, 222, 8, 66, CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (6, 222, 9, 0, CAST(N'2024-06-23' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (7, 111, 7, 55, CAST(N'2024-07-26' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (8, 222, 8, 66, CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (9, 222, 9, 0, CAST(N'2024-07-23' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (10, 111, 7, 55, CAST(N'2024-06-26' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (11, 222, 16, 66, CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (12, 222, 9, 0, CAST(N'2024-06-23' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (13, 111, 17, 55, CAST(N'2024-06-26' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (14, 222, 8, 66, CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (15, 222, 16, 0, CAST(N'2024-06-23' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (16, 222, 17, 0, CAST(N'2024-07-23' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (17, 111, 17, 55, CAST(N'2024-06-26' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (18, 222, 16, 66, CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (19, 222, 16, 0, CAST(N'2024-06-23' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (20, 111, 7, 55, CAST(N'2024-06-26' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (21, 222, 8, 66, CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (22, 222, 9, 0, CAST(N'2024-01-23' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (23, 111, 16, 55, CAST(N'2024-02-26' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (24, 222, 17, 66, CAST(N'2024-03-27' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (25, 222, 9, 0, CAST(N'2024-04-23' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (26, 111, 7, 55, CAST(N'2024-06-26' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (27, 222, 16, 66, CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (28, 222, 17, 0, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Purchases] ([Id], [SupplierId], [ProductId], [Number_Received], [Purchase_date]) VALUES (29, 111, 7, 5, CAST(N'0001-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Purchases] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([Id], [Supplier_Name]) VALUES (111, N'dyughjkl;')
INSERT [dbo].[Suppliers] ([Id], [Supplier_Name]) VALUES (222, N'madhavSupplier')
INSERT [dbo].[Suppliers] ([Id], [Supplier_Name]) VALUES (1779, N'fhjkl;')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[vishnuCustomers] ON 

INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (1, N'Alfreds Futterkiste ', N'Maria Anders ', N'Obere Str. 57 ', N'Berlin ', N'12209 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (2, N'Ana Trujillo Emparedados y helados ', N'Ana Trujillo ', N'Avda. de la Constitución 2222 ', N'México D.F. ', N'05021 ', N'Mexico ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (3, N'Antonio Moreno Taquería ', N'Antonio Moreno ', N'Mataderos 2312 ', N'México D.F. ', N'05023 ', N'Mexico ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (4, N'Around the Horn ', N'Thomas Hardy ', N'120 Hanover Sq. ', N'London ', N'WA1 1DP ', N'UK ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (5, N'Berglunds snabbköp ', N'Christina Berglund ', N'Berguvsvägen 8 ', N'Luleå ', N'S-958 22 ', N'Sweden ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (6, N'Blauer See Delikatessen ', N'Hanna Moos ', N'Forsterstr. 57 ', N'Mannheim ', N'68306 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (7, N'Blondel père et fils ', N'Frédérique Citeaux ', N'24, place Kléber ', N'Strasbourg ', N'67000 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (8, N'Bólido Comidas preparadas ', N'Martín Sommer ', N'C/ Araquil, 67 ', N'Madrid ', N'28023 ', N'Spain ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (9, N'Bon app'' ', N'Laurence Lebihans ', N'12, rue des Bouchers ', N'Marseille ', N'13008 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (10, N'Bottom-Dollar Marketse ', N'Elizabeth Lincoln ', N'23 Tsawassen Blvd. ', N'Tsawassen ', N'T2F 8M4 ', N'Canada ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (11, N'B''s Beverages ', N'Victoria Ashworth ', N'Fauntleroy Circus ', N'London ', N'EC2 5NT ', N'UK ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (12, N'Cactus Comidas para llevar ', N'Patricio Simpson ', N'Cerrito 333 ', N'Buenos Aires ', N'1010 ', N'Argentina ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (13, N'Centro comercial Moctezuma ', N'Francisco Chang ', N'Sierras de Granada 9993 ', N'México D.F. ', N'05022 ', N'Mexico ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (14, N'Chop-suey Chinese ', N'Yang Wang ', N'Hauptstr. 29 ', N'Bern ', N'3012 ', N'Switzerland ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (15, N'Comércio Mineiro ', N'Pedro Afonso ', N'Av. dos Lusíadas, 23 ', N'São Paulo ', N'05432-043 ', N'Brazil ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (16, N'Consolidated Holdings ', N'Elizabeth Brown ', N'Berkeley Gardens 12 Brewery  ', N'London ', N'WX1 6LT ', N'UK ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (17, N'Drachenblut Delikatessend ', N'Sven Ottlieb ', N'Walserweg 21 ', N'Aachen ', N'52066 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (18, N'Du monde entier ', N'Janine Labrune ', N'67, rue des Cinquante Otages ', N'Nantes ', N'44000 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (19, N'Eastern Connection ', N'Ann Devon ', N'35 King George ', N'London ', N'WX3 6FW ', N'UK ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (20, N'Ernst Handel ', N'Roland Mendel ', N'Kirchgasse 6 ', N'Graz ', N'8010 ', N'Austria ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (21, N'Familia Arquibaldo ', N'Aria Cruz ', N'Rua Orós, 92 ', N'São Paulo ', N'05442-030 ', N'Brazil ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (22, N'FISSA Fabrica Inter. Salchichas S.A. ', N'Diego Roel ', N'C/ Moralzarzal, 86 ', N'Madrid ', N'28034 ', N'Spain ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (23, N'Folies gourmandes ', N'Martine Rancé ', N'184, chaussée de Tournai ', N'Lille ', N'59000 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (24, N'Folk och fä HB ', N'Maria Larsson ', N'Åkergatan 24 ', N'Bräcke ', N'S-844 67 ', N'Sweden ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (25, N'Frankenversand ', N'Peter Franken ', N'Berliner Platz 43 ', N'München ', N'80805 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (26, N'France restauration ', N'Carine Schmitt ', N'54, rue Royale ', N'Nantes ', N'44000 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (27, N'Franchi S.p.A. ', N'Paolo Accorti ', N'Via Monte Bianco 34 ', N'Torino ', N'10100 ', N'Italy ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (28, N'Furia Bacalhau e Frutos do Mar ', N'Lino Rodriguez  ', N'Jardim das rosas n. 32 ', N'Lisboa ', N'1675 ', N'Portugal ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (29, N'Galería del gastrónomo ', N'Eduardo Saavedra ', N'Rambla de Cataluña, 23 ', N'Barcelona ', N'08022 ', N'Spain ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (30, N'Godos Cocina Típica ', N'José Pedro Freyre ', N'C/ Romero, 33 ', N'Sevilla ', N'41101 ', N'Spain ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (31, N'Gourmet Lanchonetes ', N'André Fonseca ', N'Av. Brasil, 442 ', N'Campinas ', N'04876-786 ', N'Brazil ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (32, N'Great Lakes Food Market ', N'Howard Snyder ', N'2732 Baker Blvd. ', N'Eugene ', N'97403 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (33, N'GROSELLA-Restaurante ', N'Manuel Pereira ', N'5ª Ave. Los Palos Grandes ', N'Caracas ', N'1081 ', N'Venezuela ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (34, N'Hanari Carnes ', N'Mario Pontes ', N'Rua do Paço, 67 ', N'Rio de Janeiro ', N'05454-876 ', N'Brazil ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (35, N'HILARIÓN-Abastos ', N'Carlos Hernández ', N'Carrera 22 con Ave. Carlos Soublette #8-35 ', N'San Cristóbal ', N'5022 ', N'Venezuela ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (36, N'Hungry Coyote Import Store ', N'Yoshi Latimer ', N'City Center Plaza 516 Main St. ', N'Elgin ', N'97827 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (37, N'Hungry Owl All-Night Grocers ', N'Patricia McKenna ', N'8 Johnstown Road ', N'Cork ', N' ', N'Ireland ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (38, N'Island Trading ', N'Helen Bennett ', N'Garden House Crowther Way ', N'Cowes ', N'PO31 7PJ ', N'UK ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (39, N'Königlich Essen ', N'Philip Cramer ', N'Maubelstr. 90 ', N'Brandenburg ', N'14776 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (40, N'La corne d''abondance ', N'Daniel Tonini ', N'67, avenue de l''Europe ', N'Versailles ', N'78000 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (41, N'La maison d''Asie ', N'Annette Roulet ', N'1 rue Alsace-Lorraine ', N'Toulouse ', N'31000 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (42, N'Laughing Bacchus Wine Cellars ', N'Yoshi Tannamuri ', N'1900 Oak St. ', N'Vancouver ', N'V3F 2K1 ', N'Canada ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (43, N'Lazy K Kountry Store ', N'John Steel ', N'12 Orchestra Terrace ', N'Walla Walla ', N'99362 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (44, N'Lehmanns Marktstand ', N'Renate Messner ', N'Magazinweg 7 ', N'Frankfurt a.M.  ', N'60528 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (45, N'Let''s Stop N Shop ', N'Jaime Yorres ', N'87 Polk St. Suite 5 ', N'San Francisco ', N'94117 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (46, N'LILA-Supermercado ', N'Carlos González ', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo ', N'Barquisimeto ', N'3508 ', N'Venezuela ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (47, N'LINO-Delicateses ', N'Felipe Izquierdo ', N'Ave. 5 de Mayo Porlamar ', N'I. de Margarita ', N'4980 ', N'Venezuela ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (48, N'Lonesome Pine Restaurant ', N'Fran Wilson ', N'89 Chiaroscuro Rd. ', N'Portland ', N'97219 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (49, N'Magazzini Alimentari Riuniti ', N'Giovanni Rovelli ', N'Via Ludovico il Moro 22 ', N'Bergamo ', N'24100 ', N'Italy ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (50, N'Maison Dewey ', N'Catherine Dewey ', N'Rue Joseph-Bens 532 ', N'Bruxelles ', N'B-1180 ', N'Belgium ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (51, N'Mère Paillarde ', N'Jean Fresnière ', N'43 rue St. Laurent ', N'Montréal ', N'H1J 1C3 ', N'Canada ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (52, N'Morgenstern Gesundkost ', N'Alexander Feuer ', N'Heerstr. 22 ', N'Leipzig ', N'04179 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (53, N'North/South ', N'Simon Crowther ', N'South House 300 Queensbridge ', N'London ', N'SW7 1RZ ', N'UK ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (54, N'Océano Atlántico Ltda. ', N'Yvonne Moncada ', N'Ing. Gustavo Moncada 8585 Piso 20-A ', N'Buenos Aires ', N'1010 ', N'Argentina ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (55, N'Old World Delicatessen ', N'Rene Phillips ', N'2743 Bering St. ', N'Anchorage ', N'99508 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (56, N'Ottilies Käseladen ', N'Henriette Pfalzheim ', N'Mehrheimerstr. 369 ', N'Köln ', N'50739 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (57, N'Paris spécialités ', N'Marie Bertrand ', N'265, boulevard Charonne ', N'Paris ', N'75012 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (58, N'Pericles Comidas clásicas ', N'Guillermo Fernández ', N'Calle Dr. Jorge Cash 321 ', N'México D.F. ', N'05033 ', N'Mexico ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (59, N'Piccolo und mehr ', N'Georg Pipps ', N'Geislweg 14 ', N'Salzburg ', N'5020 ', N'Austria ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (60, N'Princesa Isabel Vinhoss ', N'Isabel de Castro ', N'Estrada da saúde n. 58 ', N'Lisboa ', N'1756 ', N'Portugal ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (61, N'Que Delícia ', N'Bernardo Batista ', N'Rua da Panificadora, 12 ', N'Rio de Janeiro ', N'02389-673 ', N'Brazil ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (62, N'Queen Cozinha ', N'Lúcia Carvalho ', N'Alameda dos Canàrios, 891 ', N'São Paulo ', N'05487-020 ', N'Brazil ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (63, N'QUICK-Stop ', N'Horst Kloss ', N'Taucherstraße 10 ', N'Cunewalde ', N'01307 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (64, N'Rancho grande ', N'Sergio Gutiérrez ', N'Av. del Libertador 900 ', N'Buenos Aires ', N'1010 ', N'Argentina ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (65, N'Rattlesnake Canyon Grocery ', N'Paula Wilson ', N'2817 Milton Dr. ', N'Albuquerque ', N'87110 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (66, N'Reggiani Caseifici ', N'Maurizio Moroni ', N'Strada Provinciale 124 ', N'Reggio Emilia ', N'42100 ', N'Italy ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (67, N'Ricardo Adocicados ', N'Janete Limeira ', N'Av. Copacabana, 267 ', N'Rio de Janeiro ', N'02389-890 ', N'Brazil ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (68, N'Richter Supermarkt ', N'Michael Holz ', N'Grenzacherweg 237 ', N'Genève ', N'1203 ', N'Switzerland ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (69, N'Romero y tomillo ', N'Alejandra Camino ', N'Gran Vía, 1 ', N'Madrid ', N'28001 ', N'Spain ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (70, N'Santé Gourmet ', N'Jonas Bergulfsen ', N'Erling Skakkes gate 78 ', N'Stavern ', N'4110 ', N'Norway ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (71, N'Save-a-lot Markets ', N'Jose Pavarotti ', N'187 Suffolk Ln. ', N'Boise ', N'83720 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (72, N'Seven Seas Imports ', N'Hari Kumar ', N'90 Wadhurst Rd. ', N'London ', N'OX15 4NB ', N'UK ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (73, N'Simons bistro ', N'Jytte Petersen ', N'Vinbæltet 34 ', N'København ', N'1734 ', N'Denmark ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (74, N'Spécialités du monde ', N'Dominique Perrier ', N'25, rue Lauriston ', N'Paris ', N'75016 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (75, N'Split Rail Beer & Ale ', N'Art Braunschweiger ', N'P.O. Box 555 ', N'Lander ', N'82520 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (76, N'Suprêmes délices ', N'Pascale Cartrain ', N'Boulevard Tirou, 255 ', N'Charleroi ', N'B-6000 ', N'Belgium ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (77, N'The Big Cheese ', N'Liz Nixon ', N'89 Jefferson Way Suite 2 ', N'Portland ', N'97201 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (78, N'The Cracker Box ', N'Liu Wong ', N'55 Grizzly Peak Rd. ', N'Butte ', N'59801 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (79, N'Toms Spezialitäten ', N'Karin Josephs ', N'Luisenstr. 48 ', N'Münster ', N'44087 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (80, N'Tortuga Restaurante ', N'Miguel Angel Paolino ', N'Avda. Azteca 123 ', N'México D.F. ', N'05033 ', N'Mexico ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (81, N'Tradição Hipermercados ', N'Anabela Domingues ', N'Av. Inês de Castro, 414 ', N'São Paulo ', N'05634-030 ', N'Brazil ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (82, N'Trail''s Head Gourmet Provisioners ', N'Helvetius Nagy ', N'722 DaVinci Blvd. ', N'Kirkland ', N'98034 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (83, N'Vaffeljernet ', N'Palle Ibsen ', N'Smagsløget 45 ', N'Århus ', N'8200 ', N'Denmark ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (84, N'Victuailles en stock ', N'Mary Saveley ', N'2, rue du Commerce ', N'Lyon ', N'69004 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (85, N'Vins et alcools Chevalier ', N'Paul Henriot ', N'59 rue de l''Abbaye ', N'Reims ', N'51100 ', N'France ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (86, N'Die Wandernde Kuh ', N'Rita Müller ', N'Adenauerallee 900 ', N'Stuttgart ', N'70563 ', N'Germany ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (87, N'Wartian Herkku ', N'Pirkko Koskitalo ', N'Torikatu 38 ', N'Oulu ', N'90110 ', N'Finland ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (88, N'Wellington Importadora ', N'Paula Parente ', N'Rua do Mercado, 12 ', N'Resende ', N'08737-363 ', N'Brazil ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (89, N'White Clover Markets ', N'Karl Jablonski ', N'305 - 14th Ave. S. Suite 3B ', N'Seattle ', N'98128 ', N'USA ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (90, N'Wilman Kala ', N'Matti Karttunen ', N'Keskuskatu 45 ', N'Helsinki ', N'21240 ', N'Finland ')
INSERT [dbo].[vishnuCustomers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (91, N'Wolski ', N'Zbyszek ', N'ul. Filtrowa 68 ', N'Walla ', N'01-012 ', N'Poland ')
SET IDENTITY_INSERT [dbo].[vishnuCustomers] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_CategoryProducts] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_CategoryProducts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Suppliers] FOREIGN KEY([SuppliersId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Suppliers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_product_Category]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_Product]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [Fk_Student_teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[teacher] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [Fk_Student_teacher]
GO
/****** Object:  StoredProcedure [dbo].[numbercom]    Script Date: 20-03-2025 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[numbercom]
@firstn int,
@secondn int
as
begin
	--set  @firstn=5;
	--set  @secondn=10;

	if @firstn >  @secondn
	begin
	select'first number is greater'
	end
	else 
	begin 
	  select 'second number is greater'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllOrders]    Script Date: 20-03-2025 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetAllOrders]
AS
BEGIN

select o.Id,(o.First+' ' + o.Middle+' ' + o.Last) as Customer,
o.MobileNo,o.OrderDate,p.ProductName,p.Price,s.Supplier_Name
FROM Orders o JOIN Products p 
on o.ProductId = p.id join Suppliers as s 
on o.SuppliersId = s.Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_purchasess]    Script Date: 20-03-2025 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_purchasess]
as
begin
select pur.Id,pro.ProductName,s.Supplier_Name,pur.Number_Received,Purchase_date
from purchases as pur join products as pro 
on pur.productId=pro.Id join Suppliers as s
on pur.SupplierId=s.Id
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertAndUpdate]    Script Date: 20-03-2025 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertAndUpdate]
@customerId int ,
@customerName varchar(255),
@contactName varchar(255),
@sAddress varchar(255),
@city varchar(100),
@Postalcode varchar(20),
@country varchar(100)
as 
begin
 if(@customerId = 0)
 begin
 insert into  Customers(CustomerName,ContactName,
 sAddress,city,PostalCode,Country)  
 values(
        @customername,
		@contactName,
		@sAddress,
	    @city,
		@Postalcode,
		@country)
 end
else
begin
update Customers set customerName = @customername,
								contactName = @contactName,
								sAddress=@sAddress,city=@city,
								postalcode = @Postalcode,
								country=@country
								where CustomerID = @customerId
								

end
end
GO
/****** Object:  StoredProcedure [dbo].[spnumbercomparision]    Script Date: 20-03-2025 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spnumbercomparision]
@firstnumber int ,
@secondnumber int
as
set  @firstnumber=5;
set  @secondnumber=10;

if @firstnumber > @secondnumber
begin
select'first number is greater'
end
else 
begin 
  select 'second number is greater'
end
GO
/****** Object:  StoredProcedure [dbo].[spshowdata]    Script Date: 20-03-2025 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spshowdata]
as
begin 
select *from Customers;
end

execute spshowdata;
GO
/****** Object:  StoredProcedure [dbo].[sspnumbercomparision]    Script Date: 20-03-2025 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sspnumbercomparision]
@firstnumber int ,
@secondnumber int
as
set  @firstnumber=5;
set  @secondnumber=10;

if @firstnumber > @secondnumber
begin
select'first number is greater'
end
else 
begin 
  select 'second number is greater'
end

execute sspnumbercomparision;
GO
/****** Object:  StoredProcedure [dbo].[sspshowdata]    Script Date: 20-03-2025 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sspshowdata] 
as
begin 
select CustomerID from Customers;
end

execute sspshowdata;
GO
/****** Object:  StoredProcedure [dbo].[ssspshowdata]    Script Date: 20-03-2025 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ssspshowdata] 
@Id int ,@name varchar(50)  
as
begin 
select *from Customers 
where CustomerID = @Id and
customername = @name;
end

execute ssspshowdata 35,'HILARIÓN-Abastos';
GO
USE [master]
GO
ALTER DATABASE [IMS] SET  READ_WRITE 
GO
