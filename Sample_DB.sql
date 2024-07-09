USE [SAMPLE]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 09/07/2024 01:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Calendar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Calendar](
	[DateValue] [date] NULL,
	[Date] [nvarchar](7) NULL,
	[Month] [nvarchar](15) NULL,
	[MonthNo] [int] NULL,
	[Year] [int] NULL,
	[EOY] [date] NULL,
	[M+1] [date] NULL,
	[M+2] [date] NULL,
	[M-1] [date] NULL,
	[MonthYear] [nvarchar](50) NULL,
	[YearMonth] [int] NULL,
	[Quarter] [varchar](2) NULL,
	[Semester] [varchar](2) NULL,
	[DateKey] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[F_Sales]    Script Date: 09/07/2024 01:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Sales]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[F_Sales](
	[Invoice_Key] [varchar](20) NULL,
	[Period_Key] [int] NULL,
	[ACT] [decimal](23, 6) NULL,
	[RMN] [decimal](23, 6) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 09/07/2024 01:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Invoice](
	[Invoice_Key] [varchar](20) NOT NULL,
	[ProductLine_Key] [varchar](20) NULL,
	[Prd_Key] [varchar](20) NULL,
	[Invoice_Code] [varchar](40) NULL,
 CONSTRAINT [PK_ActivityBaseline] PRIMARY KEY CLUSTERED 
(
	[Invoice_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/07/2024 01:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[Prd_Key] [varchar](20) NOT NULL,
	[Prd_Code] [varchar](255) NULL,
	[Sub_Key] [nvarchar](20) NULL,
 CONSTRAINT [PK_PU] PRIMARY KEY CLUSTERED 
(
	[Prd_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductLine]    Script Date: 09/07/2024 01:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductLine](
	[ProductLine_Key] [varchar](20) NOT NULL,
	[Prd_Key] [varchar](20) NULL,
	[ProductLine_Type] [varchar](40) NULL,
	[ProductLine_Code] [varchar](40) NULL,
	[ProductLine_Date] [date] NULL,
 CONSTRAINT [PK_PUBaseline] PRIMARY KEY CLUSTERED 
(
	[ProductLine_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Situation]    Script Date: 09/07/2024 01:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Situation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Situation](
	[Situation_Key] [int] NOT NULL,
	[ProductLine_Key] [varchar](20) NULL,
	[Situation_Type] [varchar](20) NULL,
	[Situation_Date] [date] NULL,
	[SituationDate_key] [int] NULL,
 CONSTRAINT [PK_SituationBaseline] PRIMARY KEY CLUSTERED 
(
	[Situation_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sub]    Script Date: 09/07/2024 01:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sub]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sub](
	[Sub_Key] [nvarchar](20) NOT NULL,
	[Sub_Code] [nvarchar](40) NULL,
 CONSTRAINT [PK_Sub] PRIMARY KEY CLUSTERED 
(
	[Sub_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-01-31' AS Date), N'1/2015', N'January', 1, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-02-28' AS Date), CAST(N'2015-03-31' AS Date), CAST(N'2014-12-31' AS Date), N'January 2015', 201501, N'Q1', N'S1', 20150131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-02-28' AS Date), N'2/2015', N'February', 2, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-03-28' AS Date), CAST(N'2015-04-28' AS Date), CAST(N'2015-01-28' AS Date), N'February 2015', 201502, N'Q1', N'S1', 20150228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-03-31' AS Date), N'3/2015', N'March', 3, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-04-30' AS Date), CAST(N'2015-05-31' AS Date), CAST(N'2015-02-28' AS Date), N'March 2015', 201503, N'Q1', N'S1', 20150331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-04-30' AS Date), N'4/2015', N'April', 4, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-05-30' AS Date), CAST(N'2015-06-30' AS Date), CAST(N'2015-03-30' AS Date), N'April 2015', 201504, N'Q2', N'S1', 20150430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-05-31' AS Date), N'5/2015', N'May', 5, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-06-30' AS Date), CAST(N'2015-07-31' AS Date), CAST(N'2015-04-30' AS Date), N'May 2015', 201505, N'Q2', N'S1', 20150531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-06-30' AS Date), N'6/2015', N'June', 6, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-07-30' AS Date), CAST(N'2015-08-30' AS Date), CAST(N'2015-05-30' AS Date), N'June 2015', 201506, N'Q2', N'S1', 20150630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-07-31' AS Date), N'7/2015', N'July', 7, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-08-31' AS Date), CAST(N'2015-09-30' AS Date), CAST(N'2015-06-30' AS Date), N'July 2015', 201507, N'Q3', N'S2', 20150731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-08-31' AS Date), N'8/2015', N'August', 8, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-09-30' AS Date), CAST(N'2015-10-31' AS Date), CAST(N'2015-07-31' AS Date), N'August 2015', 201508, N'Q3', N'S2', 20150831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-09-30' AS Date), N'9/2015', N'September', 9, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-10-30' AS Date), CAST(N'2015-11-30' AS Date), CAST(N'2015-08-30' AS Date), N'September 2015', 201509, N'Q3', N'S2', 20150930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-10-31' AS Date), N'10/2015', N'October', 10, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-11-30' AS Date), CAST(N'2015-12-31' AS Date), CAST(N'2015-09-30' AS Date), N'October 2015', 201510, N'Q4', N'S2', 20151031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-11-30' AS Date), N'11/2015', N'November', 11, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2015-12-30' AS Date), CAST(N'2016-01-30' AS Date), CAST(N'2015-10-30' AS Date), N'November 2015', 201511, N'Q4', N'S2', 20151130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2015-12-31' AS Date), N'12/2015', N'December', 12, 2015, CAST(N'2015-12-31' AS Date), CAST(N'2016-01-31' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2015-11-30' AS Date), N'December 2015', 201512, N'Q4', N'S2', 20151231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-01-31' AS Date), N'1/2016', N'January', 1, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-03-31' AS Date), CAST(N'2015-12-31' AS Date), N'January 2016', 201601, N'Q1', N'S1', 20160131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-02-29' AS Date), N'2/2016', N'February', 2, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-03-29' AS Date), CAST(N'2016-04-29' AS Date), CAST(N'2016-01-29' AS Date), N'February 2016', 201602, N'Q1', N'S1', 20160229)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-03-31' AS Date), N'3/2016', N'March', 3, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-04-30' AS Date), CAST(N'2016-05-31' AS Date), CAST(N'2016-02-29' AS Date), N'March 2016', 201603, N'Q1', N'S1', 20160331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-04-30' AS Date), N'4/2016', N'April', 4, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-05-30' AS Date), CAST(N'2016-06-30' AS Date), CAST(N'2016-03-30' AS Date), N'April 2016', 201604, N'Q2', N'S1', 20160430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-05-31' AS Date), N'5/2016', N'May', 5, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-06-30' AS Date), CAST(N'2016-07-31' AS Date), CAST(N'2016-04-30' AS Date), N'May 2016', 201605, N'Q2', N'S1', 20160531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-06-30' AS Date), N'6/2016', N'June', 6, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-07-30' AS Date), CAST(N'2016-08-30' AS Date), CAST(N'2016-05-30' AS Date), N'June 2016', 201606, N'Q2', N'S1', 20160630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-07-31' AS Date), N'7/2016', N'July', 7, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-08-31' AS Date), CAST(N'2016-09-30' AS Date), CAST(N'2016-06-30' AS Date), N'July 2016', 201607, N'Q3', N'S2', 20160731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-08-31' AS Date), N'8/2016', N'August', 8, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-09-30' AS Date), CAST(N'2016-10-31' AS Date), CAST(N'2016-07-31' AS Date), N'August 2016', 201608, N'Q3', N'S2', 20160831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-09-30' AS Date), N'9/2016', N'September', 9, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-10-30' AS Date), CAST(N'2016-11-30' AS Date), CAST(N'2016-08-30' AS Date), N'September 2016', 201609, N'Q3', N'S2', 20160930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-10-31' AS Date), N'10/2016', N'October', 10, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-11-30' AS Date), CAST(N'2016-12-31' AS Date), CAST(N'2016-09-30' AS Date), N'October 2016', 201610, N'Q4', N'S2', 20161031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-11-30' AS Date), N'11/2016', N'November', 11, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2016-12-30' AS Date), CAST(N'2017-01-30' AS Date), CAST(N'2016-10-30' AS Date), N'November 2016', 201611, N'Q4', N'S2', 20161130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2016-12-31' AS Date), N'12/2016', N'December', 12, 2016, CAST(N'2016-12-31' AS Date), CAST(N'2017-01-31' AS Date), CAST(N'2017-02-28' AS Date), CAST(N'2016-11-30' AS Date), N'December 2016', 201612, N'Q4', N'S2', 20161231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-01-31' AS Date), N'1/2017', N'January', 1, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-02-28' AS Date), CAST(N'2017-03-31' AS Date), CAST(N'2016-12-31' AS Date), N'January 2017', 201701, N'Q1', N'S1', 20170131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-02-28' AS Date), N'2/2017', N'February', 2, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-03-28' AS Date), CAST(N'2017-04-28' AS Date), CAST(N'2017-01-28' AS Date), N'February 2017', 201702, N'Q1', N'S1', 20170228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-03-31' AS Date), N'3/2017', N'March', 3, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-04-30' AS Date), CAST(N'2017-05-31' AS Date), CAST(N'2017-02-28' AS Date), N'March 2017', 201703, N'Q1', N'S1', 20170331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-04-30' AS Date), N'4/2017', N'April', 4, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-05-30' AS Date), CAST(N'2017-06-30' AS Date), CAST(N'2017-03-30' AS Date), N'April 2017', 201704, N'Q2', N'S1', 20170430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-05-31' AS Date), N'5/2017', N'May', 5, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-06-30' AS Date), CAST(N'2017-07-31' AS Date), CAST(N'2017-04-30' AS Date), N'May 2017', 201705, N'Q2', N'S1', 20170531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-06-30' AS Date), N'6/2017', N'June', 6, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-07-30' AS Date), CAST(N'2017-08-30' AS Date), CAST(N'2017-05-30' AS Date), N'June 2017', 201706, N'Q2', N'S1', 20170630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-07-31' AS Date), N'7/2017', N'July', 7, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-08-31' AS Date), CAST(N'2017-09-30' AS Date), CAST(N'2017-06-30' AS Date), N'July 2017', 201707, N'Q3', N'S2', 20170731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-08-31' AS Date), N'8/2017', N'August', 8, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-09-30' AS Date), CAST(N'2017-10-31' AS Date), CAST(N'2017-07-31' AS Date), N'August 2017', 201708, N'Q3', N'S2', 20170831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-09-30' AS Date), N'9/2017', N'September', 9, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-10-30' AS Date), CAST(N'2017-11-30' AS Date), CAST(N'2017-08-30' AS Date), N'September 2017', 201709, N'Q3', N'S2', 20170930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-10-31' AS Date), N'10/2017', N'October', 10, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-11-30' AS Date), CAST(N'2017-12-31' AS Date), CAST(N'2017-09-30' AS Date), N'October 2017', 201710, N'Q4', N'S2', 20171031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-11-30' AS Date), N'11/2017', N'November', 11, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2017-12-30' AS Date), CAST(N'2018-01-30' AS Date), CAST(N'2017-10-30' AS Date), N'November 2017', 201711, N'Q4', N'S2', 20171130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2017-12-31' AS Date), N'12/2017', N'December', 12, 2017, CAST(N'2017-12-31' AS Date), CAST(N'2018-01-31' AS Date), CAST(N'2018-02-28' AS Date), CAST(N'2017-11-30' AS Date), N'December 2017', 201712, N'Q4', N'S2', 20171231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-01-31' AS Date), N'1/2018', N'January', 1, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-02-28' AS Date), CAST(N'2018-03-31' AS Date), CAST(N'2017-12-31' AS Date), N'January 2018', 201801, N'Q1', N'S1', 20180131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-02-28' AS Date), N'2/2018', N'February', 2, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-03-28' AS Date), CAST(N'2018-04-28' AS Date), CAST(N'2018-01-28' AS Date), N'February 2018', 201802, N'Q1', N'S1', 20180228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-03-31' AS Date), N'3/2018', N'March', 3, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-04-30' AS Date), CAST(N'2018-05-31' AS Date), CAST(N'2018-02-28' AS Date), N'March 2018', 201803, N'Q1', N'S1', 20180331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-04-30' AS Date), N'4/2018', N'April', 4, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-05-30' AS Date), CAST(N'2018-06-30' AS Date), CAST(N'2018-03-30' AS Date), N'April 2018', 201804, N'Q2', N'S1', 20180430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-05-31' AS Date), N'5/2018', N'May', 5, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-06-30' AS Date), CAST(N'2018-07-31' AS Date), CAST(N'2018-04-30' AS Date), N'May 2018', 201805, N'Q2', N'S1', 20180531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-06-30' AS Date), N'6/2018', N'June', 6, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-07-30' AS Date), CAST(N'2018-08-30' AS Date), CAST(N'2018-05-30' AS Date), N'June 2018', 201806, N'Q2', N'S1', 20180630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-07-31' AS Date), N'7/2018', N'July', 7, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-08-31' AS Date), CAST(N'2018-09-30' AS Date), CAST(N'2018-06-30' AS Date), N'July 2018', 201807, N'Q3', N'S2', 20180731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-08-31' AS Date), N'8/2018', N'August', 8, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-09-30' AS Date), CAST(N'2018-10-31' AS Date), CAST(N'2018-07-31' AS Date), N'August 2018', 201808, N'Q3', N'S2', 20180831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-09-30' AS Date), N'9/2018', N'September', 9, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-10-30' AS Date), CAST(N'2018-11-30' AS Date), CAST(N'2018-08-30' AS Date), N'September 2018', 201809, N'Q3', N'S2', 20180930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-10-31' AS Date), N'10/2018', N'October', 10, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-11-30' AS Date), CAST(N'2018-12-31' AS Date), CAST(N'2018-09-30' AS Date), N'October 2018', 201810, N'Q4', N'S2', 20181031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-11-30' AS Date), N'11/2018', N'November', 11, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2018-12-30' AS Date), CAST(N'2019-01-30' AS Date), CAST(N'2018-10-30' AS Date), N'November 2018', 201811, N'Q4', N'S2', 20181130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2018-12-31' AS Date), N'12/2018', N'December', 12, 2018, CAST(N'2018-12-31' AS Date), CAST(N'2019-01-31' AS Date), CAST(N'2019-02-28' AS Date), CAST(N'2018-11-30' AS Date), N'December 2018', 201812, N'Q4', N'S2', 20181231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-01-31' AS Date), N'1/2019', N'January', 1, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-02-28' AS Date), CAST(N'2019-03-31' AS Date), CAST(N'2018-12-31' AS Date), N'January 2019', 201901, N'Q1', N'S1', 20190131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-02-28' AS Date), N'2/2019', N'February', 2, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-03-28' AS Date), CAST(N'2019-04-28' AS Date), CAST(N'2019-01-28' AS Date), N'February 2019', 201902, N'Q1', N'S1', 20190228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-03-31' AS Date), N'3/2019', N'March', 3, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-04-30' AS Date), CAST(N'2019-05-31' AS Date), CAST(N'2019-02-28' AS Date), N'March 2019', 201903, N'Q1', N'S1', 20190331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-04-30' AS Date), N'4/2019', N'April', 4, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-05-30' AS Date), CAST(N'2019-06-30' AS Date), CAST(N'2019-03-30' AS Date), N'April 2019', 201904, N'Q2', N'S1', 20190430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-05-31' AS Date), N'5/2019', N'May', 5, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-06-30' AS Date), CAST(N'2019-07-31' AS Date), CAST(N'2019-04-30' AS Date), N'May 2019', 201905, N'Q2', N'S1', 20190531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-06-30' AS Date), N'6/2019', N'June', 6, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-07-30' AS Date), CAST(N'2019-08-30' AS Date), CAST(N'2019-05-30' AS Date), N'June 2019', 201906, N'Q2', N'S1', 20190630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-07-31' AS Date), N'7/2019', N'July', 7, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-08-31' AS Date), CAST(N'2019-09-30' AS Date), CAST(N'2019-06-30' AS Date), N'July 2019', 201907, N'Q3', N'S2', 20190731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-08-31' AS Date), N'8/2019', N'August', 8, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-09-30' AS Date), CAST(N'2019-10-31' AS Date), CAST(N'2019-07-31' AS Date), N'August 2019', 201908, N'Q3', N'S2', 20190831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-09-30' AS Date), N'9/2019', N'September', 9, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-10-30' AS Date), CAST(N'2019-11-30' AS Date), CAST(N'2019-08-30' AS Date), N'September 2019', 201909, N'Q3', N'S2', 20190930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-10-31' AS Date), N'10/2019', N'October', 10, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-11-30' AS Date), CAST(N'2019-12-31' AS Date), CAST(N'2019-09-30' AS Date), N'October 2019', 201910, N'Q4', N'S2', 20191031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-11-30' AS Date), N'11/2019', N'November', 11, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2019-12-30' AS Date), CAST(N'2020-01-30' AS Date), CAST(N'2019-10-30' AS Date), N'November 2019', 201911, N'Q4', N'S2', 20191130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2019-12-31' AS Date), N'12/2019', N'December', 12, 2019, CAST(N'2019-12-31' AS Date), CAST(N'2020-01-31' AS Date), CAST(N'2020-02-29' AS Date), CAST(N'2019-11-30' AS Date), N'December 2019', 201912, N'Q4', N'S2', 20191231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-01-31' AS Date), N'1/2020', N'January', 1, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-02-29' AS Date), CAST(N'2020-03-31' AS Date), CAST(N'2019-12-31' AS Date), N'January 2020', 202001, N'Q1', N'S1', 20200131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-02-29' AS Date), N'2/2020', N'February', 2, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-03-29' AS Date), CAST(N'2020-04-29' AS Date), CAST(N'2020-01-29' AS Date), N'February 2020', 202002, N'Q1', N'S1', 20200229)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-03-31' AS Date), N'3/2020', N'March', 3, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-04-30' AS Date), CAST(N'2020-05-31' AS Date), CAST(N'2020-02-29' AS Date), N'March 2020', 202003, N'Q1', N'S1', 20200331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-04-30' AS Date), N'4/2020', N'April', 4, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-05-30' AS Date), CAST(N'2020-06-30' AS Date), CAST(N'2020-03-30' AS Date), N'April 2020', 202004, N'Q2', N'S1', 20200430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-05-31' AS Date), N'5/2020', N'May', 5, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-06-30' AS Date), CAST(N'2020-07-31' AS Date), CAST(N'2020-04-30' AS Date), N'May 2020', 202005, N'Q2', N'S1', 20200531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-06-30' AS Date), N'6/2020', N'June', 6, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-07-30' AS Date), CAST(N'2020-08-30' AS Date), CAST(N'2020-05-30' AS Date), N'June 2020', 202006, N'Q2', N'S1', 20200630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-07-31' AS Date), N'7/2020', N'July', 7, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-08-31' AS Date), CAST(N'2020-09-30' AS Date), CAST(N'2020-06-30' AS Date), N'July 2020', 202007, N'Q3', N'S2', 20200731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-08-31' AS Date), N'8/2020', N'August', 8, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-09-30' AS Date), CAST(N'2020-10-31' AS Date), CAST(N'2020-07-31' AS Date), N'August 2020', 202008, N'Q3', N'S2', 20200831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-09-30' AS Date), N'9/2020', N'September', 9, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-10-30' AS Date), CAST(N'2020-11-30' AS Date), CAST(N'2020-08-30' AS Date), N'September 2020', 202009, N'Q3', N'S2', 20200930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-10-31' AS Date), N'10/2020', N'October', 10, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-11-30' AS Date), CAST(N'2020-12-31' AS Date), CAST(N'2020-09-30' AS Date), N'October 2020', 202010, N'Q4', N'S2', 20201031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-11-30' AS Date), N'11/2020', N'November', 11, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2020-12-30' AS Date), CAST(N'2021-01-30' AS Date), CAST(N'2020-10-30' AS Date), N'November 2020', 202011, N'Q4', N'S2', 20201130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2020-12-31' AS Date), N'12/2020', N'December', 12, 2020, CAST(N'2020-12-31' AS Date), CAST(N'2021-01-31' AS Date), CAST(N'2021-02-28' AS Date), CAST(N'2020-11-30' AS Date), N'December 2020', 202012, N'Q4', N'S2', 20201231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-01-31' AS Date), N'1/2021', N'January', 1, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-02-28' AS Date), CAST(N'2021-03-31' AS Date), CAST(N'2020-12-31' AS Date), N'January 2021', 202101, N'Q1', N'S1', 20210131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-02-28' AS Date), N'2/2021', N'February', 2, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-03-28' AS Date), CAST(N'2021-04-28' AS Date), CAST(N'2021-01-28' AS Date), N'February 2021', 202102, N'Q1', N'S1', 20210228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-03-31' AS Date), N'3/2021', N'March', 3, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-04-30' AS Date), CAST(N'2021-05-31' AS Date), CAST(N'2021-02-28' AS Date), N'March 2021', 202103, N'Q1', N'S1', 20210331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-04-30' AS Date), N'4/2021', N'April', 4, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-05-30' AS Date), CAST(N'2021-06-30' AS Date), CAST(N'2021-03-30' AS Date), N'April 2021', 202104, N'Q2', N'S1', 20210430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-05-31' AS Date), N'5/2021', N'May', 5, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-06-30' AS Date), CAST(N'2021-07-31' AS Date), CAST(N'2021-04-30' AS Date), N'May 2021', 202105, N'Q2', N'S1', 20210531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-06-30' AS Date), N'6/2021', N'June', 6, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-07-30' AS Date), CAST(N'2021-08-30' AS Date), CAST(N'2021-05-30' AS Date), N'June 2021', 202106, N'Q2', N'S1', 20210630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-07-31' AS Date), N'7/2021', N'July', 7, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-08-31' AS Date), CAST(N'2021-09-30' AS Date), CAST(N'2021-06-30' AS Date), N'July 2021', 202107, N'Q3', N'S2', 20210731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-08-31' AS Date), N'8/2021', N'August', 8, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-09-30' AS Date), CAST(N'2021-10-31' AS Date), CAST(N'2021-07-31' AS Date), N'August 2021', 202108, N'Q3', N'S2', 20210831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-09-30' AS Date), N'9/2021', N'September', 9, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-10-30' AS Date), CAST(N'2021-11-30' AS Date), CAST(N'2021-08-30' AS Date), N'September 2021', 202109, N'Q3', N'S2', 20210930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-10-31' AS Date), N'10/2021', N'October', 10, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-11-30' AS Date), CAST(N'2021-12-31' AS Date), CAST(N'2021-09-30' AS Date), N'October 2021', 202110, N'Q4', N'S2', 20211031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-11-30' AS Date), N'11/2021', N'November', 11, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2021-12-30' AS Date), CAST(N'2022-01-30' AS Date), CAST(N'2021-10-30' AS Date), N'November 2021', 202111, N'Q4', N'S2', 20211130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2021-12-31' AS Date), N'12/2021', N'December', 12, 2021, CAST(N'2021-12-31' AS Date), CAST(N'2022-01-31' AS Date), CAST(N'2022-02-28' AS Date), CAST(N'2021-11-30' AS Date), N'December 2021', 202112, N'Q4', N'S2', 20211231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-01-31' AS Date), N'1/2022', N'January', 1, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-02-28' AS Date), CAST(N'2022-03-31' AS Date), CAST(N'2021-12-31' AS Date), N'January 2022', 202201, N'Q1', N'S1', 20220131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-02-28' AS Date), N'2/2022', N'February', 2, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-03-28' AS Date), CAST(N'2022-04-28' AS Date), CAST(N'2022-01-28' AS Date), N'February 2022', 202202, N'Q1', N'S1', 20220228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-03-31' AS Date), N'3/2022', N'March', 3, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-04-30' AS Date), CAST(N'2022-05-31' AS Date), CAST(N'2022-02-28' AS Date), N'March 2022', 202203, N'Q1', N'S1', 20220331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-04-30' AS Date), N'4/2022', N'April', 4, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-05-30' AS Date), CAST(N'2022-06-30' AS Date), CAST(N'2022-03-30' AS Date), N'April 2022', 202204, N'Q2', N'S1', 20220430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-05-31' AS Date), N'5/2022', N'May', 5, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-06-30' AS Date), CAST(N'2022-07-31' AS Date), CAST(N'2022-04-30' AS Date), N'May 2022', 202205, N'Q2', N'S1', 20220531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-06-30' AS Date), N'6/2022', N'June', 6, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-07-30' AS Date), CAST(N'2022-08-30' AS Date), CAST(N'2022-05-30' AS Date), N'June 2022', 202206, N'Q2', N'S1', 20220630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-07-31' AS Date), N'7/2022', N'July', 7, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-08-31' AS Date), CAST(N'2022-09-30' AS Date), CAST(N'2022-06-30' AS Date), N'July 2022', 202207, N'Q3', N'S2', 20220731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-08-31' AS Date), N'8/2022', N'August', 8, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-09-30' AS Date), CAST(N'2022-10-31' AS Date), CAST(N'2022-07-31' AS Date), N'August 2022', 202208, N'Q3', N'S2', 20220831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-09-30' AS Date), N'9/2022', N'September', 9, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-10-30' AS Date), CAST(N'2022-11-30' AS Date), CAST(N'2022-08-30' AS Date), N'September 2022', 202209, N'Q3', N'S2', 20220930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-10-31' AS Date), N'10/2022', N'October', 10, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-11-30' AS Date), CAST(N'2022-12-31' AS Date), CAST(N'2022-09-30' AS Date), N'October 2022', 202210, N'Q4', N'S2', 20221031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-11-30' AS Date), N'11/2022', N'November', 11, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2022-12-30' AS Date), CAST(N'2023-01-30' AS Date), CAST(N'2022-10-30' AS Date), N'November 2022', 202211, N'Q4', N'S2', 20221130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2022-12-31' AS Date), N'12/2022', N'December', 12, 2022, CAST(N'2022-12-31' AS Date), CAST(N'2023-01-31' AS Date), CAST(N'2023-02-28' AS Date), CAST(N'2022-11-30' AS Date), N'December 2022', 202212, N'Q4', N'S2', 20221231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-01-31' AS Date), N'1/2023', N'January', 1, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-02-28' AS Date), CAST(N'2023-03-31' AS Date), CAST(N'2022-12-31' AS Date), N'January 2023', 202301, N'Q1', N'S1', 20230131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-02-28' AS Date), N'2/2023', N'February', 2, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-03-28' AS Date), CAST(N'2023-04-28' AS Date), CAST(N'2023-01-28' AS Date), N'February 2023', 202302, N'Q1', N'S1', 20230228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-03-31' AS Date), N'3/2023', N'March', 3, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-04-30' AS Date), CAST(N'2023-05-31' AS Date), CAST(N'2023-02-28' AS Date), N'March 2023', 202303, N'Q1', N'S1', 20230331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-04-30' AS Date), N'4/2023', N'April', 4, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-05-30' AS Date), CAST(N'2023-06-30' AS Date), CAST(N'2023-03-30' AS Date), N'April 2023', 202304, N'Q2', N'S1', 20230430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-05-31' AS Date), N'5/2023', N'May', 5, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-06-30' AS Date), CAST(N'2023-07-31' AS Date), CAST(N'2023-04-30' AS Date), N'May 2023', 202305, N'Q2', N'S1', 20230531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-06-30' AS Date), N'6/2023', N'June', 6, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-07-30' AS Date), CAST(N'2023-08-30' AS Date), CAST(N'2023-05-30' AS Date), N'June 2023', 202306, N'Q2', N'S1', 20230630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-07-31' AS Date), N'7/2023', N'July', 7, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-08-31' AS Date), CAST(N'2023-09-30' AS Date), CAST(N'2023-06-30' AS Date), N'July 2023', 202307, N'Q3', N'S2', 20230731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-08-31' AS Date), N'8/2023', N'August', 8, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-09-30' AS Date), CAST(N'2023-10-31' AS Date), CAST(N'2023-07-31' AS Date), N'August 2023', 202308, N'Q3', N'S2', 20230831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-09-30' AS Date), N'9/2023', N'September', 9, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-10-30' AS Date), CAST(N'2023-11-30' AS Date), CAST(N'2023-08-30' AS Date), N'September 2023', 202309, N'Q3', N'S2', 20230930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-10-31' AS Date), N'10/2023', N'October', 10, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-11-30' AS Date), CAST(N'2023-12-31' AS Date), CAST(N'2023-09-30' AS Date), N'October 2023', 202310, N'Q4', N'S2', 20231031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-11-30' AS Date), N'11/2023', N'November', 11, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2023-12-30' AS Date), CAST(N'2024-01-30' AS Date), CAST(N'2023-10-30' AS Date), N'November 2023', 202311, N'Q4', N'S2', 20231130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2023-12-31' AS Date), N'12/2023', N'December', 12, 2023, CAST(N'2023-12-31' AS Date), CAST(N'2024-01-31' AS Date), CAST(N'2024-02-29' AS Date), CAST(N'2023-11-30' AS Date), N'December 2023', 202312, N'Q4', N'S2', 20231231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-01-31' AS Date), N'1/2024', N'January', 1, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-02-29' AS Date), CAST(N'2024-03-31' AS Date), CAST(N'2023-12-31' AS Date), N'January 2024', 202401, N'Q1', N'S1', 20240131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-02-29' AS Date), N'2/2024', N'February', 2, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-03-29' AS Date), CAST(N'2024-04-29' AS Date), CAST(N'2024-01-29' AS Date), N'February 2024', 202402, N'Q1', N'S1', 20240229)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-03-31' AS Date), N'3/2024', N'March', 3, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-04-30' AS Date), CAST(N'2024-05-31' AS Date), CAST(N'2024-02-29' AS Date), N'March 2024', 202403, N'Q1', N'S1', 20240331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-04-30' AS Date), N'4/2024', N'April', 4, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-05-30' AS Date), CAST(N'2024-06-30' AS Date), CAST(N'2024-03-30' AS Date), N'April 2024', 202404, N'Q2', N'S1', 20240430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-05-31' AS Date), N'5/2024', N'May', 5, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-06-30' AS Date), CAST(N'2024-07-31' AS Date), CAST(N'2024-04-30' AS Date), N'May 2024', 202405, N'Q2', N'S1', 20240531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-06-30' AS Date), N'6/2024', N'June', 6, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-07-30' AS Date), CAST(N'2024-08-30' AS Date), CAST(N'2024-05-30' AS Date), N'June 2024', 202406, N'Q2', N'S1', 20240630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-07-31' AS Date), N'7/2024', N'July', 7, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-08-31' AS Date), CAST(N'2024-09-30' AS Date), CAST(N'2024-06-30' AS Date), N'July 2024', 202407, N'Q3', N'S2', 20240731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-08-31' AS Date), N'8/2024', N'August', 8, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-09-30' AS Date), CAST(N'2024-10-31' AS Date), CAST(N'2024-07-31' AS Date), N'August 2024', 202408, N'Q3', N'S2', 20240831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-09-30' AS Date), N'9/2024', N'September', 9, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-10-30' AS Date), CAST(N'2024-11-30' AS Date), CAST(N'2024-08-30' AS Date), N'September 2024', 202409, N'Q3', N'S2', 20240930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-10-31' AS Date), N'10/2024', N'October', 10, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-11-30' AS Date), CAST(N'2024-12-31' AS Date), CAST(N'2024-09-30' AS Date), N'October 2024', 202410, N'Q4', N'S2', 20241031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-11-30' AS Date), N'11/2024', N'November', 11, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2024-12-30' AS Date), CAST(N'2025-01-30' AS Date), CAST(N'2024-10-30' AS Date), N'November 2024', 202411, N'Q4', N'S2', 20241130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2024-12-31' AS Date), N'12/2024', N'December', 12, 2024, CAST(N'2024-12-31' AS Date), CAST(N'2025-01-31' AS Date), CAST(N'2025-02-28' AS Date), CAST(N'2024-11-30' AS Date), N'December 2024', 202412, N'Q4', N'S2', 20241231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-01-31' AS Date), N'1/2025', N'January', 1, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-02-28' AS Date), CAST(N'2025-03-31' AS Date), CAST(N'2024-12-31' AS Date), N'January 2025', 202501, N'Q1', N'S1', 20250131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-02-28' AS Date), N'2/2025', N'February', 2, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-03-28' AS Date), CAST(N'2025-04-28' AS Date), CAST(N'2025-01-28' AS Date), N'February 2025', 202502, N'Q1', N'S1', 20250228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-03-31' AS Date), N'3/2025', N'March', 3, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-04-30' AS Date), CAST(N'2025-05-31' AS Date), CAST(N'2025-02-28' AS Date), N'March 2025', 202503, N'Q1', N'S1', 20250331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-04-30' AS Date), N'4/2025', N'April', 4, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-05-30' AS Date), CAST(N'2025-06-30' AS Date), CAST(N'2025-03-30' AS Date), N'April 2025', 202504, N'Q2', N'S1', 20250430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-05-31' AS Date), N'5/2025', N'May', 5, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-06-30' AS Date), CAST(N'2025-07-31' AS Date), CAST(N'2025-04-30' AS Date), N'May 2025', 202505, N'Q2', N'S1', 20250531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-06-30' AS Date), N'6/2025', N'June', 6, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-07-30' AS Date), CAST(N'2025-08-30' AS Date), CAST(N'2025-05-30' AS Date), N'June 2025', 202506, N'Q2', N'S1', 20250630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-07-31' AS Date), N'7/2025', N'July', 7, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-08-31' AS Date), CAST(N'2025-09-30' AS Date), CAST(N'2025-06-30' AS Date), N'July 2025', 202507, N'Q3', N'S2', 20250731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-08-31' AS Date), N'8/2025', N'August', 8, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-09-30' AS Date), CAST(N'2025-10-31' AS Date), CAST(N'2025-07-31' AS Date), N'August 2025', 202508, N'Q3', N'S2', 20250831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-09-30' AS Date), N'9/2025', N'September', 9, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-10-30' AS Date), CAST(N'2025-11-30' AS Date), CAST(N'2025-08-30' AS Date), N'September 2025', 202509, N'Q3', N'S2', 20250930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-10-31' AS Date), N'10/2025', N'October', 10, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-11-30' AS Date), CAST(N'2025-12-31' AS Date), CAST(N'2025-09-30' AS Date), N'October 2025', 202510, N'Q4', N'S2', 20251031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-11-30' AS Date), N'11/2025', N'November', 11, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2025-12-30' AS Date), CAST(N'2026-01-30' AS Date), CAST(N'2025-10-30' AS Date), N'November 2025', 202511, N'Q4', N'S2', 20251130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2025-12-31' AS Date), N'12/2025', N'December', 12, 2025, CAST(N'2025-12-31' AS Date), CAST(N'2026-01-31' AS Date), CAST(N'2026-02-28' AS Date), CAST(N'2025-11-30' AS Date), N'December 2025', 202512, N'Q4', N'S2', 20251231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-01-31' AS Date), N'1/2026', N'January', 1, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-02-28' AS Date), CAST(N'2026-03-31' AS Date), CAST(N'2025-12-31' AS Date), N'January 2026', 202601, N'Q1', N'S1', 20260131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-02-28' AS Date), N'2/2026', N'February', 2, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-03-28' AS Date), CAST(N'2026-04-28' AS Date), CAST(N'2026-01-28' AS Date), N'February 2026', 202602, N'Q1', N'S1', 20260228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-03-31' AS Date), N'3/2026', N'March', 3, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-04-30' AS Date), CAST(N'2026-05-31' AS Date), CAST(N'2026-02-28' AS Date), N'March 2026', 202603, N'Q1', N'S1', 20260331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-04-30' AS Date), N'4/2026', N'April', 4, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-05-30' AS Date), CAST(N'2026-06-30' AS Date), CAST(N'2026-03-30' AS Date), N'April 2026', 202604, N'Q2', N'S1', 20260430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-05-31' AS Date), N'5/2026', N'May', 5, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-06-30' AS Date), CAST(N'2026-07-31' AS Date), CAST(N'2026-04-30' AS Date), N'May 2026', 202605, N'Q2', N'S1', 20260531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-06-30' AS Date), N'6/2026', N'June', 6, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-07-30' AS Date), CAST(N'2026-08-30' AS Date), CAST(N'2026-05-30' AS Date), N'June 2026', 202606, N'Q2', N'S1', 20260630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-07-31' AS Date), N'7/2026', N'July', 7, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-08-31' AS Date), CAST(N'2026-09-30' AS Date), CAST(N'2026-06-30' AS Date), N'July 2026', 202607, N'Q3', N'S2', 20260731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-08-31' AS Date), N'8/2026', N'August', 8, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-09-30' AS Date), CAST(N'2026-10-31' AS Date), CAST(N'2026-07-31' AS Date), N'August 2026', 202608, N'Q3', N'S2', 20260831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-09-30' AS Date), N'9/2026', N'September', 9, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-10-30' AS Date), CAST(N'2026-11-30' AS Date), CAST(N'2026-08-30' AS Date), N'September 2026', 202609, N'Q3', N'S2', 20260930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-10-31' AS Date), N'10/2026', N'October', 10, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-11-30' AS Date), CAST(N'2026-12-31' AS Date), CAST(N'2026-09-30' AS Date), N'October 2026', 202610, N'Q4', N'S2', 20261031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-11-30' AS Date), N'11/2026', N'November', 11, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2026-12-30' AS Date), CAST(N'2027-01-30' AS Date), CAST(N'2026-10-30' AS Date), N'November 2026', 202611, N'Q4', N'S2', 20261130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2026-12-31' AS Date), N'12/2026', N'December', 12, 2026, CAST(N'2026-12-31' AS Date), CAST(N'2027-01-31' AS Date), CAST(N'2027-02-28' AS Date), CAST(N'2026-11-30' AS Date), N'December 2026', 202612, N'Q4', N'S2', 20261231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-01-31' AS Date), N'1/2027', N'January', 1, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-02-28' AS Date), CAST(N'2027-03-31' AS Date), CAST(N'2026-12-31' AS Date), N'January 2027', 202701, N'Q1', N'S1', 20270131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-02-28' AS Date), N'2/2027', N'February', 2, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-03-28' AS Date), CAST(N'2027-04-28' AS Date), CAST(N'2027-01-28' AS Date), N'February 2027', 202702, N'Q1', N'S1', 20270228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-03-31' AS Date), N'3/2027', N'March', 3, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-04-30' AS Date), CAST(N'2027-05-31' AS Date), CAST(N'2027-02-28' AS Date), N'March 2027', 202703, N'Q1', N'S1', 20270331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-04-30' AS Date), N'4/2027', N'April', 4, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-05-30' AS Date), CAST(N'2027-06-30' AS Date), CAST(N'2027-03-30' AS Date), N'April 2027', 202704, N'Q2', N'S1', 20270430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-05-31' AS Date), N'5/2027', N'May', 5, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-06-30' AS Date), CAST(N'2027-07-31' AS Date), CAST(N'2027-04-30' AS Date), N'May 2027', 202705, N'Q2', N'S1', 20270531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-06-30' AS Date), N'6/2027', N'June', 6, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-07-30' AS Date), CAST(N'2027-08-30' AS Date), CAST(N'2027-05-30' AS Date), N'June 2027', 202706, N'Q2', N'S1', 20270630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-07-31' AS Date), N'7/2027', N'July', 7, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-08-31' AS Date), CAST(N'2027-09-30' AS Date), CAST(N'2027-06-30' AS Date), N'July 2027', 202707, N'Q3', N'S2', 20270731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-08-31' AS Date), N'8/2027', N'August', 8, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-09-30' AS Date), CAST(N'2027-10-31' AS Date), CAST(N'2027-07-31' AS Date), N'August 2027', 202708, N'Q3', N'S2', 20270831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-09-30' AS Date), N'9/2027', N'September', 9, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-10-30' AS Date), CAST(N'2027-11-30' AS Date), CAST(N'2027-08-30' AS Date), N'September 2027', 202709, N'Q3', N'S2', 20270930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-10-31' AS Date), N'10/2027', N'October', 10, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-11-30' AS Date), CAST(N'2027-12-31' AS Date), CAST(N'2027-09-30' AS Date), N'October 2027', 202710, N'Q4', N'S2', 20271031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-11-30' AS Date), N'11/2027', N'November', 11, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2027-12-30' AS Date), CAST(N'2028-01-30' AS Date), CAST(N'2027-10-30' AS Date), N'November 2027', 202711, N'Q4', N'S2', 20271130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2027-12-31' AS Date), N'12/2027', N'December', 12, 2027, CAST(N'2027-12-31' AS Date), CAST(N'2028-01-31' AS Date), CAST(N'2028-02-29' AS Date), CAST(N'2027-11-30' AS Date), N'December 2027', 202712, N'Q4', N'S2', 20271231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-01-31' AS Date), N'1/2028', N'January', 1, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-02-29' AS Date), CAST(N'2028-03-31' AS Date), CAST(N'2027-12-31' AS Date), N'January 2028', 202801, N'Q1', N'S1', 20280131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-02-29' AS Date), N'2/2028', N'February', 2, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-03-29' AS Date), CAST(N'2028-04-29' AS Date), CAST(N'2028-01-29' AS Date), N'February 2028', 202802, N'Q1', N'S1', 20280229)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-03-31' AS Date), N'3/2028', N'March', 3, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-04-30' AS Date), CAST(N'2028-05-31' AS Date), CAST(N'2028-02-29' AS Date), N'March 2028', 202803, N'Q1', N'S1', 20280331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-04-30' AS Date), N'4/2028', N'April', 4, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-05-30' AS Date), CAST(N'2028-06-30' AS Date), CAST(N'2028-03-30' AS Date), N'April 2028', 202804, N'Q2', N'S1', 20280430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-05-31' AS Date), N'5/2028', N'May', 5, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-06-30' AS Date), CAST(N'2028-07-31' AS Date), CAST(N'2028-04-30' AS Date), N'May 2028', 202805, N'Q2', N'S1', 20280531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-06-30' AS Date), N'6/2028', N'June', 6, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-07-30' AS Date), CAST(N'2028-08-30' AS Date), CAST(N'2028-05-30' AS Date), N'June 2028', 202806, N'Q2', N'S1', 20280630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-07-31' AS Date), N'7/2028', N'July', 7, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-08-31' AS Date), CAST(N'2028-09-30' AS Date), CAST(N'2028-06-30' AS Date), N'July 2028', 202807, N'Q3', N'S2', 20280731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-08-31' AS Date), N'8/2028', N'August', 8, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-09-30' AS Date), CAST(N'2028-10-31' AS Date), CAST(N'2028-07-31' AS Date), N'August 2028', 202808, N'Q3', N'S2', 20280831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-09-30' AS Date), N'9/2028', N'September', 9, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-10-30' AS Date), CAST(N'2028-11-30' AS Date), CAST(N'2028-08-30' AS Date), N'September 2028', 202809, N'Q3', N'S2', 20280930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-10-31' AS Date), N'10/2028', N'October', 10, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-11-30' AS Date), CAST(N'2028-12-31' AS Date), CAST(N'2028-09-30' AS Date), N'October 2028', 202810, N'Q4', N'S2', 20281031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-11-30' AS Date), N'11/2028', N'November', 11, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2028-12-30' AS Date), CAST(N'2029-01-30' AS Date), CAST(N'2028-10-30' AS Date), N'November 2028', 202811, N'Q4', N'S2', 20281130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2028-12-31' AS Date), N'12/2028', N'December', 12, 2028, CAST(N'2028-12-31' AS Date), CAST(N'2029-01-31' AS Date), CAST(N'2029-02-28' AS Date), CAST(N'2028-11-30' AS Date), N'December 2028', 202812, N'Q4', N'S2', 20281231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-01-31' AS Date), N'1/2029', N'January', 1, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-02-28' AS Date), CAST(N'2029-03-31' AS Date), CAST(N'2028-12-31' AS Date), N'January 2029', 202901, N'Q1', N'S1', 20290131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-02-28' AS Date), N'2/2029', N'February', 2, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-03-28' AS Date), CAST(N'2029-04-28' AS Date), CAST(N'2029-01-28' AS Date), N'February 2029', 202902, N'Q1', N'S1', 20290228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-03-31' AS Date), N'3/2029', N'March', 3, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-04-30' AS Date), CAST(N'2029-05-31' AS Date), CAST(N'2029-02-28' AS Date), N'March 2029', 202903, N'Q1', N'S1', 20290331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-04-30' AS Date), N'4/2029', N'April', 4, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-05-30' AS Date), CAST(N'2029-06-30' AS Date), CAST(N'2029-03-30' AS Date), N'April 2029', 202904, N'Q2', N'S1', 20290430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-05-31' AS Date), N'5/2029', N'May', 5, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-06-30' AS Date), CAST(N'2029-07-31' AS Date), CAST(N'2029-04-30' AS Date), N'May 2029', 202905, N'Q2', N'S1', 20290531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-06-30' AS Date), N'6/2029', N'June', 6, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-07-30' AS Date), CAST(N'2029-08-30' AS Date), CAST(N'2029-05-30' AS Date), N'June 2029', 202906, N'Q2', N'S1', 20290630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-07-31' AS Date), N'7/2029', N'July', 7, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-08-31' AS Date), CAST(N'2029-09-30' AS Date), CAST(N'2029-06-30' AS Date), N'July 2029', 202907, N'Q3', N'S2', 20290731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-08-31' AS Date), N'8/2029', N'August', 8, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-09-30' AS Date), CAST(N'2029-10-31' AS Date), CAST(N'2029-07-31' AS Date), N'August 2029', 202908, N'Q3', N'S2', 20290831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-09-30' AS Date), N'9/2029', N'September', 9, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-10-30' AS Date), CAST(N'2029-11-30' AS Date), CAST(N'2029-08-30' AS Date), N'September 2029', 202909, N'Q3', N'S2', 20290930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-10-31' AS Date), N'10/2029', N'October', 10, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-11-30' AS Date), CAST(N'2029-12-31' AS Date), CAST(N'2029-09-30' AS Date), N'October 2029', 202910, N'Q4', N'S2', 20291031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-11-30' AS Date), N'11/2029', N'November', 11, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2029-12-30' AS Date), CAST(N'2030-01-30' AS Date), CAST(N'2029-10-30' AS Date), N'November 2029', 202911, N'Q4', N'S2', 20291130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2029-12-31' AS Date), N'12/2029', N'December', 12, 2029, CAST(N'2029-12-31' AS Date), CAST(N'2030-01-31' AS Date), CAST(N'2030-02-28' AS Date), CAST(N'2029-11-30' AS Date), N'December 2029', 202912, N'Q4', N'S2', 20291231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-01-31' AS Date), N'1/2030', N'January', 1, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-02-28' AS Date), CAST(N'2030-03-31' AS Date), CAST(N'2029-12-31' AS Date), N'January 2030', 203001, N'Q1', N'S1', 20300131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-02-28' AS Date), N'2/2030', N'February', 2, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-03-28' AS Date), CAST(N'2030-04-28' AS Date), CAST(N'2030-01-28' AS Date), N'February 2030', 203002, N'Q1', N'S1', 20300228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-03-31' AS Date), N'3/2030', N'March', 3, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-04-30' AS Date), CAST(N'2030-05-31' AS Date), CAST(N'2030-02-28' AS Date), N'March 2030', 203003, N'Q1', N'S1', 20300331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-04-30' AS Date), N'4/2030', N'April', 4, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-05-30' AS Date), CAST(N'2030-06-30' AS Date), CAST(N'2030-03-30' AS Date), N'April 2030', 203004, N'Q2', N'S1', 20300430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-05-31' AS Date), N'5/2030', N'May', 5, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-06-30' AS Date), CAST(N'2030-07-31' AS Date), CAST(N'2030-04-30' AS Date), N'May 2030', 203005, N'Q2', N'S1', 20300531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-06-30' AS Date), N'6/2030', N'June', 6, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-07-30' AS Date), CAST(N'2030-08-30' AS Date), CAST(N'2030-05-30' AS Date), N'June 2030', 203006, N'Q2', N'S1', 20300630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-07-31' AS Date), N'7/2030', N'July', 7, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-08-31' AS Date), CAST(N'2030-09-30' AS Date), CAST(N'2030-06-30' AS Date), N'July 2030', 203007, N'Q3', N'S2', 20300731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-08-31' AS Date), N'8/2030', N'August', 8, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-09-30' AS Date), CAST(N'2030-10-31' AS Date), CAST(N'2030-07-31' AS Date), N'August 2030', 203008, N'Q3', N'S2', 20300831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-09-30' AS Date), N'9/2030', N'September', 9, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-10-30' AS Date), CAST(N'2030-11-30' AS Date), CAST(N'2030-08-30' AS Date), N'September 2030', 203009, N'Q3', N'S2', 20300930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-10-31' AS Date), N'10/2030', N'October', 10, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-11-30' AS Date), CAST(N'2030-12-31' AS Date), CAST(N'2030-09-30' AS Date), N'October 2030', 203010, N'Q4', N'S2', 20301031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-11-30' AS Date), N'11/2030', N'November', 11, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2030-12-30' AS Date), CAST(N'2031-01-30' AS Date), CAST(N'2030-10-30' AS Date), N'November 2030', 203011, N'Q4', N'S2', 20301130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2030-12-31' AS Date), N'12/2030', N'December', 12, 2030, CAST(N'2030-12-31' AS Date), CAST(N'2031-01-31' AS Date), CAST(N'2031-02-28' AS Date), CAST(N'2030-11-30' AS Date), N'December 2030', 203012, N'Q4', N'S2', 20301231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-01-31' AS Date), N'1/2031', N'January', 1, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-02-28' AS Date), CAST(N'2031-03-31' AS Date), CAST(N'2030-12-31' AS Date), N'January 2031', 203101, N'Q1', N'S1', 20310131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-02-28' AS Date), N'2/2031', N'February', 2, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-03-28' AS Date), CAST(N'2031-04-28' AS Date), CAST(N'2031-01-28' AS Date), N'February 2031', 203102, N'Q1', N'S1', 20310228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-03-31' AS Date), N'3/2031', N'March', 3, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-04-30' AS Date), CAST(N'2031-05-31' AS Date), CAST(N'2031-02-28' AS Date), N'March 2031', 203103, N'Q1', N'S1', 20310331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-04-30' AS Date), N'4/2031', N'April', 4, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-05-30' AS Date), CAST(N'2031-06-30' AS Date), CAST(N'2031-03-30' AS Date), N'April 2031', 203104, N'Q2', N'S1', 20310430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-05-31' AS Date), N'5/2031', N'May', 5, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-06-30' AS Date), CAST(N'2031-07-31' AS Date), CAST(N'2031-04-30' AS Date), N'May 2031', 203105, N'Q2', N'S1', 20310531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-06-30' AS Date), N'6/2031', N'June', 6, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-07-30' AS Date), CAST(N'2031-08-30' AS Date), CAST(N'2031-05-30' AS Date), N'June 2031', 203106, N'Q2', N'S1', 20310630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-07-31' AS Date), N'7/2031', N'July', 7, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-08-31' AS Date), CAST(N'2031-09-30' AS Date), CAST(N'2031-06-30' AS Date), N'July 2031', 203107, N'Q3', N'S2', 20310731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-08-31' AS Date), N'8/2031', N'August', 8, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-09-30' AS Date), CAST(N'2031-10-31' AS Date), CAST(N'2031-07-31' AS Date), N'August 2031', 203108, N'Q3', N'S2', 20310831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-09-30' AS Date), N'9/2031', N'September', 9, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-10-30' AS Date), CAST(N'2031-11-30' AS Date), CAST(N'2031-08-30' AS Date), N'September 2031', 203109, N'Q3', N'S2', 20310930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-10-31' AS Date), N'10/2031', N'October', 10, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-11-30' AS Date), CAST(N'2031-12-31' AS Date), CAST(N'2031-09-30' AS Date), N'October 2031', 203110, N'Q4', N'S2', 20311031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-11-30' AS Date), N'11/2031', N'November', 11, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2031-12-30' AS Date), CAST(N'2032-01-30' AS Date), CAST(N'2031-10-30' AS Date), N'November 2031', 203111, N'Q4', N'S2', 20311130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2031-12-31' AS Date), N'12/2031', N'December', 12, 2031, CAST(N'2031-12-31' AS Date), CAST(N'2032-01-31' AS Date), CAST(N'2032-02-29' AS Date), CAST(N'2031-11-30' AS Date), N'December 2031', 203112, N'Q4', N'S2', 20311231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-01-31' AS Date), N'1/2032', N'January', 1, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-02-29' AS Date), CAST(N'2032-03-31' AS Date), CAST(N'2031-12-31' AS Date), N'January 2032', 203201, N'Q1', N'S1', 20320131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-02-29' AS Date), N'2/2032', N'February', 2, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-03-29' AS Date), CAST(N'2032-04-29' AS Date), CAST(N'2032-01-29' AS Date), N'February 2032', 203202, N'Q1', N'S1', 20320229)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-03-31' AS Date), N'3/2032', N'March', 3, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-04-30' AS Date), CAST(N'2032-05-31' AS Date), CAST(N'2032-02-29' AS Date), N'March 2032', 203203, N'Q1', N'S1', 20320331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-04-30' AS Date), N'4/2032', N'April', 4, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-05-30' AS Date), CAST(N'2032-06-30' AS Date), CAST(N'2032-03-30' AS Date), N'April 2032', 203204, N'Q2', N'S1', 20320430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-05-31' AS Date), N'5/2032', N'May', 5, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-06-30' AS Date), CAST(N'2032-07-31' AS Date), CAST(N'2032-04-30' AS Date), N'May 2032', 203205, N'Q2', N'S1', 20320531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-06-30' AS Date), N'6/2032', N'June', 6, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-07-30' AS Date), CAST(N'2032-08-30' AS Date), CAST(N'2032-05-30' AS Date), N'June 2032', 203206, N'Q2', N'S1', 20320630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-07-31' AS Date), N'7/2032', N'July', 7, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-08-31' AS Date), CAST(N'2032-09-30' AS Date), CAST(N'2032-06-30' AS Date), N'July 2032', 203207, N'Q3', N'S2', 20320731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-08-31' AS Date), N'8/2032', N'August', 8, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-09-30' AS Date), CAST(N'2032-10-31' AS Date), CAST(N'2032-07-31' AS Date), N'August 2032', 203208, N'Q3', N'S2', 20320831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-09-30' AS Date), N'9/2032', N'September', 9, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-10-30' AS Date), CAST(N'2032-11-30' AS Date), CAST(N'2032-08-30' AS Date), N'September 2032', 203209, N'Q3', N'S2', 20320930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-10-31' AS Date), N'10/2032', N'October', 10, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-11-30' AS Date), CAST(N'2032-12-31' AS Date), CAST(N'2032-09-30' AS Date), N'October 2032', 203210, N'Q4', N'S2', 20321031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-11-30' AS Date), N'11/2032', N'November', 11, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2032-12-30' AS Date), CAST(N'2033-01-30' AS Date), CAST(N'2032-10-30' AS Date), N'November 2032', 203211, N'Q4', N'S2', 20321130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2032-12-31' AS Date), N'12/2032', N'December', 12, 2032, CAST(N'2032-12-31' AS Date), CAST(N'2033-01-31' AS Date), CAST(N'2033-02-28' AS Date), CAST(N'2032-11-30' AS Date), N'December 2032', 203212, N'Q4', N'S2', 20321231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-01-31' AS Date), N'1/2033', N'January', 1, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-02-28' AS Date), CAST(N'2033-03-31' AS Date), CAST(N'2032-12-31' AS Date), N'January 2033', 203301, N'Q1', N'S1', 20330131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-02-28' AS Date), N'2/2033', N'February', 2, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-03-28' AS Date), CAST(N'2033-04-28' AS Date), CAST(N'2033-01-28' AS Date), N'February 2033', 203302, N'Q1', N'S1', 20330228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-03-31' AS Date), N'3/2033', N'March', 3, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-04-30' AS Date), CAST(N'2033-05-31' AS Date), CAST(N'2033-02-28' AS Date), N'March 2033', 203303, N'Q1', N'S1', 20330331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-04-30' AS Date), N'4/2033', N'April', 4, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-05-30' AS Date), CAST(N'2033-06-30' AS Date), CAST(N'2033-03-30' AS Date), N'April 2033', 203304, N'Q2', N'S1', 20330430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-05-31' AS Date), N'5/2033', N'May', 5, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-06-30' AS Date), CAST(N'2033-07-31' AS Date), CAST(N'2033-04-30' AS Date), N'May 2033', 203305, N'Q2', N'S1', 20330531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-06-30' AS Date), N'6/2033', N'June', 6, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-07-30' AS Date), CAST(N'2033-08-30' AS Date), CAST(N'2033-05-30' AS Date), N'June 2033', 203306, N'Q2', N'S1', 20330630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-07-31' AS Date), N'7/2033', N'July', 7, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-08-31' AS Date), CAST(N'2033-09-30' AS Date), CAST(N'2033-06-30' AS Date), N'July 2033', 203307, N'Q3', N'S2', 20330731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-08-31' AS Date), N'8/2033', N'August', 8, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-09-30' AS Date), CAST(N'2033-10-31' AS Date), CAST(N'2033-07-31' AS Date), N'August 2033', 203308, N'Q3', N'S2', 20330831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-09-30' AS Date), N'9/2033', N'September', 9, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-10-30' AS Date), CAST(N'2033-11-30' AS Date), CAST(N'2033-08-30' AS Date), N'September 2033', 203309, N'Q3', N'S2', 20330930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-10-31' AS Date), N'10/2033', N'October', 10, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-11-30' AS Date), CAST(N'2033-12-31' AS Date), CAST(N'2033-09-30' AS Date), N'October 2033', 203310, N'Q4', N'S2', 20331031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-11-30' AS Date), N'11/2033', N'November', 11, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2033-12-30' AS Date), CAST(N'2034-01-30' AS Date), CAST(N'2033-10-30' AS Date), N'November 2033', 203311, N'Q4', N'S2', 20331130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2033-12-31' AS Date), N'12/2033', N'December', 12, 2033, CAST(N'2033-12-31' AS Date), CAST(N'2034-01-31' AS Date), CAST(N'2034-02-28' AS Date), CAST(N'2033-11-30' AS Date), N'December 2033', 203312, N'Q4', N'S2', 20331231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-01-31' AS Date), N'1/2034', N'January', 1, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-02-28' AS Date), CAST(N'2034-03-31' AS Date), CAST(N'2033-12-31' AS Date), N'January 2034', 203401, N'Q1', N'S1', 20340131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-02-28' AS Date), N'2/2034', N'February', 2, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-03-28' AS Date), CAST(N'2034-04-28' AS Date), CAST(N'2034-01-28' AS Date), N'February 2034', 203402, N'Q1', N'S1', 20340228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-03-31' AS Date), N'3/2034', N'March', 3, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-04-30' AS Date), CAST(N'2034-05-31' AS Date), CAST(N'2034-02-28' AS Date), N'March 2034', 203403, N'Q1', N'S1', 20340331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-04-30' AS Date), N'4/2034', N'April', 4, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-05-30' AS Date), CAST(N'2034-06-30' AS Date), CAST(N'2034-03-30' AS Date), N'April 2034', 203404, N'Q2', N'S1', 20340430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-05-31' AS Date), N'5/2034', N'May', 5, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-06-30' AS Date), CAST(N'2034-07-31' AS Date), CAST(N'2034-04-30' AS Date), N'May 2034', 203405, N'Q2', N'S1', 20340531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-06-30' AS Date), N'6/2034', N'June', 6, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-07-30' AS Date), CAST(N'2034-08-30' AS Date), CAST(N'2034-05-30' AS Date), N'June 2034', 203406, N'Q2', N'S1', 20340630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-07-31' AS Date), N'7/2034', N'July', 7, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-08-31' AS Date), CAST(N'2034-09-30' AS Date), CAST(N'2034-06-30' AS Date), N'July 2034', 203407, N'Q3', N'S2', 20340731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-08-31' AS Date), N'8/2034', N'August', 8, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-09-30' AS Date), CAST(N'2034-10-31' AS Date), CAST(N'2034-07-31' AS Date), N'August 2034', 203408, N'Q3', N'S2', 20340831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-09-30' AS Date), N'9/2034', N'September', 9, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-10-30' AS Date), CAST(N'2034-11-30' AS Date), CAST(N'2034-08-30' AS Date), N'September 2034', 203409, N'Q3', N'S2', 20340930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-10-31' AS Date), N'10/2034', N'October', 10, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-11-30' AS Date), CAST(N'2034-12-31' AS Date), CAST(N'2034-09-30' AS Date), N'October 2034', 203410, N'Q4', N'S2', 20341031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-11-30' AS Date), N'11/2034', N'November', 11, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2034-12-30' AS Date), CAST(N'2035-01-30' AS Date), CAST(N'2034-10-30' AS Date), N'November 2034', 203411, N'Q4', N'S2', 20341130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2034-12-31' AS Date), N'12/2034', N'December', 12, 2034, CAST(N'2034-12-31' AS Date), CAST(N'2035-01-31' AS Date), CAST(N'2035-02-28' AS Date), CAST(N'2034-11-30' AS Date), N'December 2034', 203412, N'Q4', N'S2', 20341231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-01-31' AS Date), N'1/2035', N'January', 1, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-02-28' AS Date), CAST(N'2035-03-31' AS Date), CAST(N'2034-12-31' AS Date), N'January 2035', 203501, N'Q1', N'S1', 20350131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-02-28' AS Date), N'2/2035', N'February', 2, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-03-28' AS Date), CAST(N'2035-04-28' AS Date), CAST(N'2035-01-28' AS Date), N'February 2035', 203502, N'Q1', N'S1', 20350228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-03-31' AS Date), N'3/2035', N'March', 3, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-04-30' AS Date), CAST(N'2035-05-31' AS Date), CAST(N'2035-02-28' AS Date), N'March 2035', 203503, N'Q1', N'S1', 20350331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-04-30' AS Date), N'4/2035', N'April', 4, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-05-30' AS Date), CAST(N'2035-06-30' AS Date), CAST(N'2035-03-30' AS Date), N'April 2035', 203504, N'Q2', N'S1', 20350430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-05-31' AS Date), N'5/2035', N'May', 5, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-06-30' AS Date), CAST(N'2035-07-31' AS Date), CAST(N'2035-04-30' AS Date), N'May 2035', 203505, N'Q2', N'S1', 20350531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-06-30' AS Date), N'6/2035', N'June', 6, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-07-30' AS Date), CAST(N'2035-08-30' AS Date), CAST(N'2035-05-30' AS Date), N'June 2035', 203506, N'Q2', N'S1', 20350630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-07-31' AS Date), N'7/2035', N'July', 7, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-08-31' AS Date), CAST(N'2035-09-30' AS Date), CAST(N'2035-06-30' AS Date), N'July 2035', 203507, N'Q3', N'S2', 20350731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-08-31' AS Date), N'8/2035', N'August', 8, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-09-30' AS Date), CAST(N'2035-10-31' AS Date), CAST(N'2035-07-31' AS Date), N'August 2035', 203508, N'Q3', N'S2', 20350831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-09-30' AS Date), N'9/2035', N'September', 9, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-10-30' AS Date), CAST(N'2035-11-30' AS Date), CAST(N'2035-08-30' AS Date), N'September 2035', 203509, N'Q3', N'S2', 20350930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-10-31' AS Date), N'10/2035', N'October', 10, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-11-30' AS Date), CAST(N'2035-12-31' AS Date), CAST(N'2035-09-30' AS Date), N'October 2035', 203510, N'Q4', N'S2', 20351031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-11-30' AS Date), N'11/2035', N'November', 11, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2035-12-30' AS Date), CAST(N'2036-01-30' AS Date), CAST(N'2035-10-30' AS Date), N'November 2035', 203511, N'Q4', N'S2', 20351130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2035-12-31' AS Date), N'12/2035', N'December', 12, 2035, CAST(N'2035-12-31' AS Date), CAST(N'2036-01-31' AS Date), CAST(N'2036-02-29' AS Date), CAST(N'2035-11-30' AS Date), N'December 2035', 203512, N'Q4', N'S2', 20351231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-01-31' AS Date), N'1/2036', N'January', 1, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-02-29' AS Date), CAST(N'2036-03-31' AS Date), CAST(N'2035-12-31' AS Date), N'January 2036', 203601, N'Q1', N'S1', 20360131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-02-29' AS Date), N'2/2036', N'February', 2, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-03-29' AS Date), CAST(N'2036-04-29' AS Date), CAST(N'2036-01-29' AS Date), N'February 2036', 203602, N'Q1', N'S1', 20360229)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-03-31' AS Date), N'3/2036', N'March', 3, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-04-30' AS Date), CAST(N'2036-05-31' AS Date), CAST(N'2036-02-29' AS Date), N'March 2036', 203603, N'Q1', N'S1', 20360331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-04-30' AS Date), N'4/2036', N'April', 4, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-05-30' AS Date), CAST(N'2036-06-30' AS Date), CAST(N'2036-03-30' AS Date), N'April 2036', 203604, N'Q2', N'S1', 20360430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-05-31' AS Date), N'5/2036', N'May', 5, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-06-30' AS Date), CAST(N'2036-07-31' AS Date), CAST(N'2036-04-30' AS Date), N'May 2036', 203605, N'Q2', N'S1', 20360531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-06-30' AS Date), N'6/2036', N'June', 6, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-07-30' AS Date), CAST(N'2036-08-30' AS Date), CAST(N'2036-05-30' AS Date), N'June 2036', 203606, N'Q2', N'S1', 20360630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-07-31' AS Date), N'7/2036', N'July', 7, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-08-31' AS Date), CAST(N'2036-09-30' AS Date), CAST(N'2036-06-30' AS Date), N'July 2036', 203607, N'Q3', N'S2', 20360731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-08-31' AS Date), N'8/2036', N'August', 8, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-09-30' AS Date), CAST(N'2036-10-31' AS Date), CAST(N'2036-07-31' AS Date), N'August 2036', 203608, N'Q3', N'S2', 20360831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-09-30' AS Date), N'9/2036', N'September', 9, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-10-30' AS Date), CAST(N'2036-11-30' AS Date), CAST(N'2036-08-30' AS Date), N'September 2036', 203609, N'Q3', N'S2', 20360930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-10-31' AS Date), N'10/2036', N'October', 10, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-11-30' AS Date), CAST(N'2036-12-31' AS Date), CAST(N'2036-09-30' AS Date), N'October 2036', 203610, N'Q4', N'S2', 20361031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-11-30' AS Date), N'11/2036', N'November', 11, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2036-12-30' AS Date), CAST(N'2037-01-30' AS Date), CAST(N'2036-10-30' AS Date), N'November 2036', 203611, N'Q4', N'S2', 20361130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2036-12-31' AS Date), N'12/2036', N'December', 12, 2036, CAST(N'2036-12-31' AS Date), CAST(N'2037-01-31' AS Date), CAST(N'2037-02-28' AS Date), CAST(N'2036-11-30' AS Date), N'December 2036', 203612, N'Q4', N'S2', 20361231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-01-31' AS Date), N'1/2037', N'January', 1, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-02-28' AS Date), CAST(N'2037-03-31' AS Date), CAST(N'2036-12-31' AS Date), N'January 2037', 203701, N'Q1', N'S1', 20370131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-02-28' AS Date), N'2/2037', N'February', 2, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-03-28' AS Date), CAST(N'2037-04-28' AS Date), CAST(N'2037-01-28' AS Date), N'February 2037', 203702, N'Q1', N'S1', 20370228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-03-31' AS Date), N'3/2037', N'March', 3, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-04-30' AS Date), CAST(N'2037-05-31' AS Date), CAST(N'2037-02-28' AS Date), N'March 2037', 203703, N'Q1', N'S1', 20370331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-04-30' AS Date), N'4/2037', N'April', 4, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-05-30' AS Date), CAST(N'2037-06-30' AS Date), CAST(N'2037-03-30' AS Date), N'April 2037', 203704, N'Q2', N'S1', 20370430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-05-31' AS Date), N'5/2037', N'May', 5, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-06-30' AS Date), CAST(N'2037-07-31' AS Date), CAST(N'2037-04-30' AS Date), N'May 2037', 203705, N'Q2', N'S1', 20370531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-06-30' AS Date), N'6/2037', N'June', 6, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-07-30' AS Date), CAST(N'2037-08-30' AS Date), CAST(N'2037-05-30' AS Date), N'June 2037', 203706, N'Q2', N'S1', 20370630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-07-31' AS Date), N'7/2037', N'July', 7, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-08-31' AS Date), CAST(N'2037-09-30' AS Date), CAST(N'2037-06-30' AS Date), N'July 2037', 203707, N'Q3', N'S2', 20370731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-08-31' AS Date), N'8/2037', N'August', 8, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-09-30' AS Date), CAST(N'2037-10-31' AS Date), CAST(N'2037-07-31' AS Date), N'August 2037', 203708, N'Q3', N'S2', 20370831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-09-30' AS Date), N'9/2037', N'September', 9, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-10-30' AS Date), CAST(N'2037-11-30' AS Date), CAST(N'2037-08-30' AS Date), N'September 2037', 203709, N'Q3', N'S2', 20370930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-10-31' AS Date), N'10/2037', N'October', 10, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-11-30' AS Date), CAST(N'2037-12-31' AS Date), CAST(N'2037-09-30' AS Date), N'October 2037', 203710, N'Q4', N'S2', 20371031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-11-30' AS Date), N'11/2037', N'November', 11, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2037-12-30' AS Date), CAST(N'2038-01-30' AS Date), CAST(N'2037-10-30' AS Date), N'November 2037', 203711, N'Q4', N'S2', 20371130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2037-12-31' AS Date), N'12/2037', N'December', 12, 2037, CAST(N'2037-12-31' AS Date), CAST(N'2038-01-31' AS Date), CAST(N'2038-02-28' AS Date), CAST(N'2037-11-30' AS Date), N'December 2037', 203712, N'Q4', N'S2', 20371231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-01-31' AS Date), N'1/2038', N'January', 1, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-02-28' AS Date), CAST(N'2038-03-31' AS Date), CAST(N'2037-12-31' AS Date), N'January 2038', 203801, N'Q1', N'S1', 20380131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-02-28' AS Date), N'2/2038', N'February', 2, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-03-28' AS Date), CAST(N'2038-04-28' AS Date), CAST(N'2038-01-28' AS Date), N'February 2038', 203802, N'Q1', N'S1', 20380228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-03-31' AS Date), N'3/2038', N'March', 3, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-04-30' AS Date), CAST(N'2038-05-31' AS Date), CAST(N'2038-02-28' AS Date), N'March 2038', 203803, N'Q1', N'S1', 20380331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-04-30' AS Date), N'4/2038', N'April', 4, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-05-30' AS Date), CAST(N'2038-06-30' AS Date), CAST(N'2038-03-30' AS Date), N'April 2038', 203804, N'Q2', N'S1', 20380430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-05-31' AS Date), N'5/2038', N'May', 5, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-06-30' AS Date), CAST(N'2038-07-31' AS Date), CAST(N'2038-04-30' AS Date), N'May 2038', 203805, N'Q2', N'S1', 20380531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-06-30' AS Date), N'6/2038', N'June', 6, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-07-30' AS Date), CAST(N'2038-08-30' AS Date), CAST(N'2038-05-30' AS Date), N'June 2038', 203806, N'Q2', N'S1', 20380630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-07-31' AS Date), N'7/2038', N'July', 7, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-08-31' AS Date), CAST(N'2038-09-30' AS Date), CAST(N'2038-06-30' AS Date), N'July 2038', 203807, N'Q3', N'S2', 20380731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-08-31' AS Date), N'8/2038', N'August', 8, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-09-30' AS Date), CAST(N'2038-10-31' AS Date), CAST(N'2038-07-31' AS Date), N'August 2038', 203808, N'Q3', N'S2', 20380831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-09-30' AS Date), N'9/2038', N'September', 9, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-10-30' AS Date), CAST(N'2038-11-30' AS Date), CAST(N'2038-08-30' AS Date), N'September 2038', 203809, N'Q3', N'S2', 20380930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-10-31' AS Date), N'10/2038', N'October', 10, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-11-30' AS Date), CAST(N'2038-12-31' AS Date), CAST(N'2038-09-30' AS Date), N'October 2038', 203810, N'Q4', N'S2', 20381031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-11-30' AS Date), N'11/2038', N'November', 11, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2038-12-30' AS Date), CAST(N'2039-01-30' AS Date), CAST(N'2038-10-30' AS Date), N'November 2038', 203811, N'Q4', N'S2', 20381130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2038-12-31' AS Date), N'12/2038', N'December', 12, 2038, CAST(N'2038-12-31' AS Date), CAST(N'2039-01-31' AS Date), CAST(N'2039-02-28' AS Date), CAST(N'2038-11-30' AS Date), N'December 2038', 203812, N'Q4', N'S2', 20381231)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-01-31' AS Date), N'1/2039', N'January', 1, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-02-28' AS Date), CAST(N'2039-03-31' AS Date), CAST(N'2038-12-31' AS Date), N'January 2039', 203901, N'Q1', N'S1', 20390131)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-02-28' AS Date), N'2/2039', N'February', 2, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-03-28' AS Date), CAST(N'2039-04-28' AS Date), CAST(N'2039-01-28' AS Date), N'February 2039', 203902, N'Q1', N'S1', 20390228)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-03-31' AS Date), N'3/2039', N'March', 3, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-04-30' AS Date), CAST(N'2039-05-31' AS Date), CAST(N'2039-02-28' AS Date), N'March 2039', 203903, N'Q1', N'S1', 20390331)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-04-30' AS Date), N'4/2039', N'April', 4, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-05-30' AS Date), CAST(N'2039-06-30' AS Date), CAST(N'2039-03-30' AS Date), N'April 2039', 203904, N'Q2', N'S1', 20390430)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-05-31' AS Date), N'5/2039', N'May', 5, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-06-30' AS Date), CAST(N'2039-07-31' AS Date), CAST(N'2039-04-30' AS Date), N'May 2039', 203905, N'Q2', N'S1', 20390531)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-06-30' AS Date), N'6/2039', N'June', 6, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-07-30' AS Date), CAST(N'2039-08-30' AS Date), CAST(N'2039-05-30' AS Date), N'June 2039', 203906, N'Q2', N'S1', 20390630)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-07-31' AS Date), N'7/2039', N'July', 7, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-08-31' AS Date), CAST(N'2039-09-30' AS Date), CAST(N'2039-06-30' AS Date), N'July 2039', 203907, N'Q3', N'S2', 20390731)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-08-31' AS Date), N'8/2039', N'August', 8, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-09-30' AS Date), CAST(N'2039-10-31' AS Date), CAST(N'2039-07-31' AS Date), N'August 2039', 203908, N'Q3', N'S2', 20390831)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-09-30' AS Date), N'9/2039', N'September', 9, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-10-30' AS Date), CAST(N'2039-11-30' AS Date), CAST(N'2039-08-30' AS Date), N'September 2039', 203909, N'Q3', N'S2', 20390930)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-10-31' AS Date), N'10/2039', N'October', 10, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-11-30' AS Date), CAST(N'2039-12-31' AS Date), CAST(N'2039-09-30' AS Date), N'October 2039', 203910, N'Q4', N'S2', 20391031)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-11-30' AS Date), N'11/2039', N'November', 11, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2039-12-30' AS Date), CAST(N'2040-01-30' AS Date), CAST(N'2039-10-30' AS Date), N'November 2039', 203911, N'Q4', N'S2', 20391130)
GO
INSERT [dbo].[Calendar] ([DateValue], [Date], [Month], [MonthNo], [Year], [EOY], [M+1], [M+2], [M-1], [MonthYear], [YearMonth], [Quarter], [Semester], [DateKey]) VALUES (CAST(N'2039-12-31' AS Date), N'12/2039', N'December', 12, 2039, CAST(N'2039-12-31' AS Date), CAST(N'2040-01-31' AS Date), CAST(N'2040-02-29' AS Date), CAST(N'2039-11-30' AS Date), N'December 2039', 203912, N'Q4', N'S2', 20391231)
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00524', 112022, CAST(325421.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00525', 122022, CAST(0.000000 AS Decimal(23, 6)), CAST(325421.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00526', 42023, CAST(324008.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00527', 52023, CAST(325409.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00528', 62023, CAST(325410.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00529', 62023, CAST(325414.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00530', 122023, CAST(0.000000 AS Decimal(23, 6)), CAST(684694.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00531', 122023, CAST(1047567.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00532', 22024, CAST(1047567.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00533', 32024, CAST(1047009.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00534', 32024, CAST(1047051.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00550', 122022, CAST(476802.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00551', 32023, CAST(0.000000 AS Decimal(23, 6)), CAST(476802.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00552', 62023, CAST(476955.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00553', 72023, CAST(477000.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00554', 122023, CAST(477111.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00555', 122023, CAST(480000.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00300', 122022, CAST(30000.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00301', 62023, CAST(0.000000 AS Decimal(23, 6)), CAST(301000.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[F_Sales] ([Invoice_Key], [Period_Key], [ACT], [RMN]) VALUES (N'IN00302', 122023, CAST(302000.000000 AS Decimal(23, 6)), CAST(0.000000 AS Decimal(23, 6)))
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00300', N'0061P3300', N'0063P', N'INVOICE_300')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00301', N'0061P3301', N'0063P', N'INVOICE_301')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00302', N'0061P3302', N'0063P', N'INVOICE_302')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00524', N'0061P0038', N'0061P', N'INVOICE_524')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00525', N'0061P0039', N'0061P', N'INVOICE_525')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00526', N'0061P0040', N'0061P', N'INVOICE_526')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00527', N'0061P0041', N'0061P', N'INVOICE_527')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00528', N'0061P0042', N'0061P', N'INVOICE_528')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00529', N'0061P0043', N'0061P', N'INVOICE_529')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00530', N'0061P0044', N'0061P', N'INVOICE_530')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00531', N'0061P0045', N'0061P', N'INVOICE_531')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00532', N'0061P0046', N'0061P', N'INVOICE_532')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00533', N'0061P0047', N'0061P', N'INVOICE_533')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00534', N'0061P0048', N'0061P', N'INVOICE_534')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00550', N'0061P0050', N'0062P', N'INVOICE_550')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00551', N'0061P0051', N'0062P', N'INVOICE_551')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00552', N'0061P0052', N'0062P', N'INVOICE_552')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00553', N'0061P0053', N'0062P', N'INVOICE_553')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00554', N'0061P0054', N'0062P', N'INVOICE_554')
GO
INSERT [dbo].[Invoice] ([Invoice_Key], [ProductLine_Key], [Prd_Key], [Invoice_Code]) VALUES (N'IN00555', N'0061P0055', N'0062P', N'INVOICE_555')
GO
INSERT [dbo].[Product] ([Prd_Key], [Prd_Code], [Sub_Key]) VALUES (N'0061P', N'PRD_1', N'S001')
GO
INSERT [dbo].[Product] ([Prd_Key], [Prd_Code], [Sub_Key]) VALUES (N'0062P', N'PRD_2', N'S001')
GO
INSERT [dbo].[Product] ([Prd_Key], [Prd_Code], [Sub_Key]) VALUES (N'0063P', N'PRD_3', N'S002')
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0038', N'0061P', N'SIT_3', N'0061P0038_PRD_1', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0039', N'0061P', N'SIT_3', N'0061P0039_PRD_1', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0040', N'0061P', N'SIT_1', N'0061P0040_PRD_1', CAST(N'2023-04-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0041', N'0061P', N'SIT_1', N'0061P0041_PRD_1', CAST(N'2023-04-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0042', N'0061P', N'SIT_2', N'0061P0042_PRD_1', CAST(N'2023-06-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0043', N'0061P', N'SIT_ACT', N'0061P0043_PRD_1', CAST(N'2023-07-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0044', N'0061P', N'SIT_ACT', N'0061P0044_PRD_1', CAST(N'2023-12-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0045', N'0061P', N'SIT_ACT', N'0061P0045_PRD_1', CAST(N'2024-01-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0046', N'0061P', N'SIT_ACT', N'0061P0046_PRD_1', CAST(N'2024-01-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0047', N'0061P', N'SIT_1', N'0061P0047_PRD_1', CAST(N'2024-03-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0048', N'0061P', N'SIT_ACT', N'0061P0048_PRD_1', CAST(N'2024-04-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0050', N'0062P', N'POS_1', N'0061P0050_PRD_2', CAST(N'2022-12-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0051', N'0062P', N'POS_1', N'0061P0051_PRD_2', CAST(N'2023-03-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0052', N'0062P', N'POS_2', N'0061P0052_PRD_2', CAST(N'2023-07-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0053', N'0062P', N'POS_2', N'0061P0053_PRD_2', CAST(N'2023-10-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0054', N'0062P', N'POS_3', N'0061P0054_PRD_2', CAST(N'2023-11-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P0055', N'0062P', N'POS_ACT', N'0061P0055_PRD_2', CAST(N'2023-12-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P3300', N'0063P', N'SIT_1', N'0061P3300_PRD3', CAST(N'2022-06-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P3301', N'0063P', N'SIT_2', N'0061P3301_PRD3', CAST(N'2024-06-01' AS Date))
GO
INSERT [dbo].[ProductLine] ([ProductLine_Key], [Prd_Key], [ProductLine_Type], [ProductLine_Code], [ProductLine_Date]) VALUES (N'0061P3302', N'0063P', N'SIT_3', N'0061P3302_PRD3', CAST(N'2024-03-01' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100237, N'0061P0038', N'SIT', CAST(N'2022-10-05' AS Date), 202210)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100238, N'0061P0039', N'SIT', CAST(N'2022-11-07' AS Date), 202211)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100239, N'0061P0040', N'SIT', CAST(N'2023-03-03' AS Date), 202303)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100240, N'0061P0041', N'SIT', CAST(N'2023-04-05' AS Date), 202304)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100241, N'0061P0042', N'SIT', CAST(N'2023-05-11' AS Date), 202305)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100242, N'0061P0043', N'SIT', CAST(N'2023-06-18' AS Date), 202306)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100243, N'0061P0044', N'SIT', CAST(N'2023-11-25' AS Date), 202311)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100244, N'0061P0045', N'SIT', CAST(N'2023-12-02' AS Date), 202312)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100245, N'0061P0046', N'SIT', CAST(N'2024-01-30' AS Date), 202401)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100246, N'0061P0047', N'SIT', CAST(N'2024-02-20' AS Date), 202402)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100247, N'0061P0048', N'SIT', CAST(N'2024-03-16' AS Date), 202403)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100250, N'0061P0050', N'POS', CAST(N'2022-11-12' AS Date), 202211)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100251, N'0061P0051', N'POS', CAST(N'2023-01-15' AS Date), 202301)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100252, N'0061P0052', N'POS', CAST(N'2023-04-03' AS Date), 202304)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100253, N'0061P0053', N'POS', CAST(N'2023-06-19' AS Date), 202306)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100254, N'0061P0054', N'POS', CAST(N'2023-09-27' AS Date), 202309)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100255, N'0061P0055', N'POS', CAST(N'2024-01-16' AS Date), 202401)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100300, N'0061P3300', N'SIT', CAST(N'2022-11-11' AS Date), 202211)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100301, N'0061P3301', N'SIT', CAST(N'2023-06-06' AS Date), 202306)
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date], [SituationDate_key]) VALUES (100302, N'0061P3302', N'SIT', CAST(N'2024-03-03' AS Date), 202403)
GO
INSERT [dbo].[Sub] ([Sub_Key], [Sub_Code]) VALUES (N'S001', N'Sub_1')
GO
INSERT [dbo].[Sub] ([Sub_Key], [Sub_Code]) VALUES (N'S002', N'Sub_2')
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_F_Finance_ActivityBaseline]') AND parent_object_id = OBJECT_ID(N'[dbo].[F_Sales]'))
ALTER TABLE [dbo].[F_Sales]  WITH CHECK ADD  CONSTRAINT [FK_F_Finance_ActivityBaseline] FOREIGN KEY([Invoice_Key])
REFERENCES [dbo].[Invoice] ([Invoice_Key])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_F_Finance_ActivityBaseline]') AND parent_object_id = OBJECT_ID(N'[dbo].[F_Sales]'))
ALTER TABLE [dbo].[F_Sales] CHECK CONSTRAINT [FK_F_Finance_ActivityBaseline]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActivityBaseline_PUBaseline]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_ActivityBaseline_PUBaseline] FOREIGN KEY([ProductLine_Key])
REFERENCES [dbo].[ProductLine] ([ProductLine_Key])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActivityBaseline_PUBaseline]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_ActivityBaseline_PUBaseline]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PUBaseline_PU]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductLine]'))
ALTER TABLE [dbo].[ProductLine]  WITH CHECK ADD  CONSTRAINT [FK_PUBaseline_PU] FOREIGN KEY([Prd_Key])
REFERENCES [dbo].[Product] ([Prd_Key])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PUBaseline_PU]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductLine]'))
ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [FK_PUBaseline_PU]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SituationBaseline_PUBaseline]') AND parent_object_id = OBJECT_ID(N'[dbo].[Situation]'))
ALTER TABLE [dbo].[Situation]  WITH CHECK ADD  CONSTRAINT [FK_SituationBaseline_PUBaseline] FOREIGN KEY([ProductLine_Key])
REFERENCES [dbo].[ProductLine] ([ProductLine_Key])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SituationBaseline_PUBaseline]') AND parent_object_id = OBJECT_ID(N'[dbo].[Situation]'))
ALTER TABLE [dbo].[Situation] CHECK CONSTRAINT [FK_SituationBaseline_PUBaseline]
GO
