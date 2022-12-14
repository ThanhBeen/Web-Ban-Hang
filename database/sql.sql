USE [master]
GO
/****** Object:  Database [Hexashop]    Script Date: 06/09/2022 05:43:46 CH ******/
CREATE DATABASE [Hexashop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechPolyShopDB', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TechPolyShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechPolyShopDB_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TechPolyShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hexashop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hexashop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hexashop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hexashop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hexashop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hexashop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hexashop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hexashop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hexashop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hexashop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hexashop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hexashop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hexashop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hexashop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hexashop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hexashop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hexashop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hexashop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hexashop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hexashop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hexashop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hexashop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hexashop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hexashop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hexashop] SET RECOVERY FULL 
GO
ALTER DATABASE [Hexashop] SET  MULTI_USER 
GO
ALTER DATABASE [Hexashop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hexashop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hexashop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hexashop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hexashop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hexashop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hexashop', N'ON'
GO
ALTER DATABASE [Hexashop] SET QUERY_STORE = OFF
GO
USE [Hexashop]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 06/09/2022 05:43:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](60) NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[photo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 06/09/2022 05:43:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NULL,
	[roleid] [nvarchar](10) NULL,
	[usernames] [varchar](30) NULL,
 CONSTRAINT [PK_authorities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 06/09/2022 05:43:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 06/09/2022 05:43:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [float] NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 06/09/2022 05:43:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NULL,
	[username] [varchar](30) NOT NULL,
	[address] [nvarchar](100) NULL,
 CONSTRAINT [PK__orders__465962296A301955] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 06/09/2022 05:43:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [bigint] NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[discount] [float] NOT NULL,
	[entered_date] [date] NULL,
	[image] [varchar](200) NULL,
	[name] [nvarchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [smallint] NOT NULL,
	[unit_price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 06/09/2022 05:43:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'Công Thành', N'123', N'Le Cong Thanh', N'thanh@gmail.com', NULL)
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'leminh', N'$2a$10$L4YfxZDN6yHoVH6w6epb2OSbdG3S2mp5Poua6kgOLzvLCBjgtnzVm', NULL, NULL, NULL)
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'thanh', N'$2a$10$iuerDQ5liUq031zpbDdiseYqxm20zAu2lctMLC3Ss/Mmkkmqhw0LW', N'Le Cong Thanh', N'thanh@gmail.com', NULL)
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'Thành Lê', N'123', N'Le Cong Thanh', N'thanhlc@gmail.com', NULL)
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'thanh38', N'$2a$10$prDMrcXEpvMA1LLzbLpBc.KuJn8rnnjA7kDA529fOYGLprX1QPpom', N'Le Cong Thanh 38', N'thanh38@gmail.com', NULL)
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'thanhboyz', N'$2a$10$9NSlMsIsG5eZrj6VZwsjNOlB3mAhBXNtuJ4ZIc0XjWup5nZNTbCpm', N'Le Van Than boy', N'thanhboy@gmail.com', NULL)
GO
SET IDENTITY_INSERT [dbo].[authorities] ON 

INSERT [dbo].[authorities] ([id], [username], [roleid], [usernames]) VALUES (4, N'leminh', N'USER', NULL)
INSERT [dbo].[authorities] ([id], [username], [roleid], [usernames]) VALUES (5, N'thanh', N'ADMIN', NULL)
INSERT [dbo].[authorities] ([id], [username], [roleid], [usernames]) VALUES (6, N'thanh38', N'ADMIN', NULL)
INSERT [dbo].[authorities] ([id], [username], [roleid], [usernames]) VALUES (7, N'thanhboyz', N'CUSTOMER', NULL)
SET IDENTITY_INSERT [dbo].[authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [name]) VALUES (1, N'Computer')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (5, N'Quần áoo')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (7, N'Laptopp')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (8, N'Card màn hình')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (9, N'Thời trang nam')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (10, N'Thời trang nữ')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (11, N'Bàn ghếe')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (12, N'Thắt lưng')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (13, N'Quần short')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (14, N'Quần âu')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (15, N'Quần tây')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (16, N'Sơ mi')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (17, N'Áo Polo')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (19, N'Thời trang Unisex')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (22, N'Thoi trang trẻ em')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (24, N'Fashion')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[orderdetails] ON 

INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (4, 4, 10, 9, 18)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (5, 4, 40, 9, 21)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (6, 4, 180, 9, 14)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (7, 1, 450, 10, 20)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (8, 1, 40, 10, 21)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (9, 1, 80, 10, 22)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (10, 1, 120, 10, 28)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (11, 1, 80, 11, 24)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (12, 1, 12, 11, 25)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (13, 1, 30, 11, 26)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (14, 1, 40, 11, 21)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (15, 1, 180, 12, 14)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (16, 1, 10, 12, 18)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (17, 1, 50, 12, 19)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (18, 2, 80, 14, 24)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (19, 1, 12, 14, 25)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (20, 1, 30, 14, 26)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (21, 2, 180, 16, 14)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (22, 1, 10, 16, 18)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (23, 1, 50, 16, 19)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (24, 1, 450, 17, 20)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (25, 1, 40, 17, 21)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (26, 1, 80, 17, 22)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (27, 2, 10, 18, 18)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (28, 1, 180, 18, 14)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (32, 1, 180, 28, 14)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (33, 1, 10, 28, 18)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (34, 2, 180, 29, 14)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (35, 1, 10, 29, 18)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (36, 1, 70, 29, 27)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (37, 1, 180, 29, 29)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (38, 1, 180, 41, 14)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (39, 1, 10, 41, 18)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (40, 3, 450, 42, 20)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (41, 3, 40, 42, 21)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (42, 1, 80, 42, 22)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (43, 2, 80, 42, 24)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (44, 1, 12, 42, 25)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (45, 1, 30, 42, 26)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (46, 1, 180, 43, 14)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (47, 1, 320, 43, 33)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (48, 1, 70, 43, 27)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (49, 1, 56, 43, 23)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (50, 2, 180, 44, 14)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (51, 1, 10, 44, 18)
INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (52, 1, 50, 44, 19)
SET IDENTITY_INSERT [dbo].[orderdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (5, CAST(N'2022-08-20' AS Date), N'thanh', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (6, CAST(N'2022-08-20' AS Date), N'thanh', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (7, CAST(N'2022-08-20' AS Date), N'thanh', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (8, CAST(N'2022-08-20' AS Date), N'thanh', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (9, CAST(N'2022-08-20' AS Date), N'thanh', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (10, CAST(N'2022-08-20' AS Date), N'thanh', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (11, CAST(N'2022-08-20' AS Date), N'leminh', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (12, CAST(N'2022-08-20' AS Date), N'leminh', N'138 Hoa Minh')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (13, CAST(N'2022-08-20' AS Date), N'leminh', N'138 Hoa Minh')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (14, CAST(N'2022-08-20' AS Date), N'thanhboyz', N'138 Nguyen Thi Thap, Hoa Minh, Lien Chieu')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (15, CAST(N'2022-08-20' AS Date), N'thanhboyz', N'138 Nguyen Thi Thap, Hoa Minh, Lien Chieu')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (16, CAST(N'2022-08-20' AS Date), N'thanhboyz', N'138 Nguyen Thi Thap, Hoa Minh, Lien Chieu')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (17, CAST(N'2022-08-20' AS Date), N'thanhboyz', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (18, CAST(N'2022-08-20' AS Date), N'thanh', N'138 Ho Quy Ly')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (27, CAST(N'2022-08-20' AS Date), N'Thành Lê', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (28, CAST(N'2022-08-20' AS Date), N'Thành Lê', N'65 Ho Quy Ly')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (29, CAST(N'2022-08-20' AS Date), N'Thành Lê', N'138 Nguyen Thi Thap')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (41, CAST(N'2022-08-21' AS Date), N'thanh', N'38 Nguyen Thi THAP')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (42, CAST(N'2022-08-21' AS Date), N'thanh', N'138 Nguyen Thi Thap, Hoa Minh')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (43, CAST(N'2022-08-21' AS Date), N'Thành Lê', N'140 Le Duan')
INSERT [dbo].[orders] ([order_id], [order_date], [username], [address]) VALUES (44, CAST(N'2022-08-21' AS Date), N'Công Thành', N'138 Nguyen Thi Thap')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (2, 1, N'Laptop gaming', 10, NULL, N'p05d8c8d1-e0a5-422b-8102-a2bbadd7ecf1.jpg', N'Laptop Gaming', 5, 1, 170)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (10, 19, N'Clother', 10, NULL, N'pcae787dd-95e2-4ffd-b193-2fd033ad382b.jpg', N'Clotherr', 50, 3, 20)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (12, 13, N'quan short', 10, NULL, N'p843278de-fce2-4858-81cb-a4599bf24d54.jpg', N'hello word', 15, 0, 150)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (13, 5, N'chann', 0, NULL, N'p2a45d7f9-e16c-401a-8607-5b6b9fa09738.jpg', N'chan', 15, 4, 150)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (14, 9, N'Thoi trang nam bacssic', 10, NULL, N'pa4c81848-9864-43db-a21e-8c518f20bde5.jpg', N'Classic Spring', 12, 1, 180)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (18, 9, N'Thoi trang nam ', 15, NULL, N'peccadc7b-8d1f-4c56-964c-9885bfdd661f.jpg', N'Air Force 1 X', 200000, 3, 10)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (19, 9, N'Thoi trang nam cao cap', 15, NULL, N'p8cc022ef-e144-44a6-9ade-2012fa08cbcc.jpg', N'Love Nava 20', 60, 3, 50)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (20, 10, N'Thoi trang nu bassicc', 15, NULL, N'p659c751e-0871-4ba7-826f-23726ace4b01.jpg', N'Classic Dress', 80, 0, 450)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (21, 10, N'Thoi trang nu', 10, NULL, N'p065d6e67-76a6-4744-9940-5b414ea00eb4.jpg', N'New Green Jacket', 55, 4, 40)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (22, 10, N'Thoi trang nu cao cap', 15, NULL, N'pb0392586-b8e5-484a-9293-917dbb400b13.jpg', N'Spring Collection', 90, 3, 80)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (23, 9, N'Thoi trang duong pho', 10, NULL, N'pc624bb8a-458a-49ef-8995-21ce125e9e81.jpg', N' Street fashion', 67, 3, 56)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (24, 22, N'Thoi trang den truong', 10, NULL, N'p6c4c181d-5eaa-4de0-a0a0-360ceddcec74.jpg', N'School Collection', 15, 3, 80)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (25, 22, N'Thoi trang mua he', 0, NULL, N'pafba1e99-6ed0-47c8-8133-a6e151e2daaa.jpg', N'Summer Cap', 15, 2, 12)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (26, 22, N'Thoi trang tre em bassic', 15, NULL, N'pa08eea67-4cf4-4dcf-8bd9-4bb908cd3df9.jpg', N'Classic Kid', 60, 3, 30)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (27, 9, N'Thoi trang duong pho', 15, NULL, N'pf5fdfbcd-f036-4a5f-8ffa-ced36f07867d.jpg', N'Street fashionn', 60, 3, 70)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (28, 10, N'Thoi trang nu duong pho', 5, NULL, N'pe0ac6d0d-eb30-4d44-8258-1012b767ad94.jpg', N'Street fashionn woman', 56, 1, 120)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (29, 10, N'Thoi trang nu sang chanh', 20, NULL, N'p588949aa-f6db-4e67-9752-0e4e8a440bf6.jpg', N' Luxury fashion', 45, 3, 180)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (30, 10, N'Thoi trang nu sang chanh', 10, NULL, N'p7840a611-cf3e-41e5-833c-f5f5cf5eae15.jpg', N' Luxury fashion women', 17, 2, 320)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (31, 10, N'Thoi trang nu quy toc', 15, NULL, N'p92bc413d-75a7-4647-85f1-cedc378d26f5.jpg', N' Aristocratic fashion', 100, 3, 250)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (32, 10, N'Thoi trang nu tre trung', 15, NULL, N'p898ee20a-950e-4c8b-9fe2-82c1a886c94e.jpg', N' Active fashion', 60, 1, 50)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (33, 9, N'Quy ong ', 15, NULL, N'pbb345269-358f-4542-bfb3-4bb94b5eba37.jpg', N'Gentleman fashion', 200, 3, 320)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (34, 22, N'Thoi trang tre doi', 5, NULL, N'p960981fd-472e-4a76-a350-afe1e4f1dc6a.jpg', N' Child fashion', 60, 4, 150)
INSERT [dbo].[products] ([product_id], [category_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (35, 9, N'thoi trang nam', 10, NULL, N'p70a73c92-b433-4370-af15-8932d77fe32b.jpg', N'', 1, 3, 150)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (N'ADMIN', N'Administrator')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'CUSTOMER', N'Customers')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'USER', N'Users')
GO
ALTER TABLE [dbo].[orderdetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [image]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FK_authorities_accounts] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FK_authorities_accounts]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FK_authorities_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FK_authorities_roles]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FKjkpg4n6lh2ao27olfrs9osfpx] FOREIGN KEY([usernames])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FKjkpg4n6lh2ao27olfrs9osfpx]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_orderdetails_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK_orderdetails_orders]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK92im1bt9gndrexccag7x5oq92] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK92im1bt9gndrexccag7x5oq92]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_accounts1] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_accounts1]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'accounts', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'accounts', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'categories', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'orderdetails', @level2type=N'COLUMN',@level2name=N'quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'products', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'products', @level2type=N'COLUMN',@level2name=N'name'
GO
USE [master]
GO
ALTER DATABASE [Hexashop] SET  READ_WRITE 
GO
