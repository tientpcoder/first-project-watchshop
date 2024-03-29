USE [master]
GO
/****** Object:  Database [Project]    Script Date: 11/26/2019 4:57:51 PM ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET QUERY_STORE = OFF
GO
USE [Project]
GO
/****** Object:  Table [dbo].[ATM]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ATM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Country] [nvarchar](150) NOT NULL,
	[Logo] [varchar](max) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[sort_order] [nchar](10) NULL,
	[link] [nvarchar](max) NULL,
	[banner] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[name] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[hotline] [nchar](15) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[fb] [nvarchar](max) NOT NULL,
	[yt] [nvarchar](max) NOT NULL,
	[map] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crystal]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crystal](
	[Crystal_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Crystal] PRIMARY KEY CLUSTERED 
(
	[Crystal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dial_Shape]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dial_Shape](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Dial_Shape] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[contents] [nvarchar](max) NOT NULL,
	[rate] [int] NOT NULL,
	[Produc_ID] [varchar](150) NOT NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movement]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movement](
	[Movement_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Movement] PRIMARY KEY CLUSTERED 
(
	[Movement_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
	[UserID] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[total] [bigint] NOT NULL,
	[message] [nvarchar](max) NULL,
	[created] [date] NOT NULL,
	[purchase] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[OrderID] [bigint] NOT NULL,
	[ProductID] [varchar](150) NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [bigint] NOT NULL,
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInfo]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInfo](
	[Product_ID] [varchar](150) NOT NULL,
	[Crystal_ID] [int] NOT NULL,
	[Movement_ID] [int] NOT NULL,
	[Dial_Size] [int] NOT NULL,
	[Dial_Thickness] [int] NOT NULL,
	[Strap_ID] [int] NOT NULL,
	[ATM_ID] [int] NOT NULL,
	[Dial_Shape_ID] [int] NOT NULL,
 CONSTRAINT [PK_ProductInfo] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [varchar](150) NOT NULL,
	[CateID] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Price] [bigint] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [int] NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Created] [date] NOT NULL,
	[status] [bit] NOT NULL,
	[Brand_id] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Strap]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Strap](
	[StrapID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Strap] PRIMARY KEY CLUSTERED 
(
	[StrapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/26/2019 4:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[created] [date] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ATM] ON 

INSERT [dbo].[ATM] ([ID], [Type]) VALUES (1, N'Đi Mưa Nhỏ (3 ATM)')
INSERT [dbo].[ATM] ([ID], [Type]) VALUES (2, N'Đi Tắm (5 ATM)')
INSERT [dbo].[ATM] ([ID], [Type]) VALUES (3, N'Đi Bơi  (10 ATM)')
INSERT [dbo].[ATM] ([ID], [Type]) VALUES (4, N'Lặn Biển (20 ATM)')
INSERT [dbo].[ATM] ([ID], [Type]) VALUES (5, N'Lặn Sâu (30 ATM)')
SET IDENTITY_INSERT [dbo].[ATM] OFF
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([ID], [Name], [Country], [Logo]) VALUES (1, N'DANIEL WELLINGTON', N'Thụy Điển
', N'logo_dw.png')
INSERT [dbo].[Brands] ([ID], [Name], [Country], [Logo]) VALUES (2, N'TISSOT', N'Thụy Sỹ
', N'logo_tissot.jpg')
INSERT [dbo].[Brands] ([ID], [Name], [Country], [Logo]) VALUES (3, N'CITIZEN ', N'Nhật Bản', N'citizen_logo.png')
INSERT [dbo].[Brands] ([ID], [Name], [Country], [Logo]) VALUES (4, N'Casio', N' Nhật Bản', N'Casio-Logo.png')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name], [sort_order], [link], [banner], [description]) VALUES (1, N'Giới Thiệu', N'1         ', N'gt.jsp', N'banner.jpg', N'“Người ta vẫn thường nói “thời gian là vĩnh cữu”, mọi thứ trên thế giới này có thể bị lụi tàn hoặc thụt lùi, nhưng thời gian sẽ không bao giờ phai mờ. Chính vì thế, hãy trân trọng thời gian của mình đang có với một chiếc đồng hồ chính hãng (vật dùng để kiểm soát thời gian). Nếu bạn là phái mạnh, thì đồng hồ đeo tay nam chính hãng không chỉ đơn giản dùng để kiểm soát thời gian dành cho bạn mà còn phụ kiện để khẳng định địa vị trong xã hội. Nếu bạn là phái đẹp, thì đồng hồ đeo tay nữ chính hãng sẽ là phụ kiện thời trang sành điệu nhất trong những sự kiện quan trọng dành cho bạn….”')
INSERT [dbo].[Categories] ([ID], [Name], [sort_order], [link], [banner], [description]) VALUES (2, N'Đồng Hồ Nam', N'2         ', N'WatchByCate?Cate=2', N'dong-ho-nam-banner.jpg', N'“Cùng với sự phát triển không ngừng của thời trang thế giới, rất nhiều thương hiệu cho ra đời những mẫu đồng hồ nam chính hãng đa dạng về phong cách, kiểu dáng, màu sắc, kích cỡ… Một chiếc đồng hồ nam cao cấp chính hãng khắc họa một giá trị đích thực khi nói đến phụ kiện xa xỉ dành cho phái mạnh. Hiện nay, đồng hồ là phụ kiện thời trang thiết yếu đối với những người đàn ông hiện đại ngày nay. Trên cổ tay của những người đàn ông thành đạt luôn dành vị trí cho một chiếc đồng hồ nam cao cấp.”')
INSERT [dbo].[Categories] ([ID], [Name], [sort_order], [link], [banner], [description]) VALUES (3, N'Đồng Hồ Nữ', N'3         ', N'WatchByCate?Cate=3', N'dong-ho-nu-1.jpg', N'“Phụ nữ luôn có những yêu cầu cao về phong cách trang phục, phụ kiện bên ngoài của họ. Đặc biệt khi nói về đồng hồ nữ cao cấp thì phái đẹp luôn yêu cầu phải có sự hài hòa về kiểu dáng, màu sắc, sự khéo léo và đặc biệt phải có độ chính xác cao, chất lượng tốt. Đối với những phụ nữ hiện đại ngày nay thì một chiếc đồng hồ nữ chính hãng không thể thiếu trên cổ tay của họ, không chỉ đơn giản là để xem giờ  mà nhằm tôn vinh vẻ đẹp của họ mà thôi. “')
INSERT [dbo].[Categories] ([ID], [Name], [sort_order], [link], [banner], [description]) VALUES (4, N'Đồng Hồ Đôi', N'4         ', N'WatchByCate?Cate=4', N'banner-doi.jpg', N'” Đồng hồ đôi đẹp là sự “chắp cánh” tốt nhất cho tình yêu của hai bạn để bước thêm một nấc thang mới. Đồng hồ đôi (cặp) còn là món quà hết sức ý nghĩa và là vật có thể lưu giữ được những khoảng khắc thời gian lãng mạn trong tình yêu của hai bạn. Vậy thì bạn còn đợi chờ gì nữa, hãy lựa chọn ngay đồng hồ cặp chính hãng đẹp nhất cho một nửa của mình. Bạn sẽ thấy sức mạnh diệu kì đến từ món quà tặng tuyệt vời này, nó không chỉ nằm ở giá trị vật chất mà đồng hồ cặp (đôi) còn mang những giá trị tinh thần hết sức ý nghĩa mà sẽ làm tình yêu đôi lứa bùng cháy dữ dội … “

')
INSERT [dbo].[Categories] ([ID], [Name], [sort_order], [link], [banner], [description]) VALUES (8, N'Liên Hệ', N'6         ', N'lienhe.jsp', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Contact] ([name], [address], [hotline], [email], [fb], [yt], [map]) VALUES (N'Rabbit Watch', N'Trường Đại Học FPT Hà Nội', N'0912700469     ', N'rabbitwatch@gmail.com', N'https://www.facebook.com', N'https://www.youtube.com/channel/UCYztAvenir_QcDp_ADRnJhA', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.482445565967!2d105.52510551533649!3d21.01337369367831!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b32ca5086d%3A0xa3c62e29d8ab37e4!2sFPT%20University!5e0!3m2!1sen!2s!4v1572794047501!5m2!1sen!2s')
SET IDENTITY_INSERT [dbo].[Crystal] ON 

INSERT [dbo].[Crystal] ([Crystal_ID], [Name]) VALUES (1, N'Mineral Crystal (Kính Cứng)
')
INSERT [dbo].[Crystal] ([Crystal_ID], [Name]) VALUES (2, N'Sapphire (Kính Chống Trầy)
')
INSERT [dbo].[Crystal] ([Crystal_ID], [Name]) VALUES (3, N'Kính Nhựa')
SET IDENTITY_INSERT [dbo].[Crystal] OFF
SET IDENTITY_INSERT [dbo].[Dial_Shape] ON 

INSERT [dbo].[Dial_Shape] ([ID], [Name]) VALUES (1, N'Tròn')
INSERT [dbo].[Dial_Shape] ([ID], [Name]) VALUES (2, N'Vuông')
INSERT [dbo].[Dial_Shape] ([ID], [Name]) VALUES (3, N'Chữ Nhật')
SET IDENTITY_INSERT [dbo].[Dial_Shape] OFF
SET IDENTITY_INSERT [dbo].[Movement] ON 

INSERT [dbo].[Movement] ([Movement_ID], [Name]) VALUES (1, N'Quartz (Pin)')
INSERT [dbo].[Movement] ([Movement_ID], [Name]) VALUES (2, N'Automatic (Cơ)')
INSERT [dbo].[Movement] ([Movement_ID], [Name]) VALUES (3, N'Eco-Drive (Năng Lượng Ánh Sáng)')
SET IDENTITY_INSERT [dbo].[Movement] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [Status], [UserID], [Name], [email], [phone], [address], [total], [message], [created], [purchase]) VALUES (4, 1, 2, N'Hoàng Hợp', N'hoangdd@gmail.com', N'0876543642', N'Hà Nội Mùa Thu', 3000000, N'', CAST(N'2019-11-02' AS Date), 0)
INSERT [dbo].[Order] ([ID], [Status], [UserID], [Name], [email], [phone], [address], [total], [message], [created], [purchase]) VALUES (5, 1, 7, N'Duy Anh', N'duyanh@gmail', N'0913444333', N'Thái Nguyên', 53080000, N'em k co tien', CAST(N'2019-11-03' AS Date), 1)
INSERT [dbo].[Order] ([ID], [Status], [UserID], [Name], [email], [phone], [address], [total], [message], [created], [purchase]) VALUES (7, 0, 7, N'Duy Anh', N'duyanh@gmail', N'0913444333', N'Thái Nguyên', 4200000, N'', CAST(N'2019-11-06' AS Date), 0)
INSERT [dbo].[Order] ([ID], [Status], [UserID], [Name], [email], [phone], [address], [total], [message], [created], [purchase]) VALUES (8, 0, 2, N'Hoàng', N'hoangdd@gmail.com', N'0876543642', N'Hà Nội', 16800000, N'', CAST(N'2019-11-11' AS Date), 0)
INSERT [dbo].[Order] ([ID], [Status], [UserID], [Name], [email], [phone], [address], [total], [message], [created], [purchase]) VALUES (9, 0, 1, N'Tiến', N'tientp@gmail.com', N'0868655557', N'Thái Nguyên', 1105000, N'', CAST(N'2019-11-12' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderLine] ([OrderID], [ProductID], [quantity], [total]) VALUES (4, N'DW00100252', 1, 3000000)
INSERT [dbo].[OrderLine] ([OrderID], [ProductID], [quantity], [total]) VALUES (5, N'DW00100313', 2, 4600000)
INSERT [dbo].[OrderLine] ([OrderID], [ProductID], [quantity], [total]) VALUES (5, N'T063.907.36.068.00', 2, 21940000)
INSERT [dbo].[OrderLine] ([OrderID], [ProductID], [quantity], [total]) VALUES (7, N'DW00100018', 1, 4200000)
INSERT [dbo].[OrderLine] ([OrderID], [ProductID], [quantity], [total]) VALUES (8, N'DW00100018', 4, 4200000)
INSERT [dbo].[OrderLine] ([OrderID], [ProductID], [quantity], [total]) VALUES (9, N'AE-1200WHB-3BVDF', 1, 1105000)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'AE-1200WHB-3BVDF', 3, 1, 45, 13, 3, 3, 2)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'AE-1200WHD-1AVDF', 3, 1, 45, 13, 3, 3, 2)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'DW00100018', 1, 1, 6, 42, 4, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'DW00100133', 1, 1, 40, 6, 1, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'DW00100163', 1, 1, 32, 6, 2, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'DW00100249', 1, 1, 28, 6, 1, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'DW00100252', 1, 1, 28, 6, 4, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'DW00100278', 1, 1, 40, 6, 4, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'DW00100313', 1, 1, 28, 6, 4, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'EM0335-51D', 2, 3, 30, 7, 2, 2, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'EM0433-87D', 2, 3, 27, 8, 2, 2, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'MTP-1095Q-1A', 2, 1, 33, 9, 1, 5, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'NJ0090-81E', 2, 2, 42, 10, 2, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'NP1014-51E', 2, 2, 40, 12, 2, 3, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'SHE-4055PGL-7BUDF', 2, 1, 7, 30, 1, 2, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'T063.907.11.058.00', 2, 2, 40, 9, 2, 2, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'T063.907.36.068.00', 2, 2, 40, 9, 1, 2, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'T094.210.11.126.00', 2, 1, 26, 6, 2, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'T109.610.36.051.00', 2, 1, 42, 6, 1, 1, 1)
INSERT [dbo].[ProductInfo] ([Product_ID], [Crystal_ID], [Movement_ID], [Dial_Size], [Dial_Thickness], [Strap_ID], [ATM_ID], [Dial_Shape_ID]) VALUES (N'T914.210.46.017.00', 2, 1, 30, 6, 1, 1, 1)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'AE-1200WHB-3BVDF', 2, N'CASIO AE-1200WHB-3BVDF – NAM – KÍNH NHỰA – QUARTZ (PIN) – DÂY VẢI', 1105000, N'Đồng hồ Casio AE-1200WHB-3BVDF với thiết kế mạnh mẽ, vỏ có màu chủ đạo là màu xanh lục kết hợp cùng màu đen của viền bên ngoài tinh tế, dây đeo bằng vải màu xanh lục cá tính.', 0, N'25_AE-1200WHB-3BVDF-699x699.jpg', CAST(N'2019-11-11' AS Date), 1, 4, 11)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'AE-1200WHD-1AVDF', 2, N'CASIO AE-1200WHD-1AVDF – NAM – KÍNH NHỰA – QUARTZ (PIN) – DÂY KIM LOẠI', 1246000, N'Đồng hồ nam Casio AE1200WHD có mặt đồng hồ vuông to với phong cách thể thao, mặt số điện tử với những tính năng hiện đại tiện dụng, kết hợp với dây đeo bằng kim loại đem lại vẻ mạnh mẽ cá tính dành cho phái nam.

', 0, N'AE1200WHD-1-699x699.jpg', CAST(N'2019-11-11' AS Date), 1, 4, 12)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'DW00100018', 2, N'DANIEL WELLINGTON DW00100018 – NAM – QUARTZ (PIN) – DÂY VẢI', 4200000, N'Đồng hồ Daniel Wellington DW00100018 có mặt số tròn nam tính với viền mỏng tinh tế bao quanh nền số màu trắng thanh lịch, kim chỉ và vạch số được dát mỏng nổi bật, logo DW nằm ở vị trí 12h với chữ D cách điệu tinh tế, dây đeo bằng chất liệu vải NATO cao cấp với màu trắng và màu xanh xen kẽ tạo nên phong cách thời trang trẻ trung, lịch lãm cho phái mạnh.', 10, N'dhnam2.png', CAST(N'2019-10-17' AS Date), 1, 1, 17)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'DW00100133', 2, N'DANIEL WELLINGTON DW00100133 – NAM – QUARTZ (PIN) – DÂY DA', 5300000, N'Đồng hồ nam Daniel Wellington DW00100133 nổi bật đầy giản dị cùng với vẻ nam tính khi kết hợp giữa nền mặt số cùng bộ dây đeo bằng da cùng tông màu đen, kim chỉ cùng vạch số được gia công kiểu dáng mỏng đầy tinh tế.', 0, N'dhnam6.jpg', CAST(N'2019-10-12' AS Date), 1, 1, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'DW00100163', 3, N'Daniel Wellington DW00100163 – Nữ – Quartz (Pin) – Dây Kim Loại', 3200000, N'Mẫu đồng hồ nữ Daniel Wellington DW00100163 kim chỉ cùng vạch số được gia công kiểu dáng thanh mảnh trên nền mặt số tông màu trắng trang trọng, phối cùng bô dây đeo kim loại dạng lưới với tông màu đồng tạo nên vẻ phụ kiện thời trang cho phái đẹp.

', 0, N'dhnu4.jpg', CAST(N'2019-10-17' AS Date), 1, 1, 21)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'DW00100249', 3, N'Daniel Wellington DW00100249 – Nữ – Quartz (Pin) – Dây Da', 4100000, N'Mẫu đồng hồ nữ DW00100249 phong cách giản dị trẻ trung đến từ thương hiệu Daniel Wellington, các chi tiết vạch số vàng hồng kiểu dáng thanh mảnh kết hợp cùng mẫu dây da tông màu trắng đầy thanh lịch.

', 0, N'dhnu2.jpg', CAST(N'2019-10-17' AS Date), 1, 1, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'DW00100252', 3, N'Daniel Wellington DW00100252 – Nữ – Quartz (Pin) – Dây Vải', 3000000, N'Mẫu Daniel Wellington DW00100252 phiên bản cá tính với mẫu dây đeo chất liệu vải tone đen, mặt số trắng trẻ trung kích thước nhỏ nhắn 28mm góp phần tăng thêm vẻ nữ tính.

', 0, N'dhnu3.jpg', CAST(N'2019-10-17' AS Date), 1, 1, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'DW00100278', 2, N'DANIEL WELLINGTON DW00100278 – NAM – QUARTZ (PIN) – DÂY KIM LOẠI', 4600000, N'Mẫu Daniel Wellington DW00100278 phiên bản dây vải tone xanh cá tính kết hợp cùng nền mặt số đen 40mm nổi bật các chi tiết vạch số cùng 2 kim chỉ mạ bạc thời trang cho phái nam.', 0, N'dhnam1.png', CAST(N'2019-10-17' AS Date), 1, 1, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'DW00100313', 3, N'Daniel Wellington DW00100313 – Nữ – Quartz (Pin) – Dây Vải', 4600000, N'Mẫu Daniel Wellington DW00100313 dây vải tone màu trắng thời trang cá tính cho phái đẹp, vỏ máy vàng hồng thiết kế mỏng 6mm tô điểm thêm vẻ ngoài cuốn hút.

', 0, N'dhnu1.jpg', CAST(N'2019-10-17' AS Date), 1, 1, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'EM0335-51D', 3, N'Citizen Nữ – Eco-Drive (Năng Lượng Ánh Sáng) – Kính Sapphire – Dây Kim Loại (EM0335-51D)', 9350000, N'Đồng hồ Citizen EM0335-51D, thiết kế sang trọng mặt đồng hồ có họa tiết xoáy, chất liệu được làm bằng thép không gỉ cùng dây đeo demi tinh tế, còn có chữ số hạt pha lê rất đẹp.

', 0, N'dhnu7.jpg', CAST(N'2019-10-17' AS Date), 1, 3, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'EM0433-87D', 3, N'Citizen EM0433-87D – Nữ – Kính Sapphire – Eco-Drive (Năng Lượng Ánh Sáng) – Dây Kim Loại', 8700000, N'Mẫu Citizen EM0433-87D thiết kế sang trọng phần dây đeo vỏ máy kim loại mạ vàng, nền mặt số tone màu trắng xa cừ thời trang lập lánh trước nền mặt kính Sapphire.

', 0, N'dhnu8.jpg', CAST(N'2019-10-17' AS Date), 1, 3, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'MTP-1095Q-1A', 2, N'CASIO MTP-1095Q-1A – NAM – QUARTZ (PIN) – DÂY DA', 823000, N'Đồng hồ Casio MTP-1095Q-1A có vỏ kim loại mạ vàng sang trọng, kim chỉ và vạch số thanh mãnh nổi bật trên nền số màu đen mạnh mẽ, dây đeo bằng chất liệu da bóng đem lại vẻ lịch lạm sang trọng cho phái mạnh.', 0, N'29_MTP-1095Q-1A-699x699.jpg', CAST(N'2019-11-11' AS Date), 1, 4, 12)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'NJ0090-81E', 2, N'CITIZEN NJ0090-81E – NAM – KÍNH SAPPHIRE – AUTOMATIC (TỰ ĐỘNG) – DÂY TITANIUM', 11950000, N'CITIZEN NJ0090-81E – NAM – KÍNH SAPPHIRE – AUTOMATIC (TỰ ĐỘNG) – DÂY TITANIUM', 0, N'dhnam8.jpg', CAST(N'2019-10-17' AS Date), 1, 3, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'NP1014-51E', 2, N'CITIZEN NP1014-51E – NAM – KÍNH SAPPHIRE – AUTOMATIC (TỰ ĐỘNG) – DÂY KIM LOẠI', 18195300, N'Mẫu Citizen NP1014-51E đồng hồ 4 kim với chức năng kim giây được bố trí 1 ô số riêng biệt thiết kế không đồng trục, ấn tượng cuốn hút với các chi tiết bên trong mặt số cùng phần vỏ viền ngoài và ngay cả núm vặn đều được bao phủ màu vàng hồng đầy sang trọng.

', 0, N'dhnam9.jpg', CAST(N'2019-10-17' AS Date), 1, 3, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'SHE-4055PGL-7BUDF', 3, N'CASIO SHE-4055PGL-7BUDF – NỮ – QUARTZ (PIN) – DÂY DA', 4113000, N'Mẫu Casio SHE-4055PGL-7BUDF phiên bản đính kim cương tương ứng với các múi giờ trên mặt số trắng size 30mm tạo nên vẻ đẹp sang trọng trẻ trung khi kết hợp cùng vỏ máy vàng hồng.', 0, N'34_SHE-4055PGL-7BUDF-699x699.jpg', CAST(N'2019-11-11' AS Date), 1, 4, 12)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'T063.907.11.058.00', 2, N'ĐỒNG HỒ TISSOT T063.907.11.058.00 NAM TỰ ĐỘNG DÂY INOX', 18195000, N'Những chiếc đồng hồ của thương hiệu Tissot luôn mang sự bí ẩn và cuốn hút người dùng. Trong những thiết kế cao cấp, đồng hồ Tissot T063.907.11.058.00 là sản phẩm rất thành công của thương hiệu. Từng được nét trên chiếc đồng hồ đều được thể hiện rất rõ ràng và sắc nét. Sự đơn giản trong thiết kế này đã đem đến nét đẹp tinh tế rất riêng biệt, đen lại cho người dùng sự tự tin để tỏa sáng. Chiếc đồng hồ này hiện đang trở thành xu hướng thời trang thượng lưu, bán rất chạy tại các cửa hàng.', 0, N'dhnam3.jpg', CAST(N'2019-10-17' AS Date), 1, 2, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'T063.907.36.068.00', 2, N'TISSOT T063.907.36.068.00 – NAM – KÍNH SAPPHIRE – AUTOMATIC (TỰ ĐỘNG) – DÂY DA', 21940000, N'Vẻ ngoài quý ông lịch lãm với mẫu Tissot T063.907.36.068.00 với thiết kế độc đáo cùng ô chân kính trong suốt phô diễn ra 1 phần bên trong của bộ máy cơ chứa đựng cả một trải nghiệm đầy nam tính.', 0, N'dhnam7.jpg', CAST(N'2019-10-17' AS Date), 1, 2, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'T094.210.11.126.00', 3, N'Tissot T094.210.11.126.00 – Nữ – Kính Sapphire – Quartz (Pin) – Dây Kim Loại', 10490000, N'Mẫu Tissot T094.210.11.126.00 thiết kế nổi bật với phần dây lắc kim loại mạ bạc thời trang phối cùng nền mặt số xà cừ size 30mm tăng thêm vẻ cuốn hút cho phái đẹp.

', 0, N'dhnu5.jpg', CAST(N'2019-10-17' AS Date), 1, 2, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'T109.610.36.051.00', 2, N'TISSOT T109.610.36.051.00 – NAM – KÍNH SAPPHIRE – QUARTZ (PIN) – DÂY DA', 8700000, N'Mẫu Tissot T109.610.36.051.00 khoác lên mình vẻ ngoài của chiếc đồng hồ 3 kim cho phái nam với phong cách giản dị, các chi tiết đồng hồ được tạo hình mỏng tinh tế được phủ tông vàng hồng trẻ trung đầy sang trọng.', 0, N'dhnam5.jpg', CAST(N'2019-10-17' AS Date), 1, 2, 20)
INSERT [dbo].[Products] ([ID], [CateID], [Name], [Price], [Description], [Discount], [Image], [Created], [status], [Brand_id], [quantity]) VALUES (N'T914.210.46.017.00', 3, N'Tissot T914.210.46.017.00 – Nữ – Kính Sapphire – Quartz (Pin) – Dây Da', 25600000, N'Mẫu Tissot T914.210.46.017.00 dành cho nữ theo xu hướng giản dị, các chi tiết vạch số tạo nét thanh mảnh vàng 18K đầy sang trọng khi phối cùng mẫu dây da tông màu trắng thời trang cho phái đẹp.

', 0, N'dhnu6.jpg', CAST(N'2019-10-17' AS Date), 1, 2, 20)
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Strap] ON 

INSERT [dbo].[Strap] ([StrapID], [Name]) VALUES (1, N'Dây Da')
INSERT [dbo].[Strap] ([StrapID], [Name]) VALUES (2, N'Dây Kim Loại')
INSERT [dbo].[Strap] ([StrapID], [Name]) VALUES (3, N'Dây Nhựa / Cao Su')
INSERT [dbo].[Strap] ([StrapID], [Name]) VALUES (4, N'Dây Vải')
SET IDENTITY_INSERT [dbo].[Strap] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [email], [phone], [address], [password], [created], [role_id]) VALUES (1, N'Tiến', N'tientp@gmail.com', N'0868655557', N'Thái Nguyên', N'123', CAST(N'2019-10-26' AS Date), 1)
INSERT [dbo].[User] ([ID], [Name], [email], [phone], [address], [password], [created], [role_id]) VALUES (2, N'Hoàng', N'hoangdd@gmail.com', N'0876543642', N'Hà Nội', N'123', CAST(N'2019-10-26' AS Date), 2)
INSERT [dbo].[User] ([ID], [Name], [email], [phone], [address], [password], [created], [role_id]) VALUES (7, N'Duy Anh', N'duyanh@gmail', N'0913444333', N'Thái Nguyên', N'123', CAST(N'2019-10-26' AS Date), 2)
INSERT [dbo].[User] ([ID], [Name], [email], [phone], [address], [password], [created], [role_id]) VALUES (8, N'Mạnh', N'manh@gmail.com', N'0923222333', N'Ninh Bình', N'1234', CAST(N'2019-10-26' AS Date), 2)
INSERT [dbo].[User] ([ID], [Name], [email], [phone], [address], [password], [created], [role_id]) VALUES (9, N'Hòa', N'hoat@gmail.com', N'123', N'Hòa Bình', N'234', CAST(N'2019-10-26' AS Date), 1)
INSERT [dbo].[User] ([ID], [Name], [email], [phone], [address], [password], [created], [role_id]) VALUES (11, N'Toàn', N'toantd@gmail.com', N'0922333212', N'Vinh', N'123', CAST(N'2019-10-10' AS Date), 1)
INSERT [dbo].[User] ([ID], [Name], [email], [phone], [address], [password], [created], [role_id]) VALUES (12, N'Lê Duy Anh', N'Bi@gmail.com', N'0954323468', N'Nhật Bản', N'123', CAST(N'2019-10-26' AS Date), 2)
INSERT [dbo].[User] ([ID], [Name], [email], [phone], [address], [password], [created], [role_id]) VALUES (13, N'Quang Anh Trần', N'quanganh@gmail.com', N'0912332333', N'Hải Dương', N'123', CAST(N'2019-10-26' AS Date), 2)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_views]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Products] FOREIGN KEY([Produc_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Products]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_orderdetail_Order1] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_orderdetail_Order1]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_orderdetail_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_orderdetail_Products]
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_ProductInfo_ATM] FOREIGN KEY([ATM_ID])
REFERENCES [dbo].[ATM] ([ID])
GO
ALTER TABLE [dbo].[ProductInfo] CHECK CONSTRAINT [FK_ProductInfo_ATM]
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_ProductInfo_Crystal] FOREIGN KEY([Crystal_ID])
REFERENCES [dbo].[Crystal] ([Crystal_ID])
GO
ALTER TABLE [dbo].[ProductInfo] CHECK CONSTRAINT [FK_ProductInfo_Crystal]
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_ProductInfo_Dial_Shape] FOREIGN KEY([Dial_Shape_ID])
REFERENCES [dbo].[Dial_Shape] ([ID])
GO
ALTER TABLE [dbo].[ProductInfo] CHECK CONSTRAINT [FK_ProductInfo_Dial_Shape]
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_ProductInfo_Movement] FOREIGN KEY([Movement_ID])
REFERENCES [dbo].[Movement] ([Movement_ID])
GO
ALTER TABLE [dbo].[ProductInfo] CHECK CONSTRAINT [FK_ProductInfo_Movement]
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_ProductInfo_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[ProductInfo] CHECK CONSTRAINT [FK_ProductInfo_Products]
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_ProductInfo_Strap] FOREIGN KEY([Strap_ID])
REFERENCES [dbo].[Strap] ([StrapID])
GO
ALTER TABLE [dbo].[ProductInfo] CHECK CONSTRAINT [FK_ProductInfo_Strap]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([Brand_id])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
