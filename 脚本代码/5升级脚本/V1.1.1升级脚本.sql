--�̳�ϵͳ��Ϊ�һ�ϵͳ
USE WHQJPlatformManagerDB
GO
UPDATE dbo.Base_Module SET Title='�һ�ϵͳ' WHERE ModuleID=11

--ȥ������汾
USE WHQJAccountsDB
go
DELETE FROM  dbo.SystemStatusInfo WHERE StatusName='AgentHomeVersion'
update [SystemStatusInfo] set StatusDescription='��ֵ��0-�ޣ�1-΢�Źٷ���2-֧�����ٷ���3-΢��,֧�����ٷ�������֧����4-����ͨ��7-ȫ��' where StatusName='JJPayChannel' 
GO 


--ȥ��ע�����
USE WHQJAccountsDB
go
DELETE FROM  dbo.SystemStatusInfo WHERE StatusName='EnjoinRegister'
GO 




