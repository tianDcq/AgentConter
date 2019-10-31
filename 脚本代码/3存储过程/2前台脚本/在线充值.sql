----------------------------------------------------------------------
-- ��Ȩ��2017
-- ʱ�䣺2018-04-27
-- ��;�����߳�ֵ
----------------------------------------------------------------------

USE [WHQJTreasureDB]
GO

-- ���߳�ֵ
IF EXISTS (SELECT *
FROM DBO.SYSOBJECTS
WHERE ID = OBJECT_ID(N'[dbo].NET_PW_FinishOnLineOrder') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PW_FinishOnLineOrder
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

---------------------------------------------------------------------------------------
-- ���߳�ֵ
CREATE PROCEDURE NET_PW_FinishOnLineOrder
	@strOrdersID		NVARCHAR(32),
	@callType           TINYINT,
	--	�������
	@PayAmount			DECIMAL(18,2),
	--	�û��ʺ�
	@OrderAddress       NVARCHAR(15),
	@strErrorDescribe	NVARCHAR(127) OUTPUT
--	�����Ϣ
WITH
	ENCRYPTION
AS

-- ��������
SET NOCOUNT ON

-- ������Ϣ

DECLARE @UserID INT
DECLARE @Amount DECIMAL(18,2)
DECLARE @PresentScore INT
DECLARE @OrderStatus TINYINT

--�˺���Ϣ
DECLARE @Nullity TINYINT
DECLARE @BeforeScore BIGINT
DECLARE @BeforeInsure BIGINT

DECLARE @RegisterIP NVARCHAR(15)
DECLARE @RegisterDate DATETIME
DECLARE @RegisterMachine NVARCHAR(32)
DECLARE @DateTime DATETIME
-- ִ���߼�
BEGIN
	SET @DateTime=GETDATE()
	-- ������ѯ
	SELECT @UserID=UserID, @Amount=Amount, @PresentScore=PresentScore, @OrderStatus=OrderStates
	FROM OnLinePayOrder WITH(NOLOCK)
	WHERE OrderID = @strOrdersID
	IF @UserID IS NULL
	BEGIN
		SET @strErrorDescribe=N'��Ǹ����ֵ����������!'
		RETURN 1001
	END
	IF @OrderStatus<>0
	BEGIN
		SET @strErrorDescribe=N'��Ǹ����ֵ���������!'
		RETURN 1002
	END
	-- ��ȡ�û���Ϣ
	SELECT @Nullity=Nullity, @RegisterIP=RegisterIP, @RegisterDate=RegisterDate, @RegisterMachine=RegisterMachine
	FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK)
	WHERE UserID = @UserID
	IF @Nullity IS NULL
	BEGIN
		SET @strErrorDescribe=N'��Ǹ����ֵ�˺Ų����ڣ�'
		RETURN 1004
	END
	IF @Nullity=1
	BEGIN
		SET @strErrorDescribe=N'��Ǹ����ֵ�˺��Ѷ���״̬��'
		RETURN 1005
	END
	--ˢ��״̬
	UPDATE OnLinePayOrder SET OrderStates = @callType,PayAmount = @PayAmount,CallTime=@DateTime WHERE OrderID = @strOrdersID AND UserID = @UserID
	--��ȡ�û����
	SELECT @BeforeScore = Score, @BeforeInsure=InsureScore
	FROM WHQJTreasureDB.DBO.GameScoreInfo(NOLOCK)
	WHERE UserID = @UserID
	IF @BeforeScore IS NULL 
	BEGIN
		INSERT WHQJTreasureDB.DBO.GameScoreInfo
			(UserID,Score,RegisterIP,RegisterDate,RegisterMachine)
		VALUES
			(@UserID, 0, @RegisterIP, @RegisterDate, @RegisterMachine)
		SET @BeforeScore = 0
		SET @BeforeInsure =0
	END
	--�ٱ�
	DECLARE @CheckOut TINYINT
	IF EXISTS(SELECT 1
	FROM GameScoreLocker
	WHERE UserID=@UserID)
	 	BEGIN
		--�ӱ�����
		UPDATE GameScoreInfo SET InsureScore = InsureScore + @Amount+@PresentScore WHERE UserID = @UserID
		SET @CheckOut=2
	END
	ELSE
		BEGIN
		--�ӱ���
		UPDATE GameScoreInfo SET Score = Score + @Amount+@PresentScore WHERE UserID = @UserID
		SET @CheckOut=1
	END

	--ˢ�¶���״̬
	UPDATE OnLinePayOrder SET CheckOut = @CheckOut WHERE OrderID = @strOrdersID AND UserID = @UserID
	--д����ˮ
	INSERT INTO WHQJRecordDB.dbo.RecordTreasureSerial
		(SerialNumber,MasterID,UserID,TypeID,CurScore,CurInsureScore,ChangeScore,ClientIP,CollectDate)
	VALUES(dbo.WF_GetSerialNumber(), 0, @UserID, 12, @BeforeScore, @BeforeInsure, @Amount+@PresentScore, @OrderAddress, @DateTime)
	--���Ӵ�����

	--  ��ֵ����������
	DECLARE @PayMultiple INT
	-- 	��ֵ�ʹ��뱶��
	DECLARE @SendMultiple INT
	SELECT @PayMultiple=CONVERT(INT,Field1) , @SendMultiple=CONVERT(INT,Field2) FROM WHQJNativeWebDB.dbo.ConfigInfo (NOLOCK) WHERE ConfigID=5
	DECLARE @VileBet BIGINT
	SET @VileBet =@Amount*@PayMultiple/100+@PresentScore*@SendMultiple/100;
	DECLARE @ErrorDescribe	NVARCHAR(127)
	DECLARE @Return INT
	EXEC @Return=NET_PB_Deposit 1,@UserID,1,@strOrdersID,@VileBet,@ErrorDescribe OUTPUT
	IF @Return!=0
	BEGIN
		SET @strErrorDescribe = @ErrorDescribe
		RETURN @Return
	END
	ELSE 
	BEGIN
		SET @strErrorDescribe = N'��ֵ���˳ɹ�'
	END
END
RETURN 0
GO
