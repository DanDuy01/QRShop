USE [master]
GO
/****** Object:  Database [swp_restaurant]    Script Date: 10/16/2024 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 10/16/2024 12:02:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[customer_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL,
	[table_id] [int] NOT NULL,
 CONSTRAINT [PK__Cart__44977F4AF06159BF] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[dish_id] ASC,
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/16/2024 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[DiningTable]    Script Date: 10/16/2024 12:02:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiningTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[capacity] [nvarchar](50) NULL,
 CONSTRAINT [PK__DiningTa__3213E83F83AD9D6E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 10/16/2024 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[DishImage]    Script Date: 10/16/2024 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/16/2024 12:02:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[fback_id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[rated_star] [int] NULL,
	[feedback_content] [nvarchar](max) NULL,
	[feedback_image] [varchar](max) NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
	[date] [datetime] NULL,
	[avatar_user] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[fback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 10/16/2024 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 10/16/2024 12:02:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[customer_name] [nvarchar](50) NULL,
	[table_id] [int] NULL,
	[order_datetime] [datetime] NULL,
	[total_cost] [money] NULL,
	[email] [varchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[note] [nvarchar](200) NULL,
	[payment_method] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK__Order__3213E83FD2DE39E9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/16/2024 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10/16/2024 12:02:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](40) NULL,
	[phone] [varchar](20) NULL,
	[password] [nvarchar](1000) NULL,
	[fullName] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[gender] [nvarchar](30) NULL,
	[avatar] [nvarchar](max) NULL,
	[address] [nvarchar](200) NULL,
	[role] [nvarchar](50) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK__User__CB9A1CFF0939E4C8] PRIMARY KEY CLUSTERED 
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
SET IDENTITY_INSERT [dbo].[DiningTable] ON 

INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (1, N'Bàn 1', N'1-2 người')
INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (2, N'Bàn 2', N'1-2 người')
INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (3, N'Bàn 3', N'1-2 người')
INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (4, N'Bàn 4 ', N'2-4 người')
INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (5, N'Bàn 5', N'2-4 người')
INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (6, N'Bàn 6', N'2-4 người')
INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (7, N'Bàn 7', N'5-10 người')
INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (8, N'Bàn 8', N'5-10 người')
INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (9, N'Bàn 9', N'>10 người')
INSERT [dbo].[DiningTable] ([id], [name], [capacity]) VALUES (10, N'Bàn 10', N'>10 người')
SET IDENTITY_INSERT [dbo].[DiningTable] OFF
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
INSERT [dbo].[DishImage] ([dish_id], [image_id]) VALUES (10, 11)
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([fback_id], [fullName], [rated_star], [feedback_content], [feedback_image], [product_id], [user_id], [date], [avatar_user]) VALUES (3, N'Nguyen Truong', 3, N'ngon', N'data:image/png;base64,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', 7, 1030057097, CAST(N'2024-10-16T00:00:54.477' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
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
INSERT [dbo].[Image] ([id], [url]) VALUES (11, N'./images/c3m2.png')
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userId], [email], [phone], [password], [fullName], [dob], [gender], [avatar], [address], [role], [active]) VALUES (1030057097, N'nva123@gmail.com', N'0123123123', N'932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef', N'Nguyen Truong', CAST(N'2000-10-10' AS Date), N'male', NULL, N'Hà Nội', N'user', 1)
INSERT [dbo].[User] ([userId], [email], [phone], [password], [fullName], [dob], [gender], [avatar], [address], [role], [active]) VALUES (1030057098, N'admin@gmail.com', N'0123456789', N'932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef', N'admin', CAST(N'2000-10-11' AS Date), N'male', NULL, N'HCM', N'admin', 1)
INSERT [dbo].[User] ([userId], [email], [phone], [password], [fullName], [dob], [gender], [avatar], [address], [role], [active]) VALUES (1030057099, N'staff@gmail.com', N'0111222333', N'932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef', N'Lê Thị Yến', CAST(N'2000-11-03' AS Date), N'female', NULL, N'Thái Bình', N'staff', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK__Cart__customer_i__00200768] FOREIGN KEY([customer_id])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK__Cart__customer_i__00200768]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK__Cart__dish_id__01142BA1] FOREIGN KEY([dish_id])
REFERENCES [dbo].[Dish] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK__Cart__dish_id__01142BA1]
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
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Dish] ([id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__user_i__5DCAEF64] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Feedback__user_i__5DCAEF64]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__customer___32E0915F] FOREIGN KEY([customer_id])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__customer___32E0915F]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__dish___37A5467C] FOREIGN KEY([dish_id])
REFERENCES [dbo].[Dish] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__dish___37A5467C]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__36B12243] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__36B12243]
GO
USE [master]
GO
ALTER DATABASE [swp_restaurant] SET  READ_WRITE 
GO
