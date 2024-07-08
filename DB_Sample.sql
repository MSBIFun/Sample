USE [SAMPLE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Situation]') AND type in (N'U'))
ALTER TABLE [dbo].[Situation] DROP CONSTRAINT IF EXISTS [FK_SituationBaseline_PUBaseline]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductLine]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductLine] DROP CONSTRAINT IF EXISTS [FK_PUBaseline_PU]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND type in (N'U'))
ALTER TABLE [dbo].[Invoice] DROP CONSTRAINT IF EXISTS [FK_ActivityBaseline_PUBaseline]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Sales]') AND type in (N'U'))
ALTER TABLE [dbo].[F_Sales] DROP CONSTRAINT IF EXISTS [FK_F_Finance_ActivityBaseline]
GO
/****** Object:  Table [dbo].[Situation]    Script Date: 08/07/2024 02:15:35 ******/
DROP TABLE IF EXISTS [dbo].[Situation]
GO
/****** Object:  Table [dbo].[ProductLine]    Script Date: 08/07/2024 02:15:35 ******/
DROP TABLE IF EXISTS [dbo].[ProductLine]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08/07/2024 02:15:35 ******/
DROP TABLE IF EXISTS [dbo].[Product]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 08/07/2024 02:15:35 ******/
DROP TABLE IF EXISTS [dbo].[Invoice]
GO
/****** Object:  Table [dbo].[F_Sales]    Script Date: 08/07/2024 02:15:35 ******/
DROP TABLE IF EXISTS [dbo].[F_Sales]
GO
/****** Object:  Table [dbo].[F_Sales]    Script Date: 08/07/2024 02:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Sales](
	[Invoice_Key] [varchar](20) NULL,
	[Period_Key] [int] NULL,
	[ACT] [decimal](23, 6) NULL,
	[RMN] [decimal](23, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 08/07/2024 02:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08/07/2024 02:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Prd_Key] [varchar](20) NOT NULL,
	[Prd_Code] [varchar](255) NULL,
 CONSTRAINT [PK_PU] PRIMARY KEY CLUSTERED 
(
	[Prd_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLine]    Script Date: 08/07/2024 02:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Situation]    Script Date: 08/07/2024 02:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Situation](
	[Situation_Key] [int] NOT NULL,
	[ProductLine_Key] [varchar](20) NULL,
	[Situation_Type] [varchar](20) NULL,
	[Situation_Date] [date] NULL,
 CONSTRAINT [PK_SituationBaseline] PRIMARY KEY CLUSTERED 
(
	[Situation_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
INSERT [dbo].[Product] ([Prd_Key], [Prd_Code]) VALUES (N'0061P', N'PRD_1')
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
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100237, N'0061P0038', N'SIT', CAST(N'2022-10-05' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100238, N'0061P0039', N'SIT', CAST(N'2022-11-07' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100239, N'0061P0040', N'SIT', CAST(N'2023-03-03' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100240, N'0061P0041', N'SIT', CAST(N'2023-04-05' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100241, N'0061P0042', N'SIT', CAST(N'2023-05-11' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100242, N'0061P0043', N'SIT', CAST(N'2023-06-18' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100243, N'0061P0044', N'SIT', CAST(N'2023-11-25' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100244, N'0061P0045', N'SIT', CAST(N'2023-12-02' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100245, N'0061P0046', N'SIT', CAST(N'2024-01-30' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100246, N'0061P0047', N'SIT', CAST(N'2024-02-20' AS Date))
GO
INSERT [dbo].[Situation] ([Situation_Key], [ProductLine_Key], [Situation_Type], [Situation_Date]) VALUES (100247, N'0061P0048', N'SIT', CAST(N'2024-03-16' AS Date))
GO
ALTER TABLE [dbo].[F_Sales]  WITH CHECK ADD  CONSTRAINT [FK_F_Finance_ActivityBaseline] FOREIGN KEY([Invoice_Key])
REFERENCES [dbo].[Invoice] ([Invoice_Key])
GO
ALTER TABLE [dbo].[F_Sales] CHECK CONSTRAINT [FK_F_Finance_ActivityBaseline]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_ActivityBaseline_PUBaseline] FOREIGN KEY([ProductLine_Key])
REFERENCES [dbo].[ProductLine] ([ProductLine_Key])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_ActivityBaseline_PUBaseline]
GO
ALTER TABLE [dbo].[ProductLine]  WITH CHECK ADD  CONSTRAINT [FK_PUBaseline_PU] FOREIGN KEY([Prd_Key])
REFERENCES [dbo].[Product] ([Prd_Key])
GO
ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [FK_PUBaseline_PU]
GO
ALTER TABLE [dbo].[Situation]  WITH CHECK ADD  CONSTRAINT [FK_SituationBaseline_PUBaseline] FOREIGN KEY([ProductLine_Key])
REFERENCES [dbo].[ProductLine] ([ProductLine_Key])
GO
ALTER TABLE [dbo].[Situation] CHECK CONSTRAINT [FK_SituationBaseline_PUBaseline]
GO
