----------------------------------------------------------------------------------------------------
-- ��Ȩ��2011
-- ʱ�䣺2012-02-23
-- ��;���ֻ���¼���ݻ�ȡ
----------------------------------------------------------------------------------------------------

USE WHQJNativeWebDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PW_GetMobileLoginData') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PW_GetMobileLoginData
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------

CREATE PROCEDURE NET_PW_GetMobileLoginData

WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- ִ���߼�
BEGIN
	
	-- ��ȡϵͳ����
	SELECT StatusName,StatusValue FROM WHQJAccountsDB.dbo.SystemStatusInfo WITH(NOLOCK)

	-- ��ȡ�ͷ�����
	SELECT Field1 AS Link,Field2 AS Number1,Field3 AS Name1,Field4 AS Type1,Field5 AS Number2,Field6 AS Name2,Field7 AS Type2,Field8 AS Number3,Field9 AS Name3,Field10 AS Type3 FROM ConfigInfo WITH(NOLOCK) WHERE ConfigKey =N'SysCustomerService'

	-- ��ȡϵͳ����
	SELECT NoticeID,NoticeTitle,MoblieContent,PublisherTime,Publisher FROM SystemNotice WITH(NOLOCK) WHERE Nullity=0 ORDER BY IsTop DESC,SortID ASC,NoticeID DESC

	-- ��ȡ�����Դ
	SELECT Title,ResourceURL,LinkURL,SortID,PlatformType FROM Ads WITH(NOLOCK) WHERE [Type] = 3 ORDER BY SortID ASC

	SELECT Title,ResourceURL,LinkURL,SortID,PlatformType FROM Ads WITH(NOLOCK) WHERE [Type] = 4 ORDER BY SortID ASC

	---��ȡ���߹������
	SELECT isnull(ExchangeRatio,0) FROM [WHQJPlatformDB].dbo.GameProperty WITH(NOLOCK) WHERE ID=306 and ExchangeType=0--��ʯ����
	SELECT isnull(ExchangeRatio,0) FROM [WHQJPlatformDB].dbo.GameProperty WITH(NOLOCK) WHERE ID=306 and ExchangeType=1--��ҹ���
	  ----�����
	 SELECT Title,ResourceURL,LinkURL,Type ,SortID,PlatformType FROM Ads WITH(NOLOCK) WHERE 6 = 6 ORDER BY SortID ASC
	 ---ǩ����Ʒ����
	 select GoodsID,GamePackageGoods.PackageID,GamePackageGoods.TypeID,GamePackage.TypeID as PackageTypeID, ResourceURL,Name,SortID  from  [WHQJPlatformDB].dbo.GamePackageGoods left join  [WHQJPlatformDB].dbo.[GamePackage] on GamePackageGoods.PackageID=[GamePackage].PackageID  ORDER BY SortID ASC

	 --����Ȧ��������
	 SELECT OptionName,OptionValue FROM [WHQJGroupDB].dbo.[IMGroupOption] WITH(NOLOCK)
	   
END

RETURN 0

GO