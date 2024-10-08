USE [master]
GO
/****** Object:  Database [swp_restaurant]    Script Date: 10/1/2024 3:15:45 AM ******/
CREATE DATABASE [swp_restaurant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'swp_restaurant', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\swp_restaurant.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'swp_restaurant_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\swp_restaurant_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [swp_restaurant] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [swp_restaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [swp_restaurant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [swp_restaurant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [swp_restaurant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [swp_restaurant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [swp_restaurant] SET ARITHABORT OFF 
GO
ALTER DATABASE [swp_restaurant] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [swp_restaurant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [swp_restaurant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [swp_restaurant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [swp_restaurant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [swp_restaurant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [swp_restaurant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [swp_restaurant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [swp_restaurant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [swp_restaurant] SET  ENABLE_BROKER 
GO
ALTER DATABASE [swp_restaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [swp_restaurant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [swp_restaurant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [swp_restaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [swp_restaurant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [swp_restaurant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [swp_restaurant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [swp_restaurant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [swp_restaurant] SET  MULTI_USER 
GO
ALTER DATABASE [swp_restaurant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [swp_restaurant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [swp_restaurant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [swp_restaurant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [swp_restaurant] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [swp_restaurant] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [swp_restaurant] SET QUERY_STORE = OFF
GO
USE [swp_restaurant]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/1/2024 3:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiningTable]    Script Date: 10/1/2024 3:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiningTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NULL,
	[capacity] [varchar](50) NULL,
	[is_available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 10/1/2024 3:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](400) NOT NULL,
	[price] [money] NULL,
	[description] [nvarchar](max) NULL,
	[brief_info] [nvarchar](max) NULL,
	[is_available] [bit] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK__Dish__3213E83F772706FF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DishImage]    Script Date: 10/1/2024 3:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DishImage](
	[dish_id] [int] NOT NULL,
	[image_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC,
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 10/1/2024 3:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/1/2024 3:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[table_id] [int] NULL,
	[status] [nvarchar](50) NULL,
	[order_datetime] [datetime] NULL,
	[total_cost] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/1/2024 3:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/1/2024 3:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](1000) NULL,
	[fullName] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[gender] [nvarchar](30) NULL,
	[avatar] [nvarchar](max) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](40) NULL,
	[address] [nvarchar](200) NULL,
	[role] [nvarchar](50) NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Khai vị')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Món chính')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Món chay')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Món nước')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Món tráng miệng')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Đồ uống')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Combo')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Món nướng')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Món ăn kèm')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Dish] ON 

INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (1, N'Phở bò', 50000.0000, N'Phở truyền thống thơm ngon', N'Món nu?c d?c trung Vi?t Nam', 1, 4)
INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (2, N'Bún chả', 45000.0000, N'Bún chả với thịt nướng thơm lừng, ăn kèm rau sống', N'Món nướng Hà Nội nổi tiếng', 1, 2)
INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (3, N'Cơm tấm sườn', 55000.0000, N'Cơm tấm sườn nướng với chả và trứng ốp la', N'Món ăn phổ biến miền Nam', 1, 2)
INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (4, N'Gỏi cuốn tôm thịt', 35000.0000, N'Gỏi cuốn với tôm, thịt, bún và rau cuốn chấm nước mắm', N'Món khai vị tươi mát', 1, 2)
INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (5, N'Bánh xèo', 40000.0000, N'Bánh xèo vàng giòn, ăn kèm rau sống và nước chấm', N'Món ăn đặc sản miền Trung', 1, 2)
INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (6, N'Lẩu thái hải sản', 150000.0000, N'Lẩu thái cay chua với tôm, mực, nghêu, rau củ', N'Món lẩu thơm ngon', 1, 4)
INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (7, N'Chả giò', 30000.0000, N'Chả giò chiên giòn với nhân thịt heo và rau củ', N'Món khai vị giòn rụm', 1, 9)
INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (8, N'Mì xào hải sản', 60000.0000, N'Mì xào với tôm, mực, rau cải và sốt đậm đà', N'Món mì hấp dẫn', 1, 2)
INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (9, N'Gà nướng mật ong', 90000.0000, N'Gà nướng mềm thơm, tẩm mật ong ngọt dịu', N'Món chính được ưa thích', 1, 2)
INSERT [dbo].[Dish] ([id], [name], [price], [description], [brief_info], [is_available], [category_id]) VALUES (10, N'Chè ba màu', 25000.0000, N'Chè ba màu với đậu đỏ, đậu xanh, thạch rau câu', N'Món tráng miệng ngọt mát', 1, 9)
SET IDENTITY_INSERT [dbo].[Dish] OFF
GO
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (1, 1)
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (2, 2)
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (3, 3)
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (4, 4)
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (5, 5)
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (6, 6)
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (7, 7)
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (8, 8)
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (9, 9)
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (10, 10)
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([id], [url]) VALUES (1, N'./images/pb.png')
INSERT [dbo].[Image] ([id], [url]) VALUES (2, N'./images/bch.png')
INSERT [dbo].[Image] ([id], [url]) VALUES (3, N'./images/ct.png')
INSERT [dbo].[Image] ([id], [url]) VALUES (4, N'./images/gctt.png')
INSERT [dbo].[Image] ([id], [url]) VALUES (5, N'./images/bx.png')
INSERT [dbo].[Image] ([id], [url]) VALUES (6, N'./images/lths.png')
INSERT [dbo].[Image] ([id], [url]) VALUES (7, N'./images/cg.png')
INSERT [dbo].[Image] ([id], [url]) VALUES (8, N'./images/mx.png')
INSERT [dbo].[Image] ([id], [url]) VALUES (9, N'./images/gn.png')
INSERT [dbo].[Image] ([id], [url]) VALUES (10, N'./images/c3m.png')
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
INSERT [dbo].[User] ([userId], [username], [password], [fullName], [dob], [gender], [avatar], [phone], [email], [address], [role], [active]) VALUES (1030057095, N'Nguyen Van An', N'932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef', N'Nguyen Van An', CAST(N'2000-08-28' AS Date), N'male', NULL, N'0123123123', N'nva123@gmail.com', N'HN', N'user', 1)
GO
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [FK__Dish__category_i__2A4B4B5E] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [FK__Dish__category_i__2A4B4B5E]
GO
ALTER TABLE [dbo].[DishImage]  WITH CHECK ADD  CONSTRAINT [FK__DishImage__dish___2D27B809] FOREIGN KEY([dish_id])
REFERENCES [dbo].[Dish] ([id])
GO
ALTER TABLE [dbo].[DishImage] CHECK CONSTRAINT [FK__DishImage__dish___2D27B809]
GO
ALTER TABLE [dbo].[DishImage]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[Image] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[DiningTable] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__dish___37A5467C] FOREIGN KEY([dish_id])
REFERENCES [dbo].[Dish] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__dish___37A5467C]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
GO
USE [master]
GO
ALTER DATABASE [swp_restaurant] SET  READ_WRITE 
GO
