USE [WHQJNativeWebDB]
GO
/****** Object:  Table [dbo].[Ads]    Script Date: 2018/7/9 10:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[ResourceURL] [nvarchar](500) NOT NULL,
	[LinkURL] [nvarchar](500) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[SortID] [int] NOT NULL,
	[Remark] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Ads] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CacheGameRank]    Script Date: 2018/7/9 10:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CacheGameRank](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[NickName] [nvarchar](31) NOT NULL,
	[FaceUrl] [nvarchar](500) NOT NULL,
	[FaceID] [int] NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[UnderWrite] [nvarchar](250) NOT NULL,
	[RankNum] [int] NOT NULL,
	[WinCount] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CacheGameRank] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CacheRankAward]    Script Date: 2018/7/9 10:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CacheRankAward](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[GameID] [int] NOT NULL,
	[NickName] [nvarchar](31) NOT NULL,
	[FaceUrl] [nvarchar](500) NOT NULL,
	[FaceID] [int] NOT NULL,
	[RankNum] [int] NOT NULL,
	[RankValue] [bigint] NOT NULL,
	[Gold] [bigint] NOT NULL,
	[Diamond] [int] NOT NULL,
	[ReceiveState] [tinyint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CacheRankAward] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CacheWealthRank]    Script Date: 2018/7/9 10:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CacheWealthRank](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[NickName] [nvarchar](31) NOT NULL,
	[FaceUrl] [nvarchar](500) NOT NULL,
	[FaceID] [int] NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[UnderWrite] [nvarchar](250) NOT NULL,
	[RankNum] [int] NOT NULL,
	[Gold] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CacheWealthRank] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConfigInfo]    Script Date: 2018/7/9 10:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigInfo](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigKey] [nvarchar](32) NOT NULL,
	[ConfigName] [nvarchar](64) NOT NULL,
	[ConfigString] [nvarchar](512) NOT NULL,
	[Field1] [nvarchar](128) NOT NULL,
	[Field2] [nvarchar](128) NOT NULL,
	[Field3] [nvarchar](128) NOT NULL,
	[Field4] [nvarchar](128) NOT NULL,
	[Field5] [nvarchar](128) NOT NULL,
	[Field6] [nvarchar](128) NOT NULL,
	[Field7] [nvarchar](128) NOT NULL,
	[Field8] [text] NOT NULL,
	[SortID] [int] NOT NULL,
 CONSTRAINT [PK_SytemConfigInfo] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GameRule]    Script Date: 2018/10/24 16:13:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GameRule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KindID] [int] NOT NULL,
	[KindName] [nvarchar](32) NOT NULL,
	[KindIcon] [nvarchar](100) NOT NULL,
	[KindIntro] [nvarchar](max) NOT NULL,
	[KindRule] [ntext] NOT NULL,
	[RuleImg] [nvarchar](100) NOT NULL,
	[Type] [int] NOT NULL,
	[LogID] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[SortID] [int] NOT NULL,
 CONSTRAINT [PK_GameRule_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[GameRule] ADD  CONSTRAINT [DF_GameRule_KindID]  DEFAULT ((0)) FOR [KindID]
GO

ALTER TABLE [dbo].[GameRule] ADD  CONSTRAINT [DF_GameRule_KindName]  DEFAULT ('') FOR [KindName]
GO

ALTER TABLE [dbo].[GameRule] ADD  CONSTRAINT [DF_GameRule_KindIcon]  DEFAULT ('') FOR [KindIcon]
GO

ALTER TABLE [dbo].[GameRule] ADD  CONSTRAINT [DF_GameRule_KindIntro]  DEFAULT (N'') FOR [KindIntro]
GO

ALTER TABLE [dbo].[GameRule] ADD  CONSTRAINT [DF_GameRule_KindRule]  DEFAULT ('') FOR [KindRule]
GO

ALTER TABLE [dbo].[GameRule] ADD  CONSTRAINT [DF_GameRule_LogID]  DEFAULT ((0)) FOR [LogID]
GO

ALTER TABLE [dbo].[GameRule] ADD  CONSTRAINT [DF_GameRule_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO

ALTER TABLE [dbo].[GameRule] ADD  CONSTRAINT [DF_GameRule_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

ALTER TABLE [dbo].[GameRule] ADD  CONSTRAINT [DF__GameRule__SortID__5BE2A6F2]  DEFAULT ((0)) FOR [SortID]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'KindID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'KindName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏图标路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'KindIcon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'KindIntro'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'KindRule'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规则图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'RuleImg'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片类型（1:横屏，2:竖屏）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'Type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'LogID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'Nullity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩法排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRule', @level2type=N'COLUMN',@level2name=N'SortID'
GO



/****** Object:  Table [dbo].[Question]    Script Date: 2018/7/9 10:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionTitle] [nvarchar](128) NOT NULL,
	[Answer] [nvarchar](256) NOT NULL,
	[SortID] [int] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[QuestionTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RankingConfig]    Script Date: 2018/7/9 10:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RankingConfig](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[RankType] [int] NOT NULL,
	[Gold] [bigint] NOT NULL,
	[Diamond] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RankingConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StreamEveryDayData]    Script Date: 2018/7/9 10:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreamEveryDayData](
	[DateID] [int] NOT NULL,
	[Gold] [bigint] NOT NULL,
	[Diamond] [bigint] NOT NULL,
	[GameWaste] [bigint] NOT NULL,
	[GameRevenue] [bigint] NOT NULL,
	[InsureRevenue] [bigint] NOT NULL,
	[PayGold] [bigint] NOT NULL,
	[PayDiamond] [bigint] NOT NULL,
	[PayAmount] [decimal](18, 2) NOT NULL,
	[CreateScoreRoom] [bigint] NOT NULL,
	[CreateGoldRoom] [bigint] NOT NULL,
	[WebRegister] [int] NOT NULL,
	[GameRegister] [int] NOT NULL,
	[H5Register] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StreamEveryDayData] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemNotice]    Script Date: 2018/7/9 10:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemNotice](
	[NoticeID] [int] IDENTITY(1,1) NOT NULL,
	[NoticeTitle] [nvarchar](50) NOT NULL,
	[MoblieContent] [nvarchar](1000) NOT NULL,
	[WebContent] [ntext] NOT NULL,
	[SortID] [int] NOT NULL,
	[Publisher] [nvarchar](32) NOT NULL,
	[PublisherTime] [datetime] NOT NULL,
	[IsHot] [bit] NOT NULL,
	[IsTop] [bit] NOT NULL,
	[Nullity] [bit] NOT NULL,
 CONSTRAINT [PK_SystemNotice] PRIMARY KEY CLUSTERED 
(
	[NoticeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Ads] ADD  CONSTRAINT [DF_AdImage_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[Ads] ADD  CONSTRAINT [DF_Table_1_ImageUrl]  DEFAULT ('') FOR [ResourceURL]
GO
ALTER TABLE [dbo].[Ads] ADD  CONSTRAINT [DF_AdImage_LinkURL]  DEFAULT ('') FOR [LinkURL]
GO
ALTER TABLE [dbo].[Ads] ADD  CONSTRAINT [DF_AdImage_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Ads] ADD  CONSTRAINT [DF_AdImage_Remark]  DEFAULT ('') FOR [Remark]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_DateID]  DEFAULT ((0)) FOR [DateID]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_GameID]  DEFAULT ((0)) FOR [GameID]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_NickName]  DEFAULT ('') FOR [NickName]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_FaceUrl]  DEFAULT ('') FOR [FaceUrl]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_SystemFaceID]  DEFAULT ((0)) FOR [FaceID]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_Gender]  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_UnderWrite]  DEFAULT ('') FOR [UnderWrite]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_RankNum]  DEFAULT ((0)) FOR [RankNum]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_WinCount]  DEFAULT ((0)) FOR [WinCount]
GO
ALTER TABLE [dbo].[CacheGameRank] ADD  CONSTRAINT [DF_CacheGameRank_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_DateID]  DEFAULT ((0)) FOR [DateID]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_GameID]  DEFAULT ((0)) FOR [GameID]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_NickName]  DEFAULT ('') FOR [NickName]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_FaceUrl]  DEFAULT ('') FOR [FaceUrl]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_FaceID]  DEFAULT ((0)) FOR [FaceID]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_RankNum]  DEFAULT ((0)) FOR [RankNum]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_RankValue]  DEFAULT ((0)) FOR [RankValue]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_Gold]  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_Diamond]  DEFAULT ((0)) FOR [Diamond]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_ReceiveState]  DEFAULT ((0)) FOR [ReceiveState]
GO
ALTER TABLE [dbo].[CacheRankAward] ADD  CONSTRAINT [DF_CacheRankAward_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_DateID]  DEFAULT ((0)) FOR [DateID]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_GameID]  DEFAULT ((0)) FOR [GameID]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_NickName]  DEFAULT ('') FOR [NickName]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_CustomFaceID]  DEFAULT ('') FOR [FaceUrl]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_SystemFaceID]  DEFAULT ((0)) FOR [FaceID]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_Gender]  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_UnderWrite]  DEFAULT ('') FOR [UnderWrite]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_RankNum]  DEFAULT ((0)) FOR [RankNum]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_Diamond]  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[CacheWealthRank] ADD  CONSTRAINT [DF_CacheWealthRank_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_ConfigName]  DEFAULT ('') FOR [ConfigKey]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_ConfigName_1]  DEFAULT ('') FOR [ConfigName]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_Description]  DEFAULT ('') FOR [ConfigString]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_Field1]  DEFAULT ('') FOR [Field1]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_Field2]  DEFAULT ('') FOR [Field2]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_Field3]  DEFAULT ('') FOR [Field3]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_Field4]  DEFAULT ('') FOR [Field4]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_Field5]  DEFAULT ('') FOR [Field5]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_Field6]  DEFAULT ('') FOR [Field6]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_Field7]  DEFAULT ('') FOR [Field7]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_PublicConfig_Field8]  DEFAULT ('') FOR [Field8]
GO
ALTER TABLE [dbo].[ConfigInfo] ADD  CONSTRAINT [DF_ConfigInfo_SortID]  DEFAULT ((0)) FOR [SortID]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_QuestionTitle]  DEFAULT (N'') FOR [QuestionTitle]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_Answer]  DEFAULT (N'') FOR [Answer]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_SortID]  DEFAULT ((0)) FOR [SortID]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_UpdateAt]  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[RankingConfig] ADD  CONSTRAINT [DF_RankingConfig_TypeID]  DEFAULT ((1)) FOR [TypeID]
GO
ALTER TABLE [dbo].[RankingConfig] ADD  CONSTRAINT [DF_RankingConfig_RankID]  DEFAULT ((0)) FOR [RankType]
GO
ALTER TABLE [dbo].[RankingConfig] ADD  CONSTRAINT [DF_RankingConfig_Gold]  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[RankingConfig] ADD  CONSTRAINT [DF_RankingConfig_Diamond]  DEFAULT ((0)) FOR [Diamond]
GO
ALTER TABLE [dbo].[RankingConfig] ADD  CONSTRAINT [DF_RankingConfig_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_DateID]  DEFAULT ((0)) FOR [DateID]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_Gold]  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_Diamond]  DEFAULT ((0)) FOR [Diamond]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_GameWaste]  DEFAULT ((0)) FOR [GameWaste]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_GameRevenue]  DEFAULT ((0)) FOR [GameRevenue]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_InsureRevenue]  DEFAULT ((0)) FOR [InsureRevenue]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_PayGold]  DEFAULT ((0)) FOR [PayGold]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_PayDiamond]  DEFAULT ((0)) FOR [PayDiamond]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_PayAmount]  DEFAULT ((0)) FOR [PayAmount]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_CreateScoreRoom]  DEFAULT ((0)) FOR [CreateScoreRoom]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_CreateGoldRoom]  DEFAULT ((0)) FOR [CreateGoldRoom]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_WebRegister]  DEFAULT ((0)) FOR [WebRegister]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_GameRegister]  DEFAULT ((0)) FOR [GameRegister]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_H5Register]  DEFAULT ((0)) FOR [H5Register]
GO
ALTER TABLE [dbo].[StreamEveryDayData] ADD  CONSTRAINT [DF_StreamEveryDayData_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
ALTER TABLE [dbo].[SystemNotice] ADD  CONSTRAINT [DF_SystemNotice_NoticeTitle]  DEFAULT ('') FOR [NoticeTitle]
GO
ALTER TABLE [dbo].[SystemNotice] ADD  CONSTRAINT [DF_SystemNotice_NoticeContent]  DEFAULT ('') FOR [MoblieContent]
GO
ALTER TABLE [dbo].[SystemNotice] ADD  CONSTRAINT [DF_SystemNotice_WebContent]  DEFAULT ('') FOR [WebContent]
GO
ALTER TABLE [dbo].[SystemNotice] ADD  CONSTRAINT [DF_SystemNotice_SortID]  DEFAULT ((0)) FOR [SortID]
GO
ALTER TABLE [dbo].[SystemNotice] ADD  CONSTRAINT [DF_SystemNotice_Publisher]  DEFAULT ('') FOR [Publisher]
GO
ALTER TABLE [dbo].[SystemNotice] ADD  CONSTRAINT [DF_SystemNotice_PublisherTime]  DEFAULT (getdate()) FOR [PublisherTime]
GO
ALTER TABLE [dbo].[SystemNotice] ADD  CONSTRAINT [DF_SystemNotice_IsHot]  DEFAULT ((0)) FOR [IsHot]
GO
ALTER TABLE [dbo].[SystemNotice] ADD  CONSTRAINT [DF_SystemNotice_IsTop]  DEFAULT ((0)) FOR [IsTop]
GO
ALTER TABLE [dbo].[SystemNotice] ADD  CONSTRAINT [DF_SystemNotice_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ads', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ads', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ads', @level2type=N'COLUMN',@level2name=N'ResourceURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ads', @level2type=N'COLUMN',@level2name=N'LinkURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告图片类型 0:网站首页轮换广告 1:新闻公告广告图 2:联系我们广告图 3：手机大厅广告位 4：手机大厅弹出广告位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ads', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ads', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ads', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识（每周起始时间日期）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'微信头像地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'FaceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统头像标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'FaceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户个性签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'UnderWrite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'RankNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏中赢局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'WinCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheGameRank', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排行榜类型（1、财富排行榜  2、胜局排行榜）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'微信头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'FaceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统头像标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'FaceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排行名次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'RankNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排行的值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'RankValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'Diamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取状态（0、未领取  1、已领取）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'ReceiveState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheRankAward', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'微信头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'FaceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统头像标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'FaceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户个性签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'UnderWrite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'RankNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金币总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CacheWealthRank', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfigInfo', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置KEY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfigInfo', @level2type=N'COLUMN',@level2name=N'ConfigKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfigInfo', @level2type=N'COLUMN',@level2name=N'ConfigName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfigInfo', @level2type=N'COLUMN',@level2name=N'ConfigString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfigInfo', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公共配置表，此系统的配置信息基本保存在此表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfigInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问答标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Question', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Question', @level2type=N'COLUMN',@level2name=N'QuestionTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Question', @level2type=N'COLUMN',@level2name=N'Answer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Question', @level2type=N'COLUMN',@level2name=N'UpdateAt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RankingConfig', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排行榜类型（1、财富排行榜  2、胜局排行榜）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RankingConfig', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排行名次（1 第一名  2 第二名  3 第三名  4 第4-10名  5 第11-20名  6 第21-50名  7 第51-100名 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RankingConfig', @level2type=N'COLUMN',@level2name=N'RankType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RankingConfig', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RankingConfig', @level2type=N'COLUMN',@level2name=N'Diamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RankingConfig', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台金币总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台钻石总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'Diamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏损耗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'GameWaste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏税收' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'GameRevenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行税收' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'InsureRevenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'PayGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'PayDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'PayAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分开房次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'CreateScoreRoom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金币开房次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'CreateGoldRoom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站注册人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'WebRegister'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏注册人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'GameRegister'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H5注册人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'H5Register'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标注统计数据时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamEveryDayData', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'NoticeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'NoticeTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'MoblieContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'WebContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'Publisher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'PublisherTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'IsHot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置顶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'IsTop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemNotice', @level2type=N'COLUMN',@level2name=N'Nullity'
GO

/****** Object:  Table [dbo].[AwardInfo]    Script Date: 2018/8/31 16:59:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AwardInfo](
	[AwardID] [int] IDENTITY(1,1) NOT NULL,
	[AwardType] [int] NOT NULL,
	[AwardName] [nvarchar](30) NOT NULL,
	[AwardImg] [nvarchar](100) NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[Gold] [int] NOT NULL,
	[Diamond] [int] NOT NULL,
	[Inventory] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AwardInfo] PRIMARY KEY CLUSTERED 
(
	[AwardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_TypeID]  DEFAULT ((0)) FOR [AwardType]
GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_AwardName]  DEFAULT ('') FOR [AwardName]
GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_AwardImg]  DEFAULT ('') FOR [AwardImg]
GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_Gold]  DEFAULT ((0)) FOR [Gold]
GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_Diamond]  DEFAULT ((0)) FOR [Diamond]
GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_Inventory]  DEFAULT ((0)) FOR [Inventory]
GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_SortID]  DEFAULT ((0)) FOR [SortID]
GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO

ALTER TABLE [dbo].[AwardInfo] ADD  CONSTRAINT [DF_AwardInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'AwardID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'AwardType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'AwardName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'AwardImg'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品单价（奖券）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换游戏币值（单个）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'Gold'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换钻石值（单个）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'Diamond'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品库存（如果为兑换货币类时，使用0作为无限制，其他物品，为0表示库存不足）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品排序（从大到小）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'SortID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否上架（0、上架  1、下架）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

/****** Object:  Table [dbo].[AwardOrder]    Script Date: 2018/8/31 16:59:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AwardOrder](
	[OrderID] [nvarchar](32) NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[AwardID] [int] NULL,
	[AwardType] [int] NOT NULL,
	[AwardName] [nvarchar](32) NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[Gold] [int] NOT NULL,
	[Diamond] [int] NOT NULL,
	[BuyNum] [int] NOT NULL,
	[PayTicket] [int] NOT NULL,
	[Compellation] [nvarchar](20) NOT NULL,
	[MobilePhone] [nvarchar](11) NOT NULL,
	[Province] [nvarchar](11) NOT NULL,
	[City] [nvarchar](11) NOT NULL,
	[Area] [nvarchar](11) NOT NULL,
	[DetailAddress] [nvarchar](80) NOT NULL,
	[OrderStatus] [tinyint] NOT NULL,
	[ClinetIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AwardOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_OrderID]  DEFAULT ('') FOR [OrderID]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_GameID]  DEFAULT ((0)) FOR [GameID]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_TypeID]  DEFAULT ((0)) FOR [AwardType]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_AwardName]  DEFAULT ('') FOR [AwardName]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_Gold]  DEFAULT ((0)) FOR [Gold]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_Diamond]  DEFAULT ((0)) FOR [Diamond]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_BuyNum]  DEFAULT ((0)) FOR [BuyNum]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_PayTicket]  DEFAULT ((0)) FOR [PayTicket]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_RealName]  DEFAULT ('') FOR [Compellation]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_MobilePhone]  DEFAULT ('') FOR [MobilePhone]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_Province]  DEFAULT ((0)) FOR [Province]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_City]  DEFAULT ((0)) FOR [City]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_Area]  DEFAULT ((0)) FOR [Area]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_DetailAddress]  DEFAULT ('') FOR [DetailAddress]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_OrderStatus]  DEFAULT ((0)) FOR [OrderStatus]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_ClinetIP]  DEFAULT ('') FOR [ClinetIP]
GO

ALTER TABLE [dbo].[AwardOrder] ADD  CONSTRAINT [DF_AwardOrder_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'OrderID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买用户游戏ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'GameID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'AwardID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'AwardType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换奖品名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'AwardName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换奖品单价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换游戏币值（单个）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'Gold'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换钻石值（单个）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'Diamond'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'BuyNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付奖券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'PayTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'Compellation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'MobilePhone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'Province'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'市标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'City'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'Area'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'DetailAddress'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态（0、新订单  1、已发货  2、已收货   3、已退货  4、订单关闭）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'OrderStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'ClinetIP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardOrder', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[AwardType]    Script Date: 2018/8/31 16:59:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AwardType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](20) NOT NULL,
	[SortID] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AwardType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AwardType] ADD  CONSTRAINT [DF_AwardType_TypeName]  DEFAULT ('') FOR [TypeName]
GO

ALTER TABLE [dbo].[AwardType] ADD  CONSTRAINT [DF_AwardType_SortID]  DEFAULT ((0)) FOR [SortID]
GO

ALTER TABLE [dbo].[AwardType] ADD  CONSTRAINT [DF_AwardType_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO

ALTER TABLE [dbo].[AwardType] ADD  CONSTRAINT [DF_AwardType_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardType', @level2type=N'COLUMN',@level2name=N'TypeID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品类型名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardType', @level2type=N'COLUMN',@level2name=N'TypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品类型排序（从大到小）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardType', @level2type=N'COLUMN',@level2name=N'SortID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用（0、正常   1、禁用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardType', @level2type=N'COLUMN',@level2name=N'Nullity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardType', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

/****** Object:  Table [dbo].[AwardUser]    Script Date: 2018/8/31 17:00:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AwardUser](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Compellation] [nvarchar](20) NOT NULL,
	[MobilePhone] [nvarchar](11) NOT NULL,
	[Province] [nvarchar](11) NOT NULL,
	[City] [nvarchar](11) NOT NULL,
	[Area] [nvarchar](11) NOT NULL,
	[DetailAddress] [nvarchar](80) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AwardUser] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AwardUser] ADD  CONSTRAINT [DF_DefaultAddress_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[AwardUser] ADD  CONSTRAINT [DF_DefaultAddress_Compellation]  DEFAULT ('') FOR [Compellation]
GO

ALTER TABLE [dbo].[AwardUser] ADD  CONSTRAINT [DF_DefaultAddress_MobilePhone]  DEFAULT ('') FOR [MobilePhone]
GO

ALTER TABLE [dbo].[AwardUser] ADD  CONSTRAINT [DF_DefaultAddress_Province]  DEFAULT ((0)) FOR [Province]
GO

ALTER TABLE [dbo].[AwardUser] ADD  CONSTRAINT [DF_DefaultAddress_City]  DEFAULT ((0)) FOR [City]
GO

ALTER TABLE [dbo].[AwardUser] ADD  CONSTRAINT [DF_DefaultAddress_Area]  DEFAULT ((0)) FOR [Area]
GO

ALTER TABLE [dbo].[AwardUser] ADD  CONSTRAINT [DF_DefaultAddress_DetailAddress]  DEFAULT ('') FOR [DetailAddress]
GO

ALTER TABLE [dbo].[AwardUser] ADD  CONSTRAINT [DF_DefaultAddress_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardUser', @level2type=N'COLUMN',@level2name=N'RecordID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardUser', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardUser', @level2type=N'COLUMN',@level2name=N'Compellation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardUser', @level2type=N'COLUMN',@level2name=N'MobilePhone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardUser', @level2type=N'COLUMN',@level2name=N'Province'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'市标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardUser', @level2type=N'COLUMN',@level2name=N'City'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardUser', @level2type=N'COLUMN',@level2name=N'Area'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardUser', @level2type=N'COLUMN',@level2name=N'DetailAddress'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AwardUser', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO


USE [WHQJPlatformManagerDB]
GO
/****** Object:  Table [dbo].[Base_Module]    Script Date: 2018/6/14 9:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Base_Module](
	[ModuleID] [int] NOT NULL,
	[ParentID] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[Link] [nvarchar](256) NOT NULL,
	[OrderNo] [int] NOT NULL,
	[Nullity] [bit] NOT NULL,
	[IsMenu] [bit] NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[ManagerPopedom] [int] NOT NULL,
 CONSTRAINT [PK_Base_Module] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Base_ModulePermission]    Script Date: 2018/6/14 9:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Base_ModulePermission](
	[ModuleID] [int] NOT NULL,
	[PermissionTitle] [nvarchar](128) NOT NULL,
	[PermissionValue] [bigint] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[StateFlag] [int] NOT NULL,
	[ParentID] [int] NOT NULL,
 CONSTRAINT [PK_Base_ModulePermission_1] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC,
	[PermissionValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Base_RolePermission]    Script Date: 2018/6/14 9:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Base_RolePermission](
	[RoleID] [int] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[ManagerPermission] [bigint] NOT NULL,
	[OperationPermission] [bigint] NOT NULL,
	[StateFlag] [int] NOT NULL,
 CONSTRAINT [PK_Base_RolePermission] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Base_Roles]    Script Date: 2018/6/14 9:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Base_Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Base_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Base_Users]    Script Date: 2018/6/14 9:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Base_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[PreLogintime] [datetime] NOT NULL,
	[PreLoginIP] [nvarchar](50) NOT NULL,
	[LastLogintime] [datetime] NOT NULL,
	[LastLoginIP] [nvarchar](50) NOT NULL,
	[LoginTimes] [int] NOT NULL,
	[IsBand] [int] NOT NULL,
	[BandIP] [nvarchar](50) NOT NULL,
	[IsAssist] [tinyint] NOT NULL,
 CONSTRAINT [PK_Base_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemSecurity]    Script Date: 2018/6/14 9:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemSecurity](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[OperatingTime] [datetime] NOT NULL,
	[OperatingName] [nvarchar](50) NOT NULL,
	[OperatingIP] [nvarchar](50) NOT NULL,
	[OperatingAccounts] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Base_Module] ADD  CONSTRAINT [DF_Base_Module_ParentID]  DEFAULT ((0)) FOR [ParentID]
GO
ALTER TABLE [dbo].[Base_Module] ADD  CONSTRAINT [DF_Base_Module_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[Base_Module] ADD  CONSTRAINT [DF_Base_Module_Link]  DEFAULT ('') FOR [Link]
GO
ALTER TABLE [dbo].[Base_Module] ADD  CONSTRAINT [DF_Base_Module_OrderNo]  DEFAULT ((0)) FOR [OrderNo]
GO
ALTER TABLE [dbo].[Base_Module] ADD  CONSTRAINT [DF_Base_Module_IsMenu]  DEFAULT ((0)) FOR [IsMenu]
GO
ALTER TABLE [dbo].[Base_Module] ADD  CONSTRAINT [DF_Base_Module_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Base_Module] ADD  CONSTRAINT [DF_Base_Module_ManagerPopedom]  DEFAULT ((0)) FOR [ManagerPopedom]
GO
ALTER TABLE [dbo].[Base_Users] ADD  CONSTRAINT [DF_Base_Users_Flag]  DEFAULT ((0)) FOR [Nullity]
GO
ALTER TABLE [dbo].[Base_Users] ADD  CONSTRAINT [DF_Base_Users_PreLogintime]  DEFAULT (getdate()) FOR [PreLogintime]
GO
ALTER TABLE [dbo].[Base_Users] ADD  CONSTRAINT [DF_Base_Users_PreLoginIP]  DEFAULT ('000.000.000.000') FOR [PreLoginIP]
GO
ALTER TABLE [dbo].[Base_Users] ADD  CONSTRAINT [DF_Base_Users_LastLogintime]  DEFAULT (getdate()) FOR [LastLogintime]
GO
ALTER TABLE [dbo].[Base_Users] ADD  CONSTRAINT [DF_Base_Users_LastLoginIP]  DEFAULT ('000.000.000.000') FOR [LastLoginIP]
GO
ALTER TABLE [dbo].[Base_Users] ADD  CONSTRAINT [DF_Base_Users_LoginTimes]  DEFAULT ((0)) FOR [LoginTimes]
GO
ALTER TABLE [dbo].[Base_Users] ADD  CONSTRAINT [DF_Base_Users_IsBand]  DEFAULT ((1)) FOR [IsBand]
GO
ALTER TABLE [dbo].[Base_Users] ADD  CONSTRAINT [DF_Base_Users_BandIP]  DEFAULT ('000.000.000.000') FOR [BandIP]
GO
ALTER TABLE [dbo].[Base_Users] ADD  CONSTRAINT [DF_Base_Users_IsAssist]  DEFAULT ((0)) FOR [IsAssist]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'ModuleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级模块标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'Link'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'OrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用 0: 启用 ; 1:禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否菜单 0:不是 ; 1:是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'IsMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ModulePermission', @level2type=N'COLUMN',@level2name=N'ModuleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ModulePermission', @level2type=N'COLUMN',@level2name=N'PermissionTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ModulePermission', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父模块标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ModulePermission', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_RolePermission', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_RolePermission', @level2type=N'COLUMN',@level2name=N'ModuleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_RolePermission', @level2type=N'COLUMN',@level2name=N'ManagerPermission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_RolePermission', @level2type=N'COLUMN',@level2name=N'OperationPermission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Roles', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Roles', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Roles', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Users', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Users', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Users', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Users', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'冻结标志 0-启用，1-冻结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Users', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定IP 0-绑定 1-未绑定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Users', @level2type=N'COLUMN',@level2name=N'IsBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有运营助手权限(0:无权限,1:有权限)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Users', @level2type=N'COLUMN',@level2name=N'IsAssist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemSecurity', @level2type=N'COLUMN',@level2name=N'OperatingAccounts'
GO






USE [WHQJRecordDB]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordAwardTicketSerial](
	[SerialNumber] [nvarchar](19) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[CurAwardTicket] [bigint] NOT NULL,
	[ChangeAwardTicket] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordAwardTicketSerial] PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_SerialNumber]  DEFAULT ('') FOR [SerialNumber]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_MasterID]  DEFAULT ((0)) FOR [MasterID]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_CurAwardTicket]  DEFAULT ((0)) FOR [CurAwardTicket]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_ChangeAwardTicket]  DEFAULT ((0)) FOR [ChangeAwardTicket]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'SerialNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 系统标识   大于0表示操作管理员或操作员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'MasterID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型（0 后台赠送,10兑换花费）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'TypeID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作前奖券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'CurAwardTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作奖券（正数表示加，负数表示减）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'ChangeAwardTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

/****** Object:  Table [dbo].[RecordGrantAwardTicket]    Script Date: 2018/8/14 16:26:16 ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordGrantAwardTicket](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[CurAwardTicket] [bigint] NOT NULL,
	[AddAwardTicket] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[CollectNote] [nvarchar](63) NOT NULL,
 CONSTRAINT [PK_RecordGrantAwardTicket] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_MasterID]  DEFAULT ((1)) FOR [MasterID]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_CurAwardTicket]  DEFAULT ((0)) FOR [CurAwardTicket]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_AddAwardTicket]  DEFAULT ((0)) FOR [AddAwardTicket]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_Reason]  DEFAULT ('') FOR [CollectNote]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'MasterID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送类型（0、系统后台赠送 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'TypeID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送前奖券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'CurAwardTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送奖券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'AddAwardTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO


USE [WHQJTreasureDB]
GO

/****** Object:  Table [dbo].[OnLineWeChat]    Script Date: 2018/7/18 15:43:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OnLineWeChat](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigName] [nvarchar](30) NOT NULL,
	[WeChat] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](32) NOT NULL,
	[SortID] [int] NOT NULL,
	[TagID] [tinyint] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OnLineWeChat] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[OnLineWeChat] ADD  CONSTRAINT [DF_OnLineWeChat_ConfigName]  DEFAULT ('') FOR [ConfigName]
GO

ALTER TABLE [dbo].[OnLineWeChat] ADD  CONSTRAINT [DF_OnLineWeChat_WeChat]  DEFAULT ('') FOR [WeChat]
GO

ALTER TABLE [dbo].[OnLineWeChat] ADD  CONSTRAINT [DF_OnLineWeChat_NickName]  DEFAULT ('') FOR [NickName]
GO

ALTER TABLE [dbo].[OnLineWeChat] ADD  CONSTRAINT [DF_OnLineWeChat_SortID]  DEFAULT ((0)) FOR [SortID]
GO

ALTER TABLE [dbo].[OnLineWeChat] ADD  CONSTRAINT [DF_OnLineWeChat_TagType]  DEFAULT ((0)) FOR [TagID]
GO

ALTER TABLE [dbo].[OnLineWeChat] ADD  CONSTRAINT [DF_OnLineWeChat_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO

ALTER TABLE [dbo].[OnLineWeChat] ADD  CONSTRAINT [DF_OnLineWeChat_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineWeChat', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineWeChat', @level2type=N'COLUMN',@level2name=N'ConfigName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'微信号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineWeChat', @level2type=N'COLUMN',@level2name=N'WeChat'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'微信昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineWeChat', @level2type=N'COLUMN',@level2name=N'NickName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识（从大到小）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineWeChat', @level2type=N'COLUMN',@level2name=N'SortID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签标记（0、普通  1、人气）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineWeChat', @level2type=N'COLUMN',@level2name=N'TagID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用（0、正常  1、禁用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineWeChat', @level2type=N'COLUMN',@level2name=N'Nullity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineWeChat', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DrawalOrder]') AND type IN ('U'))
	DROP TABLE [dbo].[DrawalOrder]
GO

CREATE TABLE [dbo].[DrawalOrder] (
  [OrderID] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [UserID] int  NOT NULL,
  [MasterID] int  NULL,
  [Amount] money  NOT NULL,
  [OrderState] tinyint  NOT NULL,
  [OrderCost] money  NOT NULL,
  [IP] nvarchar(15) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [CurrentTime] datetime  NOT NULL,
  [DealTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[DrawalOrder] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单号',
'SCHEMA', N'dbo',
'TABLE', N'DrawalOrder',
'COLUMN', N'OrderID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'提款玩家',
'SCHEMA', N'dbo',
'TABLE', N'DrawalOrder',
'COLUMN', N'UserID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'后台操作id',
'SCHEMA', N'dbo',
'TABLE', N'DrawalOrder',
'COLUMN', N'MasterID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'提款金额',
'SCHEMA', N'dbo',
'TABLE', N'DrawalOrder',
'COLUMN', N'Amount'
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单状态(1 未处理，2同意，3拒绝)',
'SCHEMA', N'dbo',
'TABLE', N'DrawalOrder',
'COLUMN', N'OrderState'
GO

EXEC sp_addextendedproperty
'MS_Description', N'手续费',
'SCHEMA', N'dbo',
'TABLE', N'DrawalOrder',
'COLUMN', N'OrderCost'
GO

ALTER TABLE [dbo].[DrawalOrder] ADD CONSTRAINT [PK_DrawalOrder] PRIMARY KEY CLUSTERED ([OrderID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO
