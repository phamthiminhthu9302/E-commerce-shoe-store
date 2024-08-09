USE [QuanLyBanGiay]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/12/2023 8:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [nchar](10) NULL,
	[pass] [nchar](10) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[email] [nvarchar](50) NULL,
	[isCustomer] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/12/2023 8:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[amount] [int] NULL,
	[maCart] [int] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[maCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/12/2023 8:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 12/12/2023 8:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[maHD] [int] NOT NULL,
	[accountID] [int] NULL,
	[ngayXuat] [datetime] NULL,
	[tongGia] [float] NULL,
 CONSTRAINT [PK_Invoicee] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/12/2023 8:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] NULL,
	[accountID] [int] NULL,
	[amount] [int] NULL,
	[status] [int] NULL,
	[productID] [int] NOT NULL,
	[size] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/12/2023 8:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[image] [nvarchar](500) NULL,
	[price] [float] NULL,
	[title] [nvarchar](500) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NOT NULL,
	[color] [nvarchar](50) NULL,
	[size] [nvarchar](50) NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 12/12/2023 8:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[accountID] [int] NULL,
	[productID] [int] NULL,
	[contentReview] [nvarchar](500) NULL,
	[dateReview] [date] NULL,
	[maReview] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[maReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoLuongDaBan]    Script Date: 12/12/2023 8:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoLuongDaBan](
	[productID] [int] NULL,
	[soLuongDaBan] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12/12/2023 8:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[idSupplier] [int] IDENTITY(1,1) NOT NULL,
	[nameSupplier] [nvarchar](100) NULL,
	[phoneSupplier] [nvarchar](50) NULL,
	[emailSupplier] [nvarchar](200) NULL,
	[addressSupplier] [nvarchar](200) NULL,
	[cateID] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[idSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TongChiTieuBanHang]    Script Date: 12/12/2023 8:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TongChiTieuBanHang](
	[userID] [int] NULL,
	[TongChiTieu] [float] NULL,
	[TongBanHang] [float] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (1, N'dinhhuusgu', N'123456    ', 0, 1, N'huunl2002@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (2, N'naruto    ', N'123456    ', 0, 0, N'naruto@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (3, N'abc       ', N'123456    ', 1, 0, N'abc@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (5, N'sasuke    ', N'123456    ', 0, 0, N'sasuke@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (6, N'itachi    ', N'123456    ', 0, 0, N'itachi@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (7, N'kakashi   ', N'123456    ', 1, 0, N'kakashi@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (8, N'panda     ', N'123456    ', 1, 0, N'panda@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (9, N'lucy      ', N'123456    ', 0, 0, N'lucy@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (10, N'cookie    ', N'123456    ', 0, 0, N'cookie@gmail.com
', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email], [isCustomer]) VALUES (13, N'bamboo    ', N'123456    ', 1, 0, N'at@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([accountID], [productID], [amount], [maCart], [size]) VALUES (9, 21, 1, 55, N'Medium')
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'GIAY ADIDAS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'GIAY NIKE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'GIAY BITIS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'GIAY CONVERSE')
GO
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (1, 1, CAST(N'2023-12-08T00:00:00.000' AS DateTime), 924)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (2, 1, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 462)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (3, 1, CAST(N'2023-12-06T00:00:00.000' AS DateTime), 396)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (4, 3, CAST(N'2023-11-18T00:00:00.000' AS DateTime), 132)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (5, 7, CAST(N'2023-11-08T00:00:00.000' AS DateTime), 550)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (6, 8, CAST(N'2023-10-01T00:00:00.000' AS DateTime), 1023)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (7, 8, CAST(N'2023-11-12T00:00:00.000' AS DateTime), 732.6)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (8, 1, CAST(N'2023-12-09T00:00:00.000' AS DateTime), 187)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (9, 1, CAST(N'2023-12-09T00:00:00.000' AS DateTime), 440)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (10, 1, CAST(N'2023-12-09T00:00:00.000' AS DateTime), 429)
INSERT [dbo].[Invoice] ([maHD], [accountID], [ngayXuat], [tongGia]) VALUES (11, NULL, NULL, 1595)
GO
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (10, 9, 1, 1, 15, N'Small', N'Nguyễn Như Thảo', N'phamphucthinh123456@gmail.com', N'0973857792', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (9, 10, 1, 1, 17, N'Small', N'Nguyễn Bá Vương', N'phamphucthinh123456@gmail.com', N'0973857792', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (5, 6, 2, 1, 20, N'Small', N'Phạm Gia Bảo', N'itachi@gmail.com', N'0973857792', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (3, 5, 2, 1, 21, N'Medium', N'Trần Đình Hùng', N'sasuke@gmail.com', N'0973857792', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (4, 6, 1, 1, 22, N'Large', N'Nguyễn Bá Vương', N'itachi@gmail.com', N'0973857792', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (1, 2, 2, 1, 26, N'Medium', N'Phạm Văn Huy', N'naruto@gmail.com', N'0348521478', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (2, 2, 1, 1, 27, N'Small', N'Phạm Văn Huy', N'naruto@gmail.com', N'0348521478', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (2, 2, 1, 1, 28, N'Large', N'Phạm Văn Huy', N'naruto@gmail.com', N'0348521478', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (6, 9, 1, 1, 34, N'Small', N'Nguyễn Như Thảo', N'lucy@gmail.com', N'0973857792', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (6, 9, 1, 1, 36, N'Medium', N'Nguyễn Như Thảo', N'lucy@gmail.com', N'0973857792', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (8, 9, 1, 1, 39, N'Small', N'Nguyễn Như Thảo', N'lucy@gmail.com', N'0973857792', N'Hồ Chí Minh')
INSERT [dbo].[Order] ([orderID], [accountID], [amount], [status], [productID], [size], [name], [email], [phone], [address]) VALUES (7, 9, 1, 1, 43, N'Large', N'Nguyễn Như Thảo', N'lucy@gmail.com', N'0973857792', N'Hồ Chí Minh')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (15, N'GIÀY NIKE COURT BOROUGH LOW PREMIUM - XÁM', N'giay-nike-court-borough-low-premium-nam-xam-01.jpg', 210, N'GIÀY NIKE COURT BOROUGH LOW PREMIUM - XÁM', N'Giày Nike Court Borough Low Premium là mẫu giày thời trang của Nike có thiết kế cổ điển mang phong cách đường phố. Với chất liệu da lộn cao cấp và đế cao su bền chắc, Nike Court Borough Low Premium là đôi giày sportwear tuyệt vời dành cho bạn.', 2, N'Gray', N'Small Medium Large', 99)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (17, N'GIÀY NIKE AIR MAX SC NAM- XÁM XANH', N'giay-nike-air-max-sc-nam-trang-xanh-01.jpg', 400, N'GIÀY NIKE AIR MAX SC NAM- XÁM XANH', N'Giày Nike Air Max SC mang nét huyền thoại của Nike, với bộ đệm Air Max trứ danh đây là mẫu giày có thể kết hợp với bất cứ trang phục nào mà bạn vẫn hoàn toàn tự tin trong mọi hoàn cảnh.', 2, N'Gray', N'Small Medium Large', 99)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (18, N'GIÀY NIKE COURT VISION LOW NAM - TRẮNG', N'giay-Nike-Court-Vision-Low-nam-trang-01.jpg', 350, N'GIÀY NIKE COURT VISION LOW NAM - TRẮNG', N'Giày Nike Court Vision Low là mẫu giày với thiết kế lấy cảm hứng từ thập niên 80 với những nét cổ điển mang phong cách đường phố đặc trưng.

Với chất liệu da cao cấp và đến cao su nguyên chất khiến đôi giày bền bỉ với thời gian.', 2, N'White', N'Small Medium Large', 100)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (20, N'GIÀY ADIDAS NOVA COURT NAM - ĐEN', N'giay-adidas-nova-court-nam-den-01.jpg', 250, N'GIÀY ADIDAS NOVA COURT NAM - ĐEN', N'Giày adidas Nova Court có thiết kế mang phong cách classic vừa cổ điển nhưng vẫn trẻ trung hiện đại. Một mẫu giày có thể cân mọi trang phục và không bao giờ lỗi mốt.

Giày adidas Nova Court với phần upper làm từ da cao cấp, đế cao su tự nhien bền chắc và đặc biệt giày sử dụng hơn 25% vật liệu thân thiện với môi trường.', 1, N'Black', N'Small Medium Large', 98)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (21, N'GIÀY ADIDAS ULTRABOUNCE NỮ - TRẮNG XANH', N'giay-adidas-ultrabounce-nu-trang-xanh-01.jpg', 180, N'GIÀY ADIDAS ULTRABOUNCE NỮ - TRẮNG XANH', N'Giày Adidas Ultrabounce là mẫu giày thể thao mới nhất của adidas. Với thiết kế trẻ trung, khỏe khoắn, ôm sát bàn chân. Đế giày công nghệ Bounce siêu nhẹ và êm ái giúp bạn di chuyển cả ngày mà không mệt mỏi.

Ngoài ra, Adidas Ultrabounce còn được làm với hơn 50% vật liệu thân thiện bảo vệ môi trường. Giày Adidas Ultrabounce là một lựa chọn hợp lý cho mọi hoạt động hàng ngày.', 1, N'White', N'Small Medium Large', 98)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (22, N'GIÀY NIKE AIR MAX SC NAM- ĐEN TRẮNG', N'giay-nike-air-max-sc-nam-den-trang-01.jpg', 120, N'GIÀY NIKE AIR MAX SC NAM- ĐEN TRẮNG', N'Giày Nike Air Max SC mang nét huyền thoại của Nike, với bộ đệm Air Max trứ danh đây là mẫu giày có thể kết hợp với bất cứ trang phục nào mà bạn vẫn hoàn toàn tự tin trong mọi hoàn cảnh.', 2, N'Black', N'Small Medium Large', 99)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (23, N'GIÀY NIKE JORDAN FADEAWAY NAM - TRẮNG ĐEN', N'giay-nike-jordan-fadeaway-nam-trang-den-04.jpg', 600, N'GIÀY NIKE JORDAN FADEAWAY NAM - TRẮNG ĐEN', N'Giày Nike Jordan Fadeaway là một mẫu giày sneaker có thiết kế classic đẹp trẻ trung, bạn có thể sử dụng Jordan Fadeaway để phối với rất nhiều loại trang phục khác nhau đều mang đến sự tự tin và thoải mái.
Phần Upper làm bằng chất liệu da cao cấp, đế giày chất liệu cao su bền đẹp với thời gian. Bạn sẽ cảm thấy thật sự thoải mái khi sử dụng Nike Jordan Fadeaway cho các hoạt động hàng ngày.', 2, N'Black', N'Small Medium Large', 99)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (26, N'GIÀY CONVERSE SLIPSTREAM ARCHIVE REMASTERED NAM', N'giay-puma-slipstream-archive-remastered-nam-trang-xanh-la-04.jpg', 420, N'GIÀY CONVERSE SLIPSTREAM ARCHIVE REMASTERED NAM - TRẮNG XANH
', N'Giày Puma Slipstream Archive Remastered mẫu giày sneaker rất nổi tiếng của Puma, thiết kế cổ điển nhưng đẹp và không bao giờ lo lỗi mốt. Puma Slipstream Archive Remastered là lựa chọn không thể bỏ qua của các fan giày sneaker.', 4, N'Green', N'Small Medium Large', 96)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (27, N'GIÀY NEW BALANCE VIAZA NAM - XANH LAM', N'giay-new-balance-viaza-nam-xanh-lam-03.jpg', 260, N'GIÀY NEW BALANCE VIAZA NAM - XANH LAM', N'Giày New Balance Viaza mẫu giày thể thao được thiết kế rất đẹp, với công nghệ đế FRESH FOAM độc quyền của New Balance giúp cho đôi giày trở lên cực kỳ êm và nhẹ nhàng khi di chuyển.

New Balance Viaza có phần upper được làm từ chất liệu vải mesh thoáng khí giúp bạn vận động cả ngày dài. Đây cũng là mẫu giày chạy bộ, tập gym, chơi thể thao rất tốt.', 3, N'Blue', N'Small Medium Large', 99)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (28, N'GIÀY NIKE AIR MAX EXCEE NAM - ĐEN ĐEN', N'giay-nike-air-max-excee-nam-den-den-01.jpg', 160, N'GIÀY NIKE AIR MAX EXCEE NAM - ĐEN ĐEN', N'Giày Nike Air Max Excee mẫu giày thời trang năng động, trẻ trung Air Max Excee đã cập bến tại Myshoes.vn. Đây hứa hẹn sẽ là một mẫu giày chất chơi mà bạn không thể bỏ qua.', 2, N'Black', N'Small Medium Large', 99)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (30, N'GIÀY THỜI TRANG UNISEX CONVERSE AS-1 PRO', N'A06806C-1.jpg', 750, N'GIÀY THỜI TRANG UNISEX CONVERSE AS-1 PRO', N'Trải nghiệm mẫu giày trượt ván tiên phong nhất từ CONS, được tạo ra bởi một trong những vận động viên trượt ván hàng đầu thế giới, Alexis Sablone - AS-1 Pro. Với sự ảnh hưởng của phong cách cổ điển, nhưng với các tính năng hoàn toàn mới mẻ, mục tiêu chính của sản phẩm này là tạo ra một đôi giày trượt ván kiểu cupsole hoàn toàn khác biệt so với những sản phẩm trước đây. Hệ thống lỗ gắn trên giày giúp tăng tính bền của sản phẩm. Để cung cấp sự cảm giác tốt nhất khi tiếp xúc với ván, hệ thống chống sốc được phân phối đều khắp đế giày, vượt ra khỏi lớp đệm bên trong. Kết thúc với đế ngoài herringbone tạo độ bám tối đa, đem đến sự kiểm soát tốt ngay cả khi bạn mới mua giày.', 4, N'Red', N'Small Medium Large', 100)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (34, N'Giày Thời Trang Nam Converse Chuck Taylor All Star 1970S Sunflower - High', N'162054C-1.jpg', 500, N'Giày Thời Trang Nam Converse Chuck Taylor All Star 1970S Sunflower - High', N'Đến năm 1970, Chuck Taylor All Star đã phát triển thành một trong những đôi giày bóng rổ tốt nhất từ trước đến nay. Chuck 70 tôn vinh di sản đó bằng cách kết hợp các chi tiết theo phong cách lưu trữ cổ điển, kết hợp với các bản cập nhật tiện nghi hiện đại. Đệm đế Ortholite và đường khâu lưỡi giày nâng mức độ thoải mái lên một bậc. Đế giữa bóng loáng, hình con cò và chi tiết logo ở vị trí mắt cá chân hình ngôi sao đặc trưng làm nổi bật phong cách cổ điển, mang tính biểu tượng của sản phẩm.', 4, N'Orange', N'Small Medium Large', 99)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (35, N'Giày Thể Thao Converse Chuck Taylor All Star II Salsa Hi – Red', N'giay-converse-33.jpg', 80, N'Giày Thể Thao Converse Chuck Taylor All Star II Salsa Hi – Red', N'Giày converse cổ cao chính hãng – Mẫu giày hot nhất 2021 – Được may và sử dụng bằng chất liệu canvas cao cấp mềm mại, và được trang bị một lớp đệm êm ái…', 4, N'Red', N'Small Medium Large', 100)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (36, N'Giày NMD R2 Japan đỏ', N'giay-nmd-r2-fake.jpg', 430, N'Giày NMD R2 Japan đỏ', N'Hình ảnh chi tiết Giày Adidas NMD R2 Japan đỏ được chụp tại Shop giày thể thao, sneaker nam nữ chính hãng, giày replica, rep 1:1, super fake F1 Giá Rẻ Tp hcm, Hà Nội, Đà Nẵng.', 4, N'Red', N'Small Medium Large', 99)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (37, N'Giày Track 3.0 vàng BT309', N'2736b0de.jpg', 310, N'Giày Track 3.0 vàng BT309', N'Hình ảnh chi tiết Giày Balenciaga Track 3.0 vàng BT309 được chụp tại Shop giày thể thao, sneaker nam nữ chính hãng, giày replica, rep 1:1, super fake F1 Giá Rẻ Tp hcm, Hà Nội, Đà Nẵng.', 3, N'Yellow', N'Small Medium Large', 100)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (38, N'Giày Track 3.0 trắng tím BT304', N'Balenciaga-Track-Purple-White-Grey-2.jpeg', 90, N'Giày Track 3.0 trắng tím BT304', N'Hình ảnh chi tiết Giày Balenciaga Track 3.0 trắng tím BT304 được chụp tại Shop giày thể thao, sneaker nam nữ chính hãng, giày replica, rep 1:1, super fake F1 Giá Rẻ Tp hcm, Hà Nội, Đà Nẵng.', 3, N'Purple', N'Small Medium Large', 120)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (39, N'Giày Nike Air Presto xanh lục NAP06', N'giay-nike-air-presto-xanh-luc-sf.jpg', 170, N'Giày Nike Air Presto xanh lục NAP06', N'Hình ảnh chi tiết Giày Nike Air Presto xanh lục NAP06 được chụp tại Shop giày thể thao, sneaker nam nữ chính hãng, giày replica, rep 1:1, super fake F1 Giá Rẻ Tp hcm, Hà Nội, Đà Nẵng.', 2, N'Green', N'Small Medium Large', 99)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (40, N'Giày Nike Air Uptempo trắng đỏ NU04', N'giay-nike-air-uptempo-trang-do-replica-4.jpeg', 640, N'Giày Nike Air Uptempo trắng đỏ NU04', N'Hình ảnh chi tiết Giày Nike Air Uptempo trắng đỏ NU04 được chụp tại Shop giày thể thao, sneaker nam nữ chính hãng, giày replica, rep 1:1, super fake F1 Giá Rẻ Tp hcm, Hà Nội, Đà Nẵng.', 2, N'White', N'Small Medium Large', 100)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (42, N'Giày Adidas Prophere xanh navy AP13', N'giay-adidas-prophere-xanh-duong-replica-1-800x601.jpeg', 550, N'Giày Adidas Prophere xanh navy AP13', N'Hình ảnh chi tiết Giày Nike Air Uptempo trắng đỏ NU04 được chụp tại Shop giày thể thao, sneaker nam nữ chính hãng, giày replica, rep 1:1, super fake F1 Giá Rẻ Tp hcm, Hà Nội, Đà Nẵng.', 1, N'Blue', N'Small Medium Large', 100)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [color], [size], [count]) VALUES (43, N'Giày Adidas Tubular Shadow đen sọc trắng ATS01', N'giay-adidas-tubular-den-soc-trang-repilica.jpg', 666, N'Giày Adidas Tubular Shadow đen sọc trắng ATS01', N'Hình ảnh chi tiết Giày Adidas Tubular Shadow đen sọc trắng ATS01 được chụp tại Shop giày thể thao, sneaker nam nữ chính hãng, giày replica, rep 1:1, super fake F1 Giá Rẻ Tp hcm, Hà Nội, Đà Nẵng.', 1, N'Black', N'Small Medium Large', 99)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (10, 26, N'sản phẩm tốt', CAST(N'2023-12-09' AS Date), 21)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (26, 2)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (21, 2)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (20, 2)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (34, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (36, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (43, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (39, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (28, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (17, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (15, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (27, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (22, 1)
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (1, N'Cty TNHH D.ADDIDAS', N'0973857792', N'ctyaddidas@gmail.com', N'so 1 Vo Van Ngan', 1)
INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (2, N'Cty TNHH D.NIKE', N'0971121786', N'ctynike@gmail.com', N'so 2 Vo Van Ngan', 2)
INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (3, N'Cty TNHH D.BITIS', N'0971121786', N'ctybitis@gmail.com', N'so 3 Vo Van Ngan', 3)
INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (4, N'Cty TNHH D.CONVERSE', N'0971121786', N'ctyconverse@gmail.com', N'so 4 Vo Van Ngan', 4)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (2, 1386, 0)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (5, 396, 0)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (7, 0, 550)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (10, 1012, 0)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (13, 385, 0)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1, 0, 2838)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (6, 682, 0)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (3, 0, 132)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (9, 8443.6, 0)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (8, 0, 1755.6)
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product] FOREIGN KEY([id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Account]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Category]
GO
ALTER TABLE [dbo].[TongChiTieuBanHang]  WITH CHECK ADD  CONSTRAINT [FK_TongChiTieuBanHang_Account] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[TongChiTieuBanHang] CHECK CONSTRAINT [FK_TongChiTieuBanHang_Account]
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatSoLuongDaBan]    Script Date: 12/12/2023 8:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatSoLuongDaBan] @productID int, @soLuongBanThem int
as
begin
	update SoLuongDaBan set [soLuongDaBan]=[soLuongDaBan] + @soLuongBanThem where productID=@productID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatTongBanHang]    Script Date: 12/12/2023 8:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatTongBanHang] @sell_ID int, @banHangThem float
as
begin
	update TongChiTieuBanHang set TongBanHang= TongBanHang + @banHangThem where [userID]=@sell_ID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatTongChiTieu]    Script Date: 12/12/2023 8:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatTongChiTieu] @userID int, @chiTieuThem float
as
begin
	update TongChiTieuBanHang set TongChiTieu= TongChiTieu + @chiTieuThem where [userID]=@userID
end
GO
