USE [WHQJTreasureDB]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[NET_PB_DELETEORDER]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[NET_PB_DELETEORDER]
GO


SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

--------------------------------------------------------------------	
--
CREATE PROC [NET_PB_DELETEORDER]

WITH ENCRYPTION AS

-- 属性设置
SET NOCOUNT ON

BEGIN
    DELETE OnLinePayOrder WHERE OrderStates=1 AND DateDiff(dd,PayTime,GetDate())>1
    INSERT INTO WHQJRecordDB.dbo.DrawalOrder_copy1 SELECT * FROM DrawalOrder WHERE DateDiff(dd,CurrentTime,GetDate())>30
    DELETE DrawalOrder WHERE DateDiff(dd,CurrentTime,GetDate())>30
    INSERT INTO WHQJRecordDB.dbo.OnLinePayOrder_copy1 SELECT * FROM OnLinePayOrder WHERE DateDiff(dd,PayTime,GetDate())>30
    DELETE OnLinePayOrder WHERE DateDiff(dd,PayTime,GetDate())>30
    INSERT INTO WHQJRecordDB.dbo.BankPayOrder_copy1 SELECT * FROM BankPayOrder WHERE DateDiff(dd,PayTime,GetDate())>30
    DELETE BankPayOrder WHERE DateDiff(dd,PayTime,GetDate())>30
    INSERT INTO WHQJRecordDB.dbo.ImgPayOrder_copy1 SELECT * FROM ImgPayOrder WHERE DateDiff(dd,PayTime,GetDate())>30
    DELETE ImgPayOrder WHERE DateDiff(dd,PayTime,GetDate())>30

    INSERT INTO WHQJRecordDB.dbo.AgentCountRecord_copy1 SELECT * FROM WHQJRecordDB.dbo.AgentCountRecord WHERE DateDiff(dd,CountTime,GetDate())>15
    DELETE WHQJRecordDB.dbo.AgentCountRecord WHERE DateDiff(dd,CountTime,GetDate())>15
    DELETE ValiBetRecord WHERE DateDiff(dd,DepositTime,GetDate())>30
    DELETE WHQJRecordDB.dbo.RecordAgentReward WHERE DateDiff(dd,drawalTime,GetDate())>30
    DELETE WHQJPlatformDB.dbo.UserMail WHERE DateDiff(dd,SendTime,GetDate())>15
END
RETURN 0
GO