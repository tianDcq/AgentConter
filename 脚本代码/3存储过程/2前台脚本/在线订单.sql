----------------------------------------------------------------------
-- ��Ȩ��2017
-- ʱ�䣺2017-04-27
-- ��;�����߶���
----------------------------------------------------------------------

USE [WHQJTreasureDB]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PW_CreateOnLineOrder') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PW_CreateOnLineOrder
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------------------------
-- ���붩��
CREATE PROCEDURE NET_PW_CreateOnLineOrder
	@dwUserID			INT,						-- �����û�
	@payType			INT,						-- ��ֵ����
	@payChanle          INT,                        -- ��ֵ����
	@amount             DECIMAL(18,2),              -- ��ֵ���
	@present            DECIMAL(18,2),              -- �Ż�
	@strOrderID			NVARCHAR(32),				-- ������ʶ
	@strIPAddress		NVARCHAR(15),				-- ֧����ַ
	@errCode	        INT OUTPUT		-- �����Ϣ
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- �ʺ�����
DECLARE @Accounts NVARCHAR(31)
DECLARE @NickName NVARCHAR(31)
DECLARE @UserID INT
DECLARE @GameID INT
DECLARE @SpreaderID INT
DECLARE @Nullity TINYINT

-- ִ���߼�
BEGIN
	SET @errCode=0
	-- ��ȡ�û���Ϣ
	SELECT @UserID=UserID,@SpreaderID=SpreaderID,@Accounts=Accounts,@NickName=NickName,@Nullity=Nullity,@GameID=GameID FROM WHQJAccountsDBLink.WHQJAccountsDB.dbo.AccountsInfo WITH(NOLOCK) WHERE UserID = @dwUserID
	IF @UserID IS NULL
	BEGIN
		SET @errCode=2006
		RETURN 2006
	END
	IF @Nullity=1
	BEGIN
		SET @errCode=2007
		RETURN 2007
	END
	-- �����ظ���֤
	DECLARE @OrderID NVARCHAR(32)
	SELECT @OrderID=OrderID FROM OnlinePayOrder WITH(NOLOCK) WHERE OrderID = @strOrderID
	IF @OrderID IS NOT NULL
	BEGIN
		SET @errCode=2005
		RETURN 2005
	END

	-- д�붩����Ϣ
	INSERT INTO OnlinePayOrder(OrderID,GameId,UserId,NickName,Amount,PresentScore,ChannelId,PayType,OrderStates,MasterId,PayTime,Addrstr)
	VALUES(@strOrderID,@GameID,@UserID,@NickName,@amount,@present,@payChanle,@PayType,0,0, GETDATE(),@strIPAddress)
	IF @@ROWCOUNT<>1
	  BEGIN
        SET @errCode=1003
        RETURN 1003
       END
	SET @errCode=1
END
RETURN 0
GO