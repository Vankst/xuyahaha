USE [20.102k-14-Salon]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](30) NOT NULL,
	[GenderCode] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[ServiceID] [int] NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 19.12.2023 17:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (1, N'Дэнна', N'Кузьмина', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Марфа', N'Мамонтова', N'Мироновна', CAST(N'1984-10-19' AS Date), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N'rfoley@verizon.net', N'7(38)095-64-18 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Амелия', N'Степанова', N'Робертовна', CAST(N'1970-06-06' AS Date), CAST(N'2017-09-27T00:00:00.000' AS DateTime), N'rasca@hotmail.com', N'7(1217)441-28-42 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Алина', N'Колесникова', N'Еремеевна', CAST(N'2001-04-19' AS Date), CAST(N'2017-01-18T00:00:00.000' AS DateTime), N'gfxguy@outlook.com', N'7(74)977-39-71 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Наум', N'Морозов', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (6, N'Дарина', N'Сысоева', N'Ярославовна', CAST(N'1982-02-03' AS Date), CAST(N'2016-05-13T00:00:00.000' AS DateTime), N'treit@verizon.net', N'7(0698)387-96-04 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Никки', N'Горбачёва', N'Еремеевна', CAST(N'1987-04-21' AS Date), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'chinthaka@att.net', N'7(94)789-69-20 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Инара', N'Бирюкова', N'Улебовна', CAST(N'1978-07-21' AS Date), CAST(N'2017-10-01T00:00:00.000' AS DateTime), N'smpeters@hotmail.com', N'7(098)346-50-58 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (9, N'Устин', N'Киселёв', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (10, N'Авигея', N'Крюкова', N'Святославовна', CAST(N'2000-08-10' AS Date), CAST(N'2018-01-03T00:00:00.000' AS DateTime), N'simone@gmail.com', N'7(499)318-88-53 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Любава', N'Костина', N'Авксентьевна', CAST(N'1972-07-13' AS Date), CAST(N'2016-02-26T00:00:00.000' AS DateTime), N'gordonjcp@hotmail.com', N'7(6419)959-21-87 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (12, N'Харита', N'Попова', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Патрисия', N'Андреева', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (14, N'Роза', N'Гусева', N'Дмитриевна', CAST(N'1999-02-13' AS Date), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'martyloo@live.com', N'7(23)064-51-84 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (15, N'Трофим', N'Быков', N'Константинович', CAST(N'1994-12-20' AS Date), CAST(N'2016-04-17T00:00:00.000' AS DateTime), N'jguyer@aol.com', N'7(3414)460-12-05 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Яков', N'Гусев', N'Авксентьевич', CAST(N'1995-12-10' AS Date), CAST(N'2017-11-20T00:00:00.000' AS DateTime), N'jdhedden@icloud.com', N'7(0972)781-11-37 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (17, N'Георгина', N'Турова', N'Семёновна', CAST(N'1974-05-28' AS Date), CAST(N'2018-02-22T00:00:00.000' AS DateTime), N'yruan@optonline.net', N'7(555)321-42-99 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Альжбета', N'Трофимова', N'Якововна', CAST(N'1988-10-22' AS Date), CAST(N'2017-09-21T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(1084)658-92-95 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Эльмира', N'Баранова', N'Дмитриевна', CAST(N'1977-01-15' AS Date), CAST(N'2016-07-08T00:00:00.000' AS DateTime), N'jgmyers@comcast.net', N'7(9240)643-15-50 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (20, N'Осип', N'Федотов', N'Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'breegster@hotmail.com', N'7(590)702-33-06 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (21, N'Аввакум', N'Борисов', N'Артемович', CAST(N'1974-04-25' AS Date), CAST(N'2017-03-11T00:00:00.000' AS DateTime), N'chlim@live.com', N'7(2296)930-08-88 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Лиза', N'Артемьева', N'Максимовна', CAST(N'1996-05-17' AS Date), CAST(N'2018-10-07T00:00:00.000' AS DateTime), N'snunez@yahoo.ca', N'7(696)972-70-21 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (23, N'Изабелла', N'Воронова', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (24, N'Сандра', N'Федотова', N'Владленовна', CAST(N'1985-03-29' AS Date), CAST(N'2016-11-08T00:00:00.000' AS DateTime), N'penna@verizon.net', N'7(126)195-25-86 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (25, N'Витольд', N'Ефремов', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'Алла', N'Ермакова', N'Мироновна', CAST(N'1976-01-22' AS Date), CAST(N'2017-02-09T00:00:00.000' AS DateTime), N'whimsy@aol.com', N'7(06)437-13-73 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Гелла', N'Шашкова', N'Эдуардовна', CAST(N'1979-02-24' AS Date), CAST(N'2016-11-16T00:00:00.000' AS DateTime), N'jadavis@mac.com', N'7(57)446-21-04 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Тала', N'Быкова', N'Георгьевна', CAST(N'2000-02-22' AS Date), CAST(N'2016-08-13T00:00:00.000' AS DateTime), N'ganter@optonline.net', N'7(13)915-53-53 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (29, N'Влада', N'Орлова', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'Тамара', N'Анисимова', N'Витальевна', CAST(N'1988-06-16' AS Date), CAST(N'2016-02-25T00:00:00.000' AS DateTime), N'schwaang@mac.com', N'7(66)128-04-10 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (31, N'Прасковья', N'Архипова', N'Валерьевна', CAST(N'1979-01-09' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'cgcra@live.com', N'7(86)540-10-21 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (32, N'Адриан', N'Новиков', N'Аркадьевич', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N'multiplx@verizon.net', N'7(70)572-33-62 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Эльвина', N'Лазарева', N'Робертовна', CAST(N'1996-02-16' AS Date), CAST(N'2018-04-11T00:00:00.000' AS DateTime), N'ahuillet@comcast.net', N'7(5564)609-81-37 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (34, N'Розалия', N'Афанасьева', N'Макаровна', CAST(N'1977-05-01' AS Date), CAST(N'2017-09-06T00:00:00.000' AS DateTime), N'malattia@hotmail.com', N'7(0661)413-23-32 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Юнона', N'Устинова', N'Валентиновна', CAST(N'1982-08-08' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'kempsonc@live.com', N'7(33)367-13-07', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Элина', N'Алексеева', N'Матвеевна', CAST(N'2002-05-07' AS Date), CAST(N'2018-03-28T00:00:00.000' AS DateTime), N'pthomsen@verizon.net', N'7(8086)245-64-81 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (37, N'Янита', N'Гущина', N'Федоровна', CAST(N'1999-03-02' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'lishoy@att.net', N'7(4544)716-68-96 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (38, N'Божена', N'Суворова', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (39, N'Марта', N'Горшкова', N'Иосифовна', CAST(N'2001-02-13' AS Date), CAST(N'2016-08-04T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(544)650-59-03', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (40, N'Мартын', N'Смирнов', N'Арсеньевич', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N'haddawy@live.com', N'7(6251)589-02-43 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Анэля', N'Корнилова', N'Михайловна', CAST(N'1973-04-02' AS Date), CAST(N'2016-05-22T00:00:00.000' AS DateTime), N'jonathan@aol.com', N'7(20)980-01-60 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Магда', N'Ефимова', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (43, N'Светлана', N'Бурова', N'Лукьевна', CAST(N'1979-01-04' AS Date), CAST(N'2016-10-13T00:00:00.000' AS DateTime), N'wsnyder@aol.com', N'7(358)173-82-21 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (44, N'Татьяна', N'Сидорова', N'Михайловна', CAST(N'1974-04-24' AS Date), CAST(N'2018-10-03T00:00:00.000' AS DateTime), N'tbeck@mac.com', N'7(51)732-91-79 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (45, N'Номи', N'Ершова', N'Андреевна', CAST(N'2001-09-13' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'miltchev@mac.com', N'7(7757)315-90-99 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (46, N'Лаура', N'Овчинникова', N'Еремеевна', CAST(N'1992-04-03' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'carcus@yahoo.ca', N'7(85)829-33-79 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (47, N'Иветта', N'Мишина', N'Андреевна', CAST(N'2002-10-05' AS Date), CAST(N'2016-01-24T00:00:00.000' AS DateTime), N'aukjan@yahoo.com', N'7(3926)244-81-96 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (48, N'Злата', N'Колобова', N'Романовна', CAST(N'1994-08-25' AS Date), CAST(N'2016-12-03T00:00:00.000' AS DateTime), N'sinkou@aol.com', N'7(50)884-07-35 ', 2, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Глеб', N'Селиверстов', N'Максимович', CAST(N'1999-06-20' AS Date), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N'jigsaw@sbcglobal.net', N'7(20)554-28-68 ', 1, NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Элина', N'Дмитриева', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84 ', 2, NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 29, 24, CAST(N'2019-04-27T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 33, 14, CAST(N'2019-05-31T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 35, 4, CAST(N'2019-09-20T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 6, 32, CAST(N'2019-10-17T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 11, 21, CAST(N'2019-07-12T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 34, 42, CAST(N'2019-09-06T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 5, 17, CAST(N'2019-09-28T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 7, 22, CAST(N'2019-09-11T13:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 23, 44, CAST(N'2019-06-21T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 19, 9, CAST(N'2019-12-20T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 7, 16, CAST(N'2019-03-19T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 35, 18, CAST(N'2019-12-23T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 6, 10, CAST(N'2019-01-17T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 31, 19, CAST(N'2019-12-18T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 13, 32, CAST(N'2019-01-22T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 5, 37, CAST(N'2019-09-07T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 6, 25, CAST(N'2019-01-01T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 3, 42, CAST(N'2019-06-24T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 24, 17, CAST(N'2019-04-28T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 19, 10, CAST(N'2019-06-13T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 17, 22, CAST(N'2019-12-25T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 31, 43, CAST(N'2019-10-07T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 15, 44, CAST(N'2019-05-22T15:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 25, 16, CAST(N'2019-10-05T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 4, 38, CAST(N'2019-01-27T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 3, 40, CAST(N'2019-11-15T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 7, 31, CAST(N'2019-05-06T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 19, 11, CAST(N'2019-02-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 2, 27, CAST(N'2019-05-20T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 1, 15, CAST(N'2019-01-19T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 9, 6, CAST(N'2019-06-07T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 24, 4, CAST(N'2019-03-21T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 29, 3, CAST(N'2019-08-04T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 32, 8, CAST(N'2019-01-11T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 34, 6, CAST(N'2019-05-26T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 24, 9, CAST(N'2019-05-04T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 38, 5, CAST(N'2019-07-23T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 6, 35, CAST(N'2019-01-04T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 26, 42, CAST(N'2019-10-12T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 19, 40, CAST(N'2019-10-24T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 6, 12, CAST(N'2019-05-29T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 24, 23, CAST(N'2019-09-20T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 26, 7, CAST(N'2019-05-07T15:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 4, 2, CAST(N'2019-09-11T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 21, 28, CAST(N'2019-11-26T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 26, 43, CAST(N'2019-03-28T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 32, 9, CAST(N'2019-01-17T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 15, 21, CAST(N'2019-01-28T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 36, 44, CAST(N'2019-06-22T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 27, 33, CAST(N'2019-12-15T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 21, 14, CAST(N'2019-06-07T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 36, 28, CAST(N'2019-09-14T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 22, 30, CAST(N'2019-11-04T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 18, 39, CAST(N'2019-02-26T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 14, 26, CAST(N'2019-09-13T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 30, 43, CAST(N'2019-11-22T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 33, 23, CAST(N'2019-12-09T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 15, 15, CAST(N'2019-10-31T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 11, 30, CAST(N'2019-08-31T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 1, 11, CAST(N'2019-06-24T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 37, 31, CAST(N'2019-11-29T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 28, 30, CAST(N'2019-08-25T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 4, 6, CAST(N'2019-11-13T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 33, 21, CAST(N'2019-07-30T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 17, 21, CAST(N'2019-05-25T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 9, 10, CAST(N'2019-06-26T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 20, 30, CAST(N'2019-11-06T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 19, 11, CAST(N'2019-04-29T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 28, 24, CAST(N'2019-10-21T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 2, 20, CAST(N'2019-06-23T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 16, 41, CAST(N'2019-11-09T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 18, 13, CAST(N'2019-10-02T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 35, 6, CAST(N'2019-06-07T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 14, 26, CAST(N'2019-01-17T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 15, 3, CAST(N'2019-01-11T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 33, 16, CAST(N'2019-11-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 37, 23, CAST(N'2019-10-10T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 34, 44, CAST(N'2019-03-01T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 9, 34, CAST(N'2019-07-21T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 12, 40, CAST(N'2019-12-21T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 21, 6, CAST(N'2019-10-01T12:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 27, 22, CAST(N'2019-08-19T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 22, 17, CAST(N'2019-03-01T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 12, 31, CAST(N'2019-05-11T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 19, 25, CAST(N'2019-12-21T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 9, 27, CAST(N'2019-01-30T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 10, 1, CAST(N'2019-03-09T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 4, 11, CAST(N'2019-08-08T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 33, 6, CAST(N'2019-03-04T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 18, 18, CAST(N'2019-06-17T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 2, 29, CAST(N'2019-02-11T09:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 18, 18, CAST(N'2019-02-01T12:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 28, 7, CAST(N'2019-12-11T09:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 39, 7, CAST(N'2019-01-13T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 13, 26, CAST(N'2019-03-23T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 22, 20, CAST(N'2019-10-02T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 3, 25, CAST(N'2019-01-20T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 30, 26, CAST(N'2019-01-27T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 28, 36, CAST(N'2019-05-19T08:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 8, 32, CAST(N'2019-11-30T19:10:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (1, N'м')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (2, N'ж')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Наращивание ресниц', 1430.0000, 2400, NULL, 0.05, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Моделирование ресниц+тушь', 1390.0000, 2100, NULL, 0.1, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Ламинирование ресниц', 1740.0000, 3300, NULL, 0.25, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Русский спа массаж', 2540.0000, 3000, NULL, 0.2, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Мезотерапия', 2040.0000, 2400, NULL, 0.2, N' Услуги салона красоты\Мезотерапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Полуперманентная тушь', 2340.0000, 1800, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Экспресс SPA', 2420.0000, 900, NULL, 0, N' Услуги салона красоты\Экспресс SPA.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Пирсинг', 1330.0000, 3300, NULL, 0, N' Услуги салона красоты\Прокол ушей пистолетом.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Массаж масляный', 1090.0000, 3000, NULL, 0, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Прессотерапия', 2350.0000, 2400, NULL, 0, N' Услуги салона красоты\Прессотерапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Европейский маникюр', 1990.0000, 3600, NULL, 0.05, N' Услуги салона красоты\Европейский маникюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Удаление доброкачественных образований кожи', 1910.0000, 900, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Испанский массаж', 2190.0000, 2400, NULL, 0.25, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Наращивание ресниц кукольного эффекта', 2120.0000, 2100, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Стрижка с покраской', 2300.0000, 1500, NULL, 0.1, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Детокс спа', 1330.0000, 1800, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Стоун-терапия', 2100.0000, 3000, NULL, 0.25, N' Услуги салона красоты\Стоун-терапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Радиоволновой лифтинг', 1590.0000, 3000, NULL, 0.15, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Химические завивки', 1090.0000, 3000, NULL, 0.2, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Альгинатные маски', 2370.0000, 3300, NULL, 0, N' Услуги салона красоты\mask.jpeg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Спортивный массаж', 1650.0000, 1800, NULL, 0.15, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Лечебное покрытие ногтей', 1220.0000, 1800, NULL, 0, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Реконструкция и лечение волос и кожи головы', 2360.0000, 3300, NULL, 0.15, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Классический маникюр', 1680.0000, 3300, NULL, 0.2, N' Услуги салона красоты\Классический маникюр.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Консультация врача', 2120.0000, 1800, NULL, 0, N' Услуги салона красоты\122454.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Наращивание ресниц лисьего эффекта', 1370.0000, 1800, NULL, 0.25, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Экспресс-педикюр', 2170.0000, 1200, NULL, 0.2, N' Услуги салона красоты\Экспресс-педикюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Гречишный массаж', 1520.0000, 2400, NULL, 0.15, N' Услуги салона красоты\Гречишный массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Комбинированный маникюр', 2390.0000, 3600, NULL, 0, N' Услуги салона красоты\Комбинированный маникюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Фонофорез лица', 1120.0000, 1200, NULL, 0.05, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Перманентный макияж (татуаж)', 1270.0000, 2400, NULL, 0.25, N' Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Химический пилинг', 1880.0000, 1500, NULL, 0.15, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Плазмолифтинг', 2450.0000, 900, NULL, 0.2, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Криолифтинг', 1090.0000, 900, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Гликолевый поверхностный базовый пилинг', 2230.0000, 2100, NULL, 0.1, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Окрашивание ресниц', 1100.0000, 2100, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Коррекция нарощенных ресниц', 1310.0000, 2700, NULL, 0.05, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Фракционное омоложение лазерной системой Palomar', 1140.0000, 2700, NULL, 0.05, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Художественное оформление ресниц', 2040.0000, 3000, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Эстетическая лазерная шлифовка кожи', 1750.0000, 2400, NULL, 0.25, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Массаж ЖИВА', 2330.0000, 3300, NULL, 0.25, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Макияж', 2470.0000, 1800, NULL, 0.2, N' Услуги салона красоты\makeup.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Время вспять с коллагеном', 1850.0000, 2400, NULL, 0.1, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Снятие ресниц', 1680.0000, 2700, NULL, 0.25, N' Услуги салона красоты\Снятие ресниц.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Оформление бровей', 2280.0000, 2100, NULL, 0, N' Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Стрижка бороды машинкой', 1750.0000, 2700, NULL, 0.1, N' Услуги салона красоты\man.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Маски для лица', 2250.0000, 1200, NULL, 0.1, N' Услуги салона красоты\mask.jpeg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Татуаж', 1330.0000, 3600, NULL, 0.2, N' Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Уход для проблемной и комбинированной кожи', 2440.0000, 3600, NULL, 0.15, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Прокол ушей пистолетом', 2040.0000, 1500, NULL, 0.05, N' Услуги салона красоты\Прокол ушей пистолетом.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N'Ремонт одного ногтя', 2340.0000, 1800, NULL, 0.25, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N'Полировка с маслом', 1280.0000, 1200, NULL, 0, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N'Омоложение зоны вокруг глаз', 2540.0000, 1800, NULL, 0.15, N' Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N'Аппаратная косметология', 1180.0000, 3300, NULL, 0, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N'Консультация врача-косметолога', 2350.0000, 3600, NULL, 0.05, N' Услуги салона красоты\122454.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N'Визаж', 1260.0000, 3000, NULL, 0, N' Услуги салона красоты\makeup.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N'Демакияж', 1470.0000, 1200, NULL, 0.15, N' Услуги салона красоты\Демакияж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N'Коррекция ресниц', 2010.0000, 1200, NULL, 0.1, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N'Детская стрижка', 2330.0000, 2100, NULL, 0.2, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N'Мужская стрижка', 1690.0000, 3000, NULL, 0, N' Услуги салона красоты\man.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N'Вечерняя прическа', 2020.0000, 900, NULL, 0.25, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N'Наращивание ресниц беличьего эффекта', 1010.0000, 1800, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N'Мезонити (Тредлифтинг)', 2140.0000, 1500, NULL, 0, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N'Покрытие ногтей', 2410.0000, 2400, NULL, 0.15, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N'Гавайский массаж Ломи-Ломи', 1040.0000, 2100, NULL, 0.15, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N'Парафинотерапия', 1180.0000, 2100, NULL, 0.05, N' Услуги салона красоты\Парафинотерапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N'Озонотерапия', 1740.0000, 2100, NULL, 0.2, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N'Миндальный пилинг', 2430.0000, 2700, NULL, 0.15, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N'Покрытие ногтей гель-лаком', 2100.0000, 900, NULL, 0.2, N' Услуги салона красоты\Покрытие ногтей гель-лаком.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N'Декорирование ресниц стразами', 1920.0000, 3000, NULL, 0.15, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N'Микротоковая терапия', 2410.0000, 2700, NULL, 0.05, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N'Стрижка челки', 1930.0000, 2100, NULL, 0.1, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N'Лазерный пилинг', 1650.0000, 1200, NULL, 0.25, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N'Массаж лица', 2370.0000, 3600, NULL, 0, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (75, N'Снятие лака', 1240.0000, 2100, NULL, 0, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N'Классический педикюр', 2040.0000, 2100, NULL, 0.25, N' Услуги салона красоты\Экспресс-педикюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N'Классический массаж', 1120.0000, 2700, NULL, 0.15, N' Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N'Окрашивание бровей', 1120.0000, 3600, NULL, 0.1, N' Услуги салона красоты\Окрашивание бровей.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N'Наращивание ногтей гелем', 1540.0000, 2400, NULL, 0.1, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N'Ботокс', 1820.0000, 3000, NULL, 0.15, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N'Инъекционные методики', 1660.0000, 2400, NULL, 0, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N'Покраска ресниц', 2400.0000, 1800, NULL, 0, N' Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N'Свадебная прическа', 2070.0000, 2700, NULL, 0, N' Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N'Моделирование ресниц', 2140.0000, 2700, NULL, 0, N' Услуги салона красоты\Моделирование ресниц.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N'Миостимуляция', 2380.0000, 3600, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N'Шугаринг', 1400.0000, 1800, NULL, 0, N' Услуги салона красоты\Шугаринг.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N'Укрепление ногтей гелем', 1260.0000, 2700, NULL, 0, N' Услуги салона красоты\Укрепление ногтей гелем.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N'Солярий', 1790.0000, 3000, NULL, 0.1, N' Услуги салона красоты\soliarij.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N'Моментальный лифтинг', 2020.0000, 3000, NULL, 0, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N'Детский маникюр', 1900.0000, 2100, NULL, 0, N' Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N'Ультразвуковой пилинг', 1440.0000, 2700, NULL, 0.2, N' Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N'ИК-сауна', 1160.0000, 2700, NULL, 0.2, N' Услуги салона красоты\ИК-сауна.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N'Контурная пластика', 1550.0000, 2100, NULL, 0.2, N' Услуги салона красоты\Контурная пластика.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N'Декорирование нарощенных ресниц стразами', 1130.0000, 2700, NULL, 0, N' Услуги салона красоты\Декорирование нарощенных ресниц стразами.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N'Депиляция воском', 2330.0000, 1800, NULL, 0.15, N' Услуги салона красоты\Депиляция воском.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N'Полировка ногтей', 2310.0000, 3000, NULL, 0.15, N' Услуги салона красоты\Полировка ногтей.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N'Фракционный лазер Palomar Emerge', 1720.0000, 1500, NULL, 0.25, N' Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N'Увлажнение с коллагеном', 2490.0000, 3300, NULL, 0, N' Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N'Массаж оздоровительный', 1440.0000, 1200, NULL, 0, N' Услуги салона красоты\массаж.jpg')
GO
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N'Общий массаж', 1970.0000, 2700, NULL, 0.25, N' Услуги салона красоты\массаж.jpg')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (1, N'Тэг1', N'Black ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (2, N'Тэг2', N'Purple')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (3, N'Тэг3', N'Green ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (4, N'Тэг4', N'Red   ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (5, N'Тэг5', N'Orange')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (1, 2)
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
