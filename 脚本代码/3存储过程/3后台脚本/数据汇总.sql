----------------------------------------------------------------------
-- ʱ�䣺2011-10-20
-- ��;�����ݻ���ͳ�ơ�
----------------------------------------------------------------------
USE WHQJTreasureDB
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PM_StatInfo') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PM_StatInfo
GO

----------------------------------------------------------------------
CREATE PROC NET_PM_StatInfo
			
WITH ENCRYPTION AS

-- ʱ������
DECLARE @CurentTime NVARCHAR(10)
DECLARE @StartTime DATETIME
DECLARE @EndTime DATETIME

-- ͳ������
DECLARE @TotalUser BIGINT
DECLARE @WebRegisterUser INT
DECLARE @GameRegisterUser INT
DECLARE @H5RegisterUser INT

DECLARE @Score BIGINT
DECLARE @InsureScore BIGINT
DECLARE @PayScoreAmount DECIMAL(18,2)
DECLARE @PayScore BIGINT

DECLARE @Diamond BIGINT
DECLARE @PayDiamondAmount DECIMAL(18,2)
DECLARE @PayDiamond BIGINT

DECLARE @Revenue BIGINT
DECLARE @TotalRevenue BIGINT
DECLARE @InsureRevenue BIGINT
DECLARE @TotalInsureRevenue BIGINT

DECLARE @Waste BIGINT
DECLARE @TotalWaste BIGINT

DECLARE @ScoreRoomCount BIGINT
DECLARE @GoldRoomCount BIGINT

DECLARE @TotalAmount DECIMAL(18,2)
DECLARE @Amount DECIMAL(18,2)

BEGIN
	-- ʱ������
	SET @CurentTime = CONVERT(VARCHAR(10),GETDATE(),120) 
	SET @StartTime = CAST((@CurentTime + ' 00:00:00') AS DATETIME)
	SET @EndTime = CAST((@CurentTime + ' 23:59:59') AS DATETIME)

	-- �û���Ϣ
	SELECT @TotalUser=COUNT(UserID) FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE IsAndroid=0
	SELECT @WebRegisterUser=COUNT(UserID) FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE RegisterDate>=@StartTime AND RegisterDate<=@EndTime 
	AND IsAndroid=0 AND RegisterOrigin>=80 AND RegisterOrigin<90
	SELECT @H5RegisterUser=COUNT(UserID) FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE RegisterDate>=@StartTime AND RegisterDate<=@EndTime 
	AND IsAndroid=0 AND RegisterOrigin=90
	SELECT @GameRegisterUser=COUNT(UserID) FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE RegisterDate>=@StartTime AND RegisterDate<=@EndTime 
	AND IsAndroid=0 AND RegisterOrigin<80

	-- ��Ϸ����Ϣ
	SELECT @Score=ISNULL(SUM(Score),0),@InsureScore=ISNULL(SUM(InsureScore),0) FROM GameScoreInfo(NOLOCK) 
	SELECT @PayScore=ISNULL(SUM(Amount+PresentScore),0),@PayScoreAmount=ISNULL(SUM(PayAmount),0) FROM OnLinePayOrder(NOLOCK) WHERE PayTime>=@StartTime AND PayTime<=@EndTime AND OrderStates>0
	SELECT @PayScore=ISNULL(SUM(Amount+PresentScore),0)+@PayScore,@PayScoreAmount=ISNULL(SUM(Amount),0)+@PayScoreAmount FROM BankPayOrder(NOLOCK) WHERE PayTime>=@StartTime AND PayTime<=@EndTime AND OrderStates=1
	SELECT @PayScore=ISNULL(SUM(Amount+PresentScore),0)+@PayScore,@PayScoreAmount=ISNULL(SUM(Amount),0)+@PayScoreAmount FROM ImgPayOrder(NOLOCK) WHERE PayTime>=@StartTime AND PayTime<=@EndTime AND OrderStates=1


	-- ��ʯ��Ϣ
	SELECT @Diamond=ISNULL(SUM(Diamond),0) FROM UserCurrency(NOLOCK)

	-- ��ֵ��Ϣ
	SELECT @Amount=ISNULL(SUM(PayAmount),0) FROM OnLinePayOrder(NOLOCK) WHERE PayTime>=@StartTime AND PayTime<=@EndTime AND OrderStates>0
	SELECT @Amount=ISNULL(SUM(Amount),0)+@Amount FROM BankPayOrder(NOLOCK) WHERE PayTime>=@StartTime AND PayTime<=@EndTime AND OrderStates=1
	SELECT @Amount=ISNULL(SUM(Amount),0)+@Amount FROM ImgPayOrder(NOLOCK) WHERE PayTime>=@StartTime AND PayTime<=@EndTime AND OrderStates=1

	SELECT @TotalAmount=ISNULL(SUM(PayAmount),0) FROM OnLinePayOrder(NOLOCK) WHERE OrderStates>0
	SELECT @TotalAmount=ISNULL(SUM(Amount),0)+@TotalAmount FROM BankPayOrder(NOLOCK) WHERE OrderStates=1
	SELECT @TotalAmount=ISNULL(SUM(Amount),0)+@TotalAmount FROM ImgPayOrder(NOLOCK) WHERE OrderStates=1


	-- ˰����Ϣ
	SELECT @TotalRevenue=ISNULL(SUM(Revenue),0),@TotalWaste=ISNULL(SUM(Waste),0) FROM RecordDrawInfo(NOLOCK)
	SELECT @Revenue=ISNULL(SUM(Revenue),0),@Waste=ISNULL(SUM(Waste),0) FROM RecordDrawInfo(NOLOCK) WHERE StartTime>=@StartTime AND StartTime<=@EndTime
	SELECT @InsureRevenue=ISNULL(SUM(Revenue),0) FROM RecordInsure(NOLOCK) WHERE CollectDate>=@StartTime AND CollectDate<=@EndTime
	SELECT @TotalInsureRevenue=ISNULL(SUM(Revenue),0) FROM RecordInsure(NOLOCK) 

	-- ������Ϣ
	SELECT @ScoreRoomCount=COUNT(RecordID) FROM WHQJPlatformDB.dbo.StreamCreateTableFeeInfo(NOLOCK) WHERE CreateDate>=@StartTime AND CreateDate<=@EndTime AND PlayMode=0 AND RoomScoreInfo IS NOT NULL
	SELECT @GoldRoomCount=COUNT(RecordID) FROM WHQJPlatformDB.dbo.StreamCreateTableFeeInfo(NOLOCK) WHERE CreateDate>=@StartTime AND CreateDate<=@EndTime AND PlayMode=1 AND RoomScoreInfo IS NOT NULL

	-- �������
	SELECT	 @TotalUser AS TotalUser,
			 @WebRegisterUser AS WebRegisterUser,
			 @GameRegisterUser AS GameRegisterUser,
			 @H5RegisterUser AS H5RegisterUser,
			 @Score AS Score,
			 @InsureScore AS InsureScore,
			 @PayScoreAmount AS PayScoreAmount,
			 @PayScore AS PayScore,
			 @Diamond AS Diamond,
			 @PayDiamondAmount AS PayDiamondAmount,
			 @PayDiamond AS PayDiamond,
			 @Revenue AS Revenue,
			 @TotalRevenue AS TotalRevenue,
			 @InsureRevenue AS InsureRevenue,
			 @TotalInsureRevenue AS TotalInsureRevenue,
			 @ScoreRoomCount AS ScoreRoomCount,
			 @GoldRoomCount AS GoldRoomCount,
			 @TotalAmount AS TotalAmount,
			 @Amount AS Amount,
			 @TotalWaste AS TotalWaste,
			 @Waste AS Waste

END
