USE [SCADA]
GO
/****** Object:  Table [dbo].[Argument]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Argument](
	[DriverID] [smallint] NOT NULL,
	[PropertyName] [varchar](50) NOT NULL,
	[PropertyValue] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dictionary]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dictionary](
	[DictType] [varchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log_Alarm]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_Alarm](
	[StartTime] [datetime] NULL,
	[Source] [nvarchar](50) NULL,
	[ConditionID] [int] NULL,
	[AlarmText] [nvarchar](128) NULL,
	[AlarmValue] [sql_variant] NULL,
	[Duration] [int] NULL,
	[Severity] [int] NULL,
	[SubAlarmType] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log_Event]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_Event](
	[EventType] [int] NULL,
	[Severity] [int] NULL,
	[IsAcked] [bit] NULL CONSTRAINT [DF_Log_Event_IsAcked]  DEFAULT ((0)),
	[ActiveTime] [datetime] NULL,
	[Source] [nvarchar](50) NULL,
	[Comment] [nvarchar](50) NULL,
	[SQLCounter] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log_HData]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_HData](
	[ID] [smallint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Value] [real] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Membership]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Membership](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [smallint] NOT NULL CONSTRAINT [DF_Membership_Role]  DEFAULT ((0)),
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Membership] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Meta_Condition]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meta_Condition](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Source] [nvarchar](50) NOT NULL,
	[AlarmType] [int] NOT NULL,
	[EventType] [tinyint] NOT NULL,
	[ConditionType] [tinyint] NOT NULL,
	[Para] [real] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[DeadBand] [real] NOT NULL,
	[Delay] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
 CONSTRAINT [PK_Meta_Condition] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meta_Driver]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meta_Driver](
	[DriverID] [smallint] NOT NULL,
	[DriverType] [int] NOT NULL,
	[DriverName] [nvarchar](64) NOT NULL CONSTRAINT [DF_Meta_Device_DeviceName]  DEFAULT ('')
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meta_Group]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meta_Group](
	[GroupID] [smallint] NOT NULL,
	[DriverID] [smallint] NULL,
	[GroupName] [nvarchar](20) NULL,
	[UpdateRate] [int] NULL,
	[DeadBand] [real] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_M_Group_IsActive]  DEFAULT ((1))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meta_Scale]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meta_Scale](
	[ScaleID] [smallint] NOT NULL,
	[ScaleType] [tinyint] NOT NULL,
	[EUHi] [real] NULL,
	[EULo] [real] NULL,
	[RawHi] [real] NULL,
	[RawLo] [real] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meta_SubCondition]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meta_SubCondition](
	[ConditionID] [int] NOT NULL,
	[SubAlarmType] [int] NOT NULL,
	[Threshold] [real] NOT NULL,
	[Severity] [tinyint] NOT NULL,
	[Message] [nvarchar](250) NULL,
	[IsEnable] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meta_Tag]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Meta_Tag](
	[TagID] [smallint] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](512) NOT NULL,
	[DataType] [tinyint] NOT NULL,
	[DataSize] [smallint] NOT NULL CONSTRAINT [DF_TagMetaData_DataSize]  DEFAULT ((0)),
	[Address] [varchar](64) NOT NULL,
	[GroupID] [smallint] NOT NULL CONSTRAINT [DF_TagMetaData_GroupID]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TagMetaData_IsActived]  DEFAULT ((1)),
	[Archive] [bit] NOT NULL CONSTRAINT [DF_Meta_Tag_HasHDA]  DEFAULT ((0)),
	[DefaultValue] [sql_variant] NULL,
	[Description] [nvarchar](128) NULL,
	[Maximum] [real] NOT NULL CONSTRAINT [DF_Meta_Tag_Maximum]  DEFAULT ((0)),
	[Minimum] [real] NOT NULL CONSTRAINT [DF_Meta_Tag_Minimum]  DEFAULT ((0)),
	[Cycle] [int] NOT NULL CONSTRAINT [DF_Meta_Tag_Cycle]  DEFAULT ((0)),
	[RowVersion] [timestamp] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegisterModule]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegisterModule](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[AssemblyName] [nvarchar](255) NULL,
	[ClassName] [varchar](50) NULL,
	[ClassFullName] [varchar](128) NULL,
	[Description] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Argument] ([DriverID], [PropertyName], [PropertyValue]) VALUES (1, N'FileName', NULL)
INSERT [dbo].[Argument] ([DriverID], [PropertyName], [PropertyValue]) VALUES (1, N'ServerName', NULL)
INSERT [dbo].[Argument] ([DriverID], [PropertyName], [PropertyValue]) VALUES (1, N'TimeOut', N'240')
INSERT [dbo].[Dictionary] ([DictType], [Code], [Description]) VALUES (N'Team', N'0', N'甲班')
INSERT [dbo].[Dictionary] ([DictType], [Code], [Description]) VALUES (N'Team', N'1', N'乙班')
SET IDENTITY_INSERT [dbo].[Log_Event] ON 

INSERT [dbo].[Log_Event] ([EventType], [Severity], [IsAcked], [ActiveTime], [Source], [Comment], [SQLCounter]) VALUES (1, 0, 0, CAST(N'2015-03-06 16:49:57.000' AS DateTime), N'HW-PC\op', N'登录', 8)
INSERT [dbo].[Log_Event] ([EventType], [Severity], [IsAcked], [ActiveTime], [Source], [Comment], [SQLCounter]) VALUES (1, 0, 0, CAST(N'2015-03-06 16:51:43.000' AS DateTime), N'HW-PC\op', N'退出', 9)
INSERT [dbo].[Log_Event] ([EventType], [Severity], [IsAcked], [ActiveTime], [Source], [Comment], [SQLCounter]) VALUES (1, 0, 0, CAST(N'2015-03-06 16:58:57.000' AS DateTime), N'HW-PC\op', N'登录', 10)
INSERT [dbo].[Log_Event] ([EventType], [Severity], [IsAcked], [ActiveTime], [Source], [Comment], [SQLCounter]) VALUES (1, 0, 0, CAST(N'2015-03-06 16:59:07.000' AS DateTime), N'HW-PC\op', N'退出', 11)
INSERT [dbo].[Log_Event] ([EventType], [Severity], [IsAcked], [ActiveTime], [Source], [Comment], [SQLCounter]) VALUES (1, 0, 0, CAST(N'2015-03-06 16:59:26.000' AS DateTime), N'HW-PC\sbt', N'登录', 12)
INSERT [dbo].[Log_Event] ([EventType], [Severity], [IsAcked], [ActiveTime], [Source], [Comment], [SQLCounter]) VALUES (1, 0, 0, CAST(N'2015-03-06 17:01:21.000' AS DateTime), N'HW-PC\sbt', N'退出', 13)
SET IDENTITY_INSERT [dbo].[Log_Event] OFF
SET IDENTITY_INSERT [dbo].[Membership] ON 

INSERT [dbo].[Membership] ([ID], [UserName], [Password], [Role], [Email], [Phone]) VALUES (2, N'admin', N'c4ca4238a0b923820dcc509a6f75849b', 4, NULL, NULL)
INSERT [dbo].[Membership] ([ID], [UserName], [Password], [Role], [Email], [Phone]) VALUES (3, N'op', N'c4ca4238a0b923820dcc509a6f75849b', 1, NULL, NULL)
INSERT [dbo].[Membership] ([ID], [UserName], [Password], [Role], [Email], [Phone]) VALUES (4, N'everyone', N'c4ca4238a0b923820dcc509a6f75849b', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Membership] OFF
INSERT [dbo].[Meta_Driver] ([DriverID], [DriverType], [DriverName]) VALUES (1, 6, N'S1')
INSERT [dbo].[Meta_Driver] ([DriverID], [DriverType], [DriverName]) VALUES (6, 6, N'Data1')
INSERT [dbo].[Meta_Group] ([GroupID], [DriverID], [GroupName], [UpdateRate], [DeadBand], [IsActive]) VALUES (20001, 1, N'Receiving1', 300, 0, 1)
INSERT [dbo].[Meta_Group] ([GroupID], [DriverID], [GroupName], [UpdateRate], [DeadBand], [IsActive]) VALUES (20002, 1, N'Receiving2', 0, 0, 0)
INSERT [dbo].[Meta_Group] ([GroupID], [DriverID], [GroupName], [UpdateRate], [DeadBand], [IsActive]) VALUES (20000, 6, N'ReadOnly', 800, 0, 0)
SET IDENTITY_INSERT [dbo].[Meta_Tag] ON 

INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (2, N'Receiving1_AlmAck', 1, 1, N'Channel4.Receiving1.K0008.10', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (3, N'Receiving1_Conveyor3_Alarm', 1, 1, N'Channel4.Receiving1.K0006.14', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (4, N'Receiving1_Conveyor3_Running', 1, 1, N'Channel4.Receiving1.K0006.10', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (5, N'Receiving1_Conveyor4_Alarm', 1, 1, N'Channel4.Receiving1.K0001.04', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (6, N'Receiving1_Conveyor4_Running', 1, 1, N'Channel4.Receiving1.K0001.03', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (7, N'Receiving1_Conveyor5_Alarm', 1, 1, N'Channel4.Receiving1.K0008.00', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (8, N'Receiving1_Conveyor5_Running', 1, 1, N'Channel4.Receiving1.K0007.10', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (9, N'Receiving1_Conveyor6_Alarm', 1, 1, N'Channel4.Receiving1.K0008.08', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (10, N'Receiving1_Conveyor6_Running', 1, 1, N'Channel4.Receiving1.K0005.14', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (11, N'Receiving1_Conveyor7_Alarm', 1, 1, N'Channel4.Receiving1.K0006.13', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (12, N'Receiving1_Conveyor7_Running', 1, 1, N'Channel4.Receiving1.K0006.12', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (13, N'Receiving1_Conveyor8_Running', 1, 1, N'Channel4.Receiving1.K0001.12', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (14, N'Receiving1_Conveyor9_Alarm', 1, 1, N'Channel4.Receiving1.K0001.08', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (15, N'Receiving1_Conveyor9_Running', 1, 1, N'Channel4.Receiving1.K0001.08', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (16, N'Receiving1_DF01SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0002.06', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (17, N'Receiving1_DF01SQL_Alarm', 1, 1, N'Channel4.Receiving1.K0003.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (18, N'Receiving1_DF02SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0002.05', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (19, N'Receiving1_DF02SQL_Alarm', 1, 1, N'Channel4.Receiving1.K0003.03', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (20, N'Receiving1_DF03SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0002.04', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (21, N'Receiving1_DF03SQL_Alarm', 1, 1, N'Channel4.Receiving1.K0003.04', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (22, N'Receiving1_DF04SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0002.03', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (23, N'Receiving1_DF04SQL_Alarm', 1, 1, N'Channel4.Receiving1.K0003.05', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (24, N'Receiving1_DF05SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0002.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (25, N'Receiving1_DF05SQL_Alarm', 1, 1, N'Channel4.Receiving1.K0003.06', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (26, N'Receiving1_DF06SQL_Alarm', 1, 1, N'Channel4.Receiving1.K0002.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (27, N'Receiving1_F01SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0007.09', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (28, N'Receiving1_F02SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0007.08', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (29, N'Receiving1_F03SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0007.07', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (30, N'Receiving1_F04SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0007.06', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (31, N'Receiving1_F05SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0007.05', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (32, N'Receiving1_F06SQH_Alarm', 1, 1, N'Channel4.Receiving1.K0007.03', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (33, N'Receiving1_Fan1_Alarm', 1, 1, N'Channel4.Receiving1.K0008.07', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (34, N'Receiving1_Fan1_Running', 1, 1, N'Channel4.Receiving1.K0008.06', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (35, N'Receiving1_Fan2_Running', 1, 1, N'Channel4.Receiving1.K0008.07', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (36, N'Receiving1_Fan3_Running', 1, 1, N'Channel4.Receiving1.K0001.13', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (37, N'Receiving1_FourWays_Left', 1, 1, N'Channel4.Receiving1.K0006.08', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (38, N'Receiving1_FourWays_MID', 1, 1, N'Channel4.Receiving1.K0006.09', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (39, N'Receiving1_FourWays_Right', 1, 1, N'Channel4.Receiving1.K0006.15', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (40, N'Receiving1_Gate1_Ols', 1, 1, N'Channel4.Receiving1.K0000.01', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (41, N'Receiving1_Gate10_Alarm', 1, 1, N'Channel4.Receiving1.K0003.11', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (42, N'Receiving1_Gate10_Cls', 1, 1, N'Channel4.Receiving1.K0004.07', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (43, N'Receiving1_Gate10_Ols', 1, 1, N'Channel4.Receiving1.K0004.00', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (44, N'Receiving1_Gate11_Alarm', 1, 1, N'Channel4.Receiving1.K0005.04', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (45, N'Receiving1_Gate11_Cls', 1, 1, N'Channel4.Receiving1.K0001.00', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (46, N'Receiving1_Gate11_Ols', 1, 1, N'Channel4.Receiving1.K0005.03', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (47, N'Receiving1_Gate12_Alarm', 1, 1, N'Channel4.Receiving1.K0005.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (48, N'Receiving1_Gate12_Cls', 1, 1, N'Channel4.Receiving1.K0001.01', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (49, N'Receiving1_Gate12_Ols', 1, 1, N'Channel4.Receiving1.K0005.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (50, N'Receiving1_Gate13_Alarm', 1, 1, N'Channel4.Receiving1.K0005.01', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (51, N'Receiving1_Gate13_Cls', 1, 1, N'Channel4.Receiving1.K0001.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (52, N'Receiving1_Gate13_Ols', 1, 1, N'Channel4.Receiving1.K0005.00', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (53, N'Receiving1_Gate14_Alarm', 1, 1, N'Channel4.Receiving1.K0005.07', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (54, N'Receiving1_Gate14_Cls', 1, 1, N'Channel4.Receiving1.K0000.15', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (55, N'Receiving1_Gate14_Ols', 1, 1, N'Channel4.Receiving1.K0005.05', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (56, N'Receiving1_Gate15_Alarm', 1, 1, N'Channel4.Receiving1.K0005.06', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (57, N'Receiving1_Gate15_Cls', 1, 1, N'Channel4.Receiving1.K0000.14', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (58, N'Receiving1_Gate15_Ols', 1, 1, N'Channel4.Receiving1.K0005.08', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (59, N'Receiving1_Gate16_Ols', 1, 1, N'Channel4.Receiving1.K0000.11', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (60, N'Receiving1_Gate17_Ols', 1, 1, N'Channel4.Receiving1.K0000.10', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (61, N'Receiving1_Gate18_Ols', 1, 1, N'Channel4.Receiving1.K0000.09', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (62, N'Receiving1_Gate19_Ols', 1, 1, N'Channel4.Receiving1.K0000.08', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (63, N'Receiving1_Gate20_Ols', 1, 1, N'Channel4.Receiving1.K0000.07', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (64, N'Receiving1_Gate21_Ols', 1, 1, N'Channel4.Receiving1.K0000.01', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (65, N'Receiving1_Gate3_Alarm', 1, 1, N'Channel4.Receiving1.K0005.12', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (66, N'Receiving1_Gate3_Cls', 1, 1, N'Channel4.Receiving1.K0000.12', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (67, N'Receiving1_Gate3_Ols', 1, 1, N'Channel4.Receiving1.K0005.11', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (68, N'Receiving1_Gate4_Alarm', 1, 1, N'Channel4.Receiving1.K0005.10', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (69, N'Receiving1_Gate4_Cls', 1, 1, N'Channel4.Receiving1.K0000.13', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (70, N'Receiving1_Gate4_Ols', 1, 1, N'Channel4.Receiving1.K0005.09', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (71, N'Receiving1_Gate5_Alarm', 1, 1, N'Channel4.Receiving1.K0003.07', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (72, N'Receiving1_Gate5_Cls', 1, 1, N'Channel4.Receiving1.K0004.01', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (73, N'Receiving1_Gate5_Ols', 1, 1, N'Channel4.Receiving1.K0000.06', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (74, N'Receiving1_Gate6_Alarm', 1, 1, N'Channel4.Receiving1.K0003.08', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (75, N'Receiving1_Gate6_Cls', 1, 1, N'Channel4.Receiving1.K0004.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (76, N'Receiving1_Gate6_Ols', 1, 1, N'Channel4.Receiving1.K0000.05', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (77, N'Receiving1_Gate7_Alarm', 1, 1, N'Channel4.Receiving1.K0003.09', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (78, N'Receiving1_Gate7_Cls', 1, 1, N'Channel4.Receiving1.K0004.04', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (79, N'Receiving1_Gate7_Ols', 1, 1, N'Channel4.Receiving1.K0000.04', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (80, N'Receiving1_Gate8_Alarm', 1, 1, N'Channel4.Receiving1.K0003.09', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (81, N'Receiving1_Gate8_Cls', 1, 1, N'Channel4.Receiving1.K0004.05', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (82, N'Receiving1_Gate8_Ols', 1, 1, N'Channel4.Receiving1.K0000.03', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (83, N'Receiving1_Gate9_Alarm', 1, 1, N'Channel4.Receiving1.K0003.10', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (84, N'Receiving1_Gate9_Cls', 1, 1, N'Channel4.Receiving1.K0004.06', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (85, N'Receiving1_Gate9_Ols', 1, 1, N'Channel4.Receiving1.K0000.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (86, N'Receiving1_Gate9_Ols4', 1, 1, N'Channel4.Receiving1.K0000.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (87, N'Receiving1_Gate9_Ols5', 1, 1, N'Channel4.Receiving1.K0000.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (88, N'Receiving1_Gate9_Ols6', 1, 1, N'Channel4.Receiving1.K0000.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (89, N'Receiving1_Gate9_Ols7', 1, 1, N'Channel4.Receiving1.K0000.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (90, N'Receiving1_Gate9_Ols8', 1, 1, N'Channel4.Receiving1.K0000.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (91, N'Receiving1_Gate9_Ols9', 1, 1, N'Channel4.Receiving1.K0000.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (92, N'Receiving1_leg1alm', 1, 1, N'Channel4.Receiving1.K0010.00', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (93, N'Receiving1_LegMotor1_Overload', 8, 4, N'Channel4.Receiving1.R0016', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (94, N'Receiving1_LegMotor1_Running', 1, 1, N'Channel4.Receiving1.K0006.01', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (95, N'Receiving1_LegMotor2_Overload', 8, 4, N'Channel4.Receiving1.R0024', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (96, N'Receiving1_LegMotor2_Running', 1, 1, N'Channel4.Receiving1.K0005.15', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (97, N'Receiving1_Legmotor2Speed_Speed', 8, 4, N'Channel4.Receiving1.R0028', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (98, N'Receiving1_LegMotor3_Overload', 8, 4, N'Channel4.Receiving1.R0044', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (99, N'Receiving1_LegMotor3_Running', 1, 1, N'Channel4.Receiving1.K0006.00', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (100, N'Receiving1_Legmotor3Curr_Digi', 8, 4, N'Channel4.Receiving1.R0036', 20001, 1, 0, NULL, NULL, 0, 0, 0)
GO
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (101, N'Receiving1_Legmotor3Speed_Speed', 8, 4, N'Channel4.Receiving1.R0048', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (102, N'Receiving1_LegMotor4_Overload', 8, 4, N'Channel4.Receiving1.R0004', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (103, N'Receiving1_LegMotor4_Running', 1, 1, N'Channel4.Receiving1.K0001.06', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (104, N'Receiving1_Legmotor4Curr_Digi', 8, 4, N'Channel4.Receiving1.R0000', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (105, N'Receiving1_LocalRemote', 1, 1, N'Channel4.Receiving1.K0008.09', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (106, N'Receiving1_MagicRoll1_Alarm', 1, 1, N'Channel4.Receiving1.K0007.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (107, N'Receiving1_MagicRoll1_Running', 1, 1, N'Channel4.Receiving1.K0006.11', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (108, N'Receiving1_MagicRoll2_Alarm', 1, 1, N'Channel4.Receiving1.K0007.01', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (109, N'Receiving1_MagicRoll2_Running', 1, 1, N'Channel4.Receiving1.K0006.06', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (110, N'Receiving1_MagicRoll3_Alarm', 1, 1, N'Channel4.Receiving1.K0007.00', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (111, N'Receiving1_MagicRoll3_Running', 1, 1, N'Channel4.Receiving1.K0006.04', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (112, N'Receiving1_MagicRoll4_Alarm', 1, 1, N'Channel4.Receiving1.K0001.09', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (113, N'Receiving1_MagicRoll4_Running', 1, 1, N'Channel4.Receiving1.K0001.09', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (114, N'Receiving1_Sifter1_Running', 1, 1, N'Channel4.Receiving1.K0006.07', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (115, N'Receiving1_Sifter2_Running', 1, 1, N'Channel4.Receiving1.K0006.05', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (116, N'Receiving1_Sifter3_Alarm', 1, 1, N'Channel4.Receiving1.K0001.10', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (117, N'Receiving1_Sifter3_Running', 1, 1, N'Channel4.Receiving1.K0001.10', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (118, N'Receiving1_ThreeWays1_Left', 1, 1, N'Channel4.Receiving1.K0001.07', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (119, N'Receiving1_ThreeWays1_Right', 1, 1, N'Channel4.Receiving1.K0001.05', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (120, N'Receiving1_ThreeWays2_Left', 1, 1, N'Channel4.Receiving1.K0006.03', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (121, N'Receiving1_ThreeWays2_Right', 1, 1, N'Channel4.Receiving1.K0006.02', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (122, N'Receiving2_LegCUR102_Digi', 8, 4, N'Channel4.Receiving1.R0020', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (123, N'Receiving2_LegCUR106_Digi', 8, 4, N'Channel4.Receiving1.R0012', 20001, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (124, N'Receiving1_Conveyor1_Alarm', 1, 1, N'Channel4.Receiving2.K0002.11', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (125, N'Receiving1_Conveyor1_Running', 1, 1, N'Channel4.Receiving2.K0002.10', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (126, N'Receiving1_Conveyor2_Alarm', 1, 1, N'Channel4.Receiving2.K0002.09', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (127, N'Receiving1_Conveyor2_Running', 1, 1, N'Channel4.Receiving2.K0002.04', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (128, N'Receiving1_Gate1_Alarm', 1, 1, N'Channel4.Receiving2.K0001.14', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (129, N'Receiving1_Gate1_Cls', 1, 1, N'Channel4.Receiving2.K0001.13', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (130, N'Receiving1_Gate1_Ols', 1, 1, N'Channel4.Receiving2.K0001.11', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (131, N'Receiving1_Gate2_Alarm', 1, 1, N'Channel4.Receiving2.K0001.08', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (132, N'Receiving1_Gate2_Cls', 1, 1, N'Channel4.Receiving2.K0001.09', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (133, N'Receiving1_Gate2_Ols', 1, 1, N'Channel4.Receiving2.K0001.10', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (134, N'Receiving2_Airport1_Alarm', 1, 1, N'Channel4.Receiving2.K0002.08', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (135, N'Receiving2_Airport1_Running', 1, 1, N'Channel4.Receiving2.K0001.05', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (136, N'Receiving2_Airport2_Alarm', 1, 1, N'Channel4.Receiving2.K0001.00', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (137, N'Receiving2_Airport2_Running', 1, 1, N'Channel4.Receiving2.K0001.01', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (138, N'Receiving2_AlmAck', 1, 1, N'Channel4.Receiving2.K0002.02', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (139, N'Receiving2_Converyor1_Running', 1, 1, N'Channel4.Receiving2.K0001.15', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (140, N'Receiving2_Converyor2_Alarm', 1, 1, N'Channel4.Receiving2.K0002.12', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (141, N'Receiving2_Converyor2_Running', 1, 1, N'Channel4.Receiving2.K0002.13', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (142, N'Receiving2_Fan1_Alarm', 1, 1, N'Channel4.Receiving2.K0001.02', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (143, N'Receiving2_Fan1_Running', 1, 1, N'Channel4.Receiving2.K0001.03', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (144, N'Receiving2_Gate1_Alarm', 1, 1, N'Channel4.Receiving2.K0001.04', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (145, N'Receiving2_Gate1_Cls', 1, 1, N'Channel4.Receiving2.K0001.06', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (146, N'Receiving2_Gate1_Ols', 1, 1, N'Channel4.Receiving2.K0001.07', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (147, N'Receiving2_Gate2_Ols', 1, 1, N'Channel4.Receiving2.K0002.05', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (148, N'Receiving2_LegMotor1_Overload', 8, 4, N'Channel4.Receiving2.R0008', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (149, N'Receiving2_Legmotor1Speed_Speed', 8, 4, N'Channel4.Receiving2.R0012', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (150, N'Receiving2_LegMotor2_Overload', 8, 4, N'Channel4.Receiving2.R0000', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (151, N'Receiving2_LegMotor2_Running', 1, 1, N'Channel4.Receiving2.K0002.01', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (152, N'Receiving2_Legmotor2Speed_Speed', 8, 4, N'Channel4.Receiving2.R0004', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (153, N'Receiving2_LocalRemote', 1, 1, N'Channel4.Receiving2.K0002.03', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (154, N'Receiving2_MagicRoll1_Alarm', 1, 1, N'Channel4.Receiving2.K0002.14', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (155, N'Receiving2_MagicRoll1_Running', 1, 1, N'Channel4.Receiving2.K0002.00', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (156, N'Receiving2_Sifter1_Alarm', 1, 1, N'Channel4.Receiving2.K0002.15', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (157, N'Receiving2_Sifter1_Running', 1, 1, N'Channel4.Receiving2.K0002.07', 20002, 1, 0, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Meta_Tag] ([TagID], [TagName], [DataType], [DataSize], [Address], [GroupID], [IsActive], [Archive], [DefaultValue], [Description], [Maximum], [Minimum], [Cycle]) VALUES (158, N'Receiving2_Sifter1_Running8', 1, 1, N'Channel4.Receiving2.K0002.07', 20002, 1, 0, NULL, NULL, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Meta_Tag] OFF
SET IDENTITY_INSERT [dbo].[RegisterModule] ON 

INSERT [dbo].[RegisterModule] ([DriverID], [AssemblyName], [ClassName], [ClassFullName], [Description]) VALUES (8, N'C:\Users\Yinan\Documents\Github\SharpSCADA\SCADA\dll\ModbusDriver.dll', N'ModbusRTUReader', N'ModbusDriver.ModbusRTUReader', N'Modbus RTU协议')
INSERT [dbo].[RegisterModule] ([DriverID], [AssemblyName], [ClassName], [ClassFullName], [Description]) VALUES (9, N'C:\Users\Yinan\Documents\Github\SharpSCADA\SCADA\dll\ModbusDriver.dll', N'ModbusTCPReader', N'ModbusDriver.ModbusTCPReader', N'Modbus Tcp协议')
INSERT [dbo].[RegisterModule] ([DriverID], [AssemblyName], [ClassName], [ClassFullName], [Description]) VALUES (4, N'C:\Users\Yinan\Documents\Github\SharpSCADA\SCADA\dll\OPCDriver.dll', N'OPCReader', N'OPCDriver.OPCReader', N'OPC协议')
INSERT [dbo].[RegisterModule] ([DriverID], [AssemblyName], [ClassName], [ClassFullName], [Description]) VALUES (5, N'C:\Users\Yinan\Documents\Github\SharpSCADA\SCADA\dll\FileDriver.dll', N'DataBaseReader', N'FileDriver.DataBaseReader', N'SQL 数据库')
INSERT [dbo].[RegisterModule] ([DriverID], [AssemblyName], [ClassName], [ClassFullName], [Description]) VALUES (6, N'C:\Users\Yinan\Documents\Github\SharpSCADA\SCADA\dll\FileDriver.dll', N'TagDriver', N'FileDriver.TagDriver', N'标签直接读写')
SET IDENTITY_INSERT [dbo].[RegisterModule] OFF
ALTER TABLE [dbo].[Meta_Condition] ADD  CONSTRAINT [DF_ALARMSET_AlarmType]  DEFAULT ((0)) FOR [AlarmType]
GO
ALTER TABLE [dbo].[Meta_Condition] ADD  CONSTRAINT [DF_ALARMSET_EventType]  DEFAULT ((0)) FOR [EventType]
GO
ALTER TABLE [dbo].[Meta_Condition] ADD  CONSTRAINT [DF_ALARMSET_ConditionType]  DEFAULT ((0)) FOR [ConditionType]
GO
ALTER TABLE [dbo].[Meta_Condition] ADD  CONSTRAINT [DF_ALARM_Set_Para]  DEFAULT ((0)) FOR [Para]
GO
ALTER TABLE [dbo].[Meta_Condition] ADD  CONSTRAINT [DF_ALARMSET_IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[Meta_Condition] ADD  CONSTRAINT [DF_ALARMSET_DeadBand]  DEFAULT ((0)) FOR [DeadBand]
GO
ALTER TABLE [dbo].[Meta_Condition] ADD  CONSTRAINT [DF_ALARMSET_Delay]  DEFAULT ((0)) FOR [Delay]
GO
ALTER TABLE [dbo].[Meta_SubCondition] ADD  CONSTRAINT [DF_SubCondition_Set_SubAlarmType]  DEFAULT ((0)) FOR [SubAlarmType]
GO
ALTER TABLE [dbo].[Meta_SubCondition] ADD  CONSTRAINT [DF_SubCondition_Set_Threshold]  DEFAULT ((0)) FOR [Threshold]
GO
ALTER TABLE [dbo].[Meta_SubCondition] ADD  CONSTRAINT [DF_SubCondition_Set_Severity]  DEFAULT ((0)) FOR [Severity]
GO
ALTER TABLE [dbo].[Meta_SubCondition] ADD  CONSTRAINT [DF_SubCondition_Set_Message]  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[Meta_SubCondition] ADD  CONSTRAINT [DF_SubCondition_Set_IsEnable]  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[Meta_SubCondition]  WITH NOCHECK ADD  CONSTRAINT [FK_Meta_SubCondition_Meta_Condition] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[Meta_Condition] ([TypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Meta_SubCondition] CHECK CONSTRAINT [FK_Meta_SubCondition_Meta_Condition]
GO
/****** Object:  StoredProcedure [dbo].[AddEventLog]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddEventLog] 
@StartTime DATETIME ,
@Source NVARCHAR(50),
@Comment NVARCHAR(50) as
--set nocount on 
IF @Comment<>ISNULL((SELECT TOP 1 Comment FROM dbo.LOG_EVENT WHERE EVENTTYPE=2 AND Source=@Source ORDER BY SQLCOUNTER DESC),'')
INSERT INTO dbo.LOG_EVENT(EVENTTYPE,SEVERITY,ACTIVETIME,SOURCE,COMMENT) VALUES(2,0,@StartTime,@Source,@Comment);




GO
/****** Object:  StoredProcedure [dbo].[GetAlarm]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAlarm] 
@StartTime DATETIME ,
@EndTime DATETIME 
AS
--set nocount on 
SELECT StartTime,AlarmText,AlarmValue,SubAlarmType,Severity,ConditionID,Source,Duration FROM LOG_ALARM WHERE StartTime BETWEEN @StartTime AND @EndTime ORDER BY StartTime




GO
/****** Object:  StoredProcedure [dbo].[GetEventTime]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetEventTime] 
@EVENTTYPE int ,
@SOURCE nvarchar(50),
@COMMENT nvarchar(50),
@STARTTIME DATETIME OUTPUT,
@ENDTIME DATETIME OUTPUT as
--set nocount on 
DECLARE @ID INT;
SELECT TOP 1 @ID=SQLCOUNTER,@STARTTIME=ACTIVETIME FROM  dbo.LOG_EVENT WHERE EVENTTYPE=@EVENTTYPE AND SOURCE=@SOURCE AND COMMENT=@COMMENT
 ORDER BY ACTIVETIME DESC;
SET @ENDTIME=(SELECT TOP 1 ACTIVETIME FROM  dbo.LOG_EVENT WHERE EVENTTYPE=@EVENTTYPE AND SOURCE=@SOURCE 
AND SQLCOUNTER>@ID ORDER BY SQLCOUNTER);



GO
/****** Object:  StoredProcedure [dbo].[InitServer]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InitServer]
@TYPE INT --0:服务端；1：客户端；2：控制器端。  
AS
IF @TYPE<>1 SELECT DriverID,PropertyName,PropertyValue FROM Argument
IF @TYPE<>1 SELECT M.DRIVERID,DRIVERNAME,R.AssemblyName,R.ClassFullName
FROM META_DRIVER M INNER JOIN dbo.RegisterModule R ON M.DRIVERTYPE=R.DriverID;
SELECT COUNT(*) FROM META_TAG;
SELECT TAGID,GROUPID,RTRIM(TAGNAME),[ADDRESS],DATATYPE,DATASIZE,ARCHIVE,MAXIMUM,MINIMUM,CYCLE FROM META_TAG WHERE ISACTIVE=1;
IF @TYPE<>1 SELECT DRIVERID,GROUPNAME,GROUPID,UPDATERATE,DEADBAND,ISACTIVE FROM META_GROUP ;
IF @TYPE=0 SELECT SOURCE FROM META_Condition WHERE EVENTTYPE=2;
IF @TYPE<>2 SELECT TYPEID,SOURCE,ALARMTYPE,A.ISENABLED,CONDITIONTYPE,PARA,ISNULL(COMMENT,''),DEADBAND,DELAY,SUBALARMTYPE,Threshold,SEVERITY,
ISNULL([MESSAGE],''),B.ISENABLE FROM META_Condition a LEFT OUTER JOIN META_SUBCONDITION b ON a.TypeID=b.ConditionID WHERE EVENTTYPE<>2;
-- LEFT OUTER JOIN META_TAG c ON a.SOURCEID=c.TAGID 
SELECT SCALEID,SCALETYPE,EUHI,EULO,RAWHI,RAWLO FROM META_SCALE;













GO
/****** Object:  StoredProcedure [dbo].[ReadALL]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ReadALL] 
@GroupID SMALLINT
AS
SELECT COUNT(*) FROM  META_TAG WHERE GROUPID=@GroupID AND IsActive=1;
SELECT TAGID,DATATYPE,ISNULL(DEFAULTVALUE,0) FROM META_TAG WHERE IsActive=1 AND GROUPID=@GroupID ORDER BY TAGID



GO
/****** Object:  StoredProcedure [dbo].[ReadHData]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReadHData] 
@StartTime DATETIME ,
@EndTime DATETIME,
@ID INT as
--set nocount on 
IF @ID IS NULL
SELECT ID,[TIMESTAMP],[VALUE],M.DATATYPE FROM LOG_HDATA L INNER JOIN META_TAG M ON L.ID=M.TAGID WHERE [TIMESTAMP] BETWEEN @StartTime AND @EndTime ORDER BY ID,[TIMESTAMP];
ELSE 
SELECT [TIMESTAMP],[VALUE],M.DATATYPE FROM LOG_HDATA L INNER JOIN META_TAG M ON L.ID=M.TAGID WHERE ID=@ID AND [TIMESTAMP] BETWEEN @StartTime AND @EndTime  ORDER BY [TIMESTAMP];
--select ID,[TIMESTAMP],[VALUE] from HDADATA WHERE [TIMESTAMP] BETWEEN @StartTime AND @EndTime order by [TIMESTAMP]





GO
/****** Object:  StoredProcedure [dbo].[ReadValueByID]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ReadValueByID] 
@ID SMALLINT,
@DATATYPE TinyInt
AS
IF @DATATYPE=1 
SELECT CAST(DEFAULTVALUE AS BIT) FROM META_TAG WHERE TAGID=@ID
ELSE IF @DATATYPE=3
SELECT CAST(DEFAULTVALUE AS TINYINT) FROM META_TAG WHERE TAGID=@ID
ELSE IF @DATATYPE=4
SELECT CAST(DEFAULTVALUE AS SMALLINT) FROM META_TAG WHERE TAGID=@ID
ELSE IF @DATATYPE=7
SELECT CAST(DEFAULTVALUE AS INT) FROM META_TAG WHERE TAGID=@ID
ELSE IF @DATATYPE=8
SELECT CAST(DEFAULTVALUE AS REAL) FROM META_TAG WHERE TAGID=@ID
ELSE IF @DATATYPE=11
SELECT CAST(DEFAULTVALUE AS VARCHAR) FROM META_TAG WHERE TAGID=@ID




GO
/****** Object:  StoredProcedure [dbo].[UpdateValueByID]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateValueByID] 
@ID INT,
@Value Sql_Variant
AS
UPDATE META_TAG SET DEFAULTVALUE=@Value WHERE TAGID=@ID



GO
/****** Object:  StoredProcedure [dbo].[WriteHData]    Script Date: 2017/12/24 21:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WriteHData] 
@DATE DATETIME
AS
DELETE FROM LOG_HDATA FROM LOG_HDATA L INNER JOIN META_TAG T ON T.TAGID=L.ID WHERE T.DATATYPE=11
SELECT COUNT(*),COUNT(DISTINCT ID) FROM LOG_HDATA WHERE DATEDIFF(DAY,@DATE,[TIMESTAMP])=0;
SELECT H.ID,T.DATATYPE,C FROM( SELECT ID,COUNT(*)C FROM LOG_HDATA WHERE DATEDIFF(DAY,@DATE,[TIMESTAMP])=0 GROUP BY ID)H INNER JOIN META_TAG T ON H.ID=T.TAGID ORDER BY ID --WITH ROLLUP
SELECT [TIMESTAMP],VALUE FROM LOG_HDATA WHERE DATEDIFF(DAY,@DATE,[TIMESTAMP])=0 ORDER BY ID,[TIMESTAMP]
--DELETE FROM LOG_HDATA WHERE DATEDIFF(DAY,@DATE,[TIMESTAMP])=0;






GO
