﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using Game.Kernel;
using Game.IData;
using Game.Entity.Treasure;
using Game.Entity.Record;

namespace Game.Data
{
    /// <summary>
    /// 金币库数据层
    /// </summary>
    public class TreasureDataProvider : BaseDataProvider, ITreasureDataProvider
    {
        #region 构造方法

        public TreasureDataProvider(string connString)
            : base(connString)
        {
        }

        #endregion

        #region 公用分页
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="where">查询条件</param>
        /// <param name="order">排序</param>
        /// <param name="pageIndex">页下标</param>
        /// <param name="pageSize">页显示数</param>
        /// <param name="fields">查询字段</param>
        /// <returns></returns>
        public PagerSet GetList(string tableName, string where, string order, int pageIndex, int pageSize, string[] fields = null)
        {
            PagerParameters pagerPrams = new PagerParameters(tableName, where, order, pageIndex, pageSize, fields);
            return GetPagerSet(pagerPrams);
        }
        public PagerSet GetListLock(string tableName, string where, string order, int pageIndex, int pageSize, string fields = null)
        {
            PagerSet ps = new PagerSet();
            ps.PageIndex = pageIndex;
            ps.PageSize = pageSize;
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("TableName", tableName),
                Database.MakeInParam("ReturnFields", fields),
                Database.MakeInParam("PageSize", pageSize),
                Database.MakeInParam("PageIndex", pageIndex),
                Database.MakeInParam("Where", where),
                Database.MakeInParam("Order", order),
                Database.MakeOutParam("PageCount", typeof(int)),
                Database.MakeOutParam("RecordCount", typeof(int)),
                Database.MakeInParam("Lock ", " "),
            };
            DataSet ds= Database.ExecuteDataset(CommandType.StoredProcedure, "WEB_PageView_New", prams.ToArray());
            ps.PageSet = ds;
            ps.PageCount = Convert.ToInt32(prams[6].Value);
            ps.RecordCount = Convert.ToInt32(prams[7].Value);
            return ps;
        }


        #endregion 公用分页

        #region
        public decimal GetTotleDrawalMoney(string where)
        {
            string sql = $"SELECT ISNULL(SUM(Amount),0) AS Amount FROM DrawalOrder {where} AND OrderState=1";
            return Convert.ToDecimal(Database.ExecuteScalar(CommandType.Text, sql));
        }

        public DrawalOrder GetOrderById(string orderid)
        {
            string sql = $"SELECT * FROM DrawalOrder WITH(NOLOCK) WHERE OrderID ='{orderid}'";
            return Database.ExecuteObject<DrawalOrder>(sql);
        }

        public Message DealDralwalOrder(string orderid, int states, int master, string ip)
        {
            List<DbParameter> prams = new List<DbParameter>
            {
                Database.MakeInParam("masterID", master),
                Database.MakeInParam("strOrdersID", orderid),
                Database.MakeInParam("State", states),
                Database.MakeInParam("strClientIP", ip),
                Database.MakeOutParam("strErrorDescribe", typeof(string), 127)
            };
            return MessageHelper.GetMessage(Database, "NET_PW_DealDrawarOrder", prams);
        }

        #endregion


        #region 线上充值配置
        public bool CheckOrder(int type)
        {
            string sqlQuery = "";
            switch (type)
            {
                case 1:
                    sqlQuery = "SELECT * FROM DrawalOrder (NOLOCK) WHERE  CurrentTime> DATEADD(minute,-1,GETDATE()) AND OrderState=0";
                    break;
                case 2:
                    sqlQuery = "SELECT * FROM BankPayOrder (NOLOCK) WHERE  PayTime> DATEADD(minute,-1,GETDATE()) AND OrderState=0";
                    break;
                case 3:
                    sqlQuery = "SELECT * FROM ImgPayOrder (NOLOCK) WHERE  PayTime> DATEADD(minute,-1,GETDATE()) AND OrderState=0";
                    break;
            }
            return Database.ExecuteScalar(CommandType.Text, sqlQuery) != null;
        }


        public OnlinePayConfig GetOnlinePayConfig(int configId)
        {
            string sqlQuery = $"SELECT * FROM OnlinePayConfig WITH(NOLOCK) WHERE ID = '{configId}'";
            return Database.ExecuteObject<OnlinePayConfig>(sqlQuery);
        }

        public int SaveOnlinePayConfig(OnlinePayConfig config)
        {
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("PayType", config.PayType),
                Database.MakeInParam("PayName", config.PayName),
                Database.MakeInParam("UID", config.UID),
                Database.MakeInParam("PayUrl", config.PayUrl),
                Database.MakeInParam("Md5key", config.Md5key),
                Database.MakeInParam("PrivateKey", config.PrivateKey),
                Database.MakeInParam("PublicKey", config.PublicKey),
                Database.MakeInParam("MaxAmount", config.MaxAmount),
                Database.MakeInParam("MinAmount", config.MinAmount),
                Database.MakeInParam("ShoutCut", config.ShoutCut),
                Database.MakeInParam("PayIdentity", config.PayIdentity),
                Database.MakeInParam("SortID", config.SortID),
                Database.MakeInParam("PresentScore", config.PresentScore),
                Database.MakeInParam("FristPresent", config.FristPresent),
                Database.MakeInParam("ChanelID", config.ChanelID),
                Database.MakeInParam("Nullity", config.Nullity),
                Database.MakeInParam("ChanelName", config.ChanelName),
                Database.MakeInParam("AttachStr1", config.AttachStr1),
                Database.MakeInParam("AttachStr2", config.AttachStr1)
            };
            string sqlQuery;
            if (config.ID == 0)
            {
                sqlQuery = @"INSERT INTO OnlinePayConfig(PayType,PayName,UID,PayUrl,Md5key,PrivateKey,PublicKey,MinAmount,MaxAmount,ShoutCut,PayIdentity,SortID,PresentScore,FristPresent,Nullity,ChanelID,ChanelName,AttachStr1) 
                                        VALUES(@PayType,@PayName,@UID,@PayUrl,@Md5key,@PrivateKey,@PublicKey,@MinAmount,@MaxAmount,@ShoutCut,@PayIdentity,@SortID,@PresentScore,@FristPresent,@Nullity,@ChanelID,@ChanelName,@AttachStr1)";
            }
            else
            {
                prams.Add(Database.MakeInParam("ID", config.ID));
                StringBuilder sql = new StringBuilder();
                sql.Append("UPDATE OnlinePayConfig SET ")
                    .Append("PayType=@PayType, ")
                    .Append("PayName=@PayName, ")
                    .Append("UID=@UID, ")
                    .Append("PayUrl=@PayUrl, ")
                    .Append("Md5key=@Md5key, ")
                    .Append("PrivateKey=@PrivateKey, ")
                    .Append("PublicKey=@PublicKey, ")
                    .Append("MinAmount=@MinAmount, ")
                    .Append("MaxAmount=@MaxAmount, ")
                    .Append("ShoutCut=@ShoutCut, ")
                    .Append("PayIdentity=@PayIdentity, ")
                    .Append("SortID=@SortID, ")
                    .Append("PresentScore=@PresentScore, ")
                    .Append("FristPresent=@FristPresent, ")
                    .Append("ChanelID=@ChanelID, ")
                    .Append("ChanelName=@ChanelName, ")
                    .Append("AttaChStr1=@AttachStr1, ")
                    .Append("AttaChStr2=@AttachStr2, ")
                    .Append("Nullity=@Nullity ")
                    .Append("WHERE ID=@ID");
                sqlQuery = sql.ToString();
            }
            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }

        public int SaveImgPay(OfficalImgPay officalImgPay)
        {
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("ConfigName", officalImgPay.ConfigName),
                Database.MakeInParam("payType", officalImgPay.PayType),
                Database.MakeInParam("PayUrl", officalImgPay.PayUrl),
                Database.MakeInParam("MaxAmount", officalImgPay.MaxAmount),
                Database.MakeInParam("MinAmount", officalImgPay.MinAmount),
                Database.MakeInParam("SortId", officalImgPay.SortId),
                Database.MakeInParam("Nullity", officalImgPay.Nullity),
                Database.MakeInParam("Description", officalImgPay.Description)
            };
            string sqlQuery;
            if (officalImgPay.id == 0)
            {
                sqlQuery = @"INSERT INTO [dbo].[OfficalImgPay]( [ConfigName], [payType], [PayUrl], [MaxAmount], [MinAmount], [SortId], [Nullity],[Description]) 
                                                           VALUES (@ConfigName,@payType,@PayUrl,@MaxAmount,@MinAmount,@SortId,@Nullity,@Description)";
            }
            else
            {
                prams.Add(Database.MakeInParam("id", officalImgPay.id));
                sqlQuery = @"UPDATE [dbo].[OfficalImgPay] SET ConfigName=@ConfigName,payType=@payType,PayUrl=@PayUrl,MaxAmount=@MaxAmount,MinAmount=@MinAmount,SortId=@SortId,Nullity=@Nullity,Description=@Description WHERE id=@id";
            }
            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }
        public int SaveBankPay(OfficalBankPay officalBankPay)
        {
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("ConfigName", officalBankPay.ConfigName),
                Database.MakeInParam("MerchantName", officalBankPay.MerchantName),
                Database.MakeInParam("BankName", officalBankPay.BankName),
                Database.MakeInParam("BankNumber", officalBankPay.BankNumber),
                Database.MakeInParam("BankAddr", officalBankPay.BankAddr),
                Database.MakeInParam("MaxAmount", officalBankPay.MaxAmount),
                Database.MakeInParam("MinAmount", officalBankPay.MinAmount),
                Database.MakeInParam("SortId", officalBankPay.SortId),
                Database.MakeInParam("Nullity", officalBankPay.Nullity),
                Database.MakeInParam("Description", officalBankPay.Description)
            };
            string sqlQuery;
            if (officalBankPay.id == 0)
            {
                sqlQuery = @"INSERT INTO [dbo].[OfficalBankPay]( [ConfigName], [MerchantName],[BankName], [BankNumber], [BankAddr],[MaxAmount], [MinAmount], [SortId],[Nullity], [Description]) 
                                                           VALUES (@ConfigName,@MerchantName,@BankName,@BankNumber,@BankAddr,@MaxAmount,@MinAmount,@SortId,@Nullity,@Description)";
            }
            else
            {
                prams.Add(Database.MakeInParam("id", officalBankPay.id));
                sqlQuery = @"UPDATE [dbo].[officalBankPay] SET ConfigName=@ConfigName,MerchantName=@MerchantName,BankName=@BankName,BankNumber=@BankNumber,BankAddr=@BankAddr,MaxAmount=@MaxAmount,MinAmount=@MinAmount,SortId=@SortId,Nullity=@Nullity,Description=@Description WHERE id=@id";
            }
            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }
        public Message FinshOfficalOrder(string orderid, byte type, int masterId)
        {
            List<DbParameter> prams = new List<DbParameter>
            {
                Database.MakeInParam("strOrdersID", orderid),
                Database.MakeInParam("OrderType", type),
                Database.MakeInParam("MatserID", masterId),
                Database.MakeOutParam("strErrorDescribe", typeof(string), 127)
            };
            return MessageHelper.GetMessage(Database, "NET_PW_FinishOfficalOrder", prams);
        }

        public int RefuseOrder(string orderid,byte type, int masterId)
        {
            string sql;
            if (type==1)  
            {
                sql = $"UPDATE BankPayOrder SET OrderStates=2,MasterId={masterId},CallTime=GETDATE() WHERE OrderID='{orderid}'";
            }
            else
            {
                sql = $"UPDATE ImgPayOrder SET OrderStates=2 ,MasterId={masterId},CallTime=GETDATE() WHERE OrderID='{orderid}'";
            }
            return Database.ExecuteNonQuery(sql);
        }

        public int DeleteOnlinePayConfig(string idlist)
        {
            string sqlQuery = $"DELETE OnlinePayConfig WHERE ID IN({idlist})";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        public int DeletePayChanel(string idlist)
        {
            string sqlQuery = $"DELETE pay_chanel WHERE id IN({idlist})";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        public int DeleteEncrytion(string idlist)
        {
            string sqlQuery = $"DELETE signtype WHERE id IN({idlist})";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        public int DeleteBankPay(string idlist)
        {
            string sqlQuery = $"DELETE OfficalBankPay WHERE id IN({idlist})";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        public int DeleteImgPay(string idlist)
        {
            string sqlQuery = $"DELETE OfficalImgPay WHERE id IN({idlist})";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        public OfficalBankPay GetBankPayById(int id)
        {
            string sqlQuery = $"SELECT * FROM OfficalBankPay WITH(NOLOCK) WHERE id = '{id}'";
            return Database.ExecuteObject<OfficalBankPay>(sqlQuery);
        }

        public OfficalImgPay GetImgPayById(int id)
        {
            string sqlQuery = $"SELECT * FROM OfficalImgPay WITH(NOLOCK) WHERE id = '{id}'";
            return Database.ExecuteObject<OfficalImgPay>(sqlQuery);
        }

        public bool IsExistOnlinePayConfig(string where)
        {
            string sqlQuery = $"SELECT ID FROM OnlinePayConfig WITH(NOLOCK) {where} ";
            return Database.ExecuteScalar(CommandType.Text, sqlQuery) != null;
        }

        public IList<pay_chanel> GetPay_ChanelsByType(int type)
        {
            string sqlQuery = $"SELECT * FROM pay_chanel WITH(NOLOCK) WHERE  bankType={type}";
            return Database.ExecuteObjectList<pay_chanel>(sqlQuery);
        }

        public pay_chanel GetPay_ChanelsByID(int id)
        {
            string sqlQuery = $"SELECT * FROM pay_chanel WITH(NOLOCK) WHERE  id={id}";
            return Database.ExecuteObject<pay_chanel>(sqlQuery);
        }

        public IList<signtype> GetSignList()
        {
            string sqlQuery = $"SELECT * FROM signtype WITH(NOLOCK)";
            return Database.ExecuteObjectList<signtype>(sqlQuery);
        }

        public signtype GetSignById(int id)
        {
            string sqlQuery = $"SELECT * FROM signtype WITH(NOLOCK) WHERE  id={id}";
            return Database.ExecuteObject<signtype>(sqlQuery);
        }

        public int SavePayChanel(pay_chanel chanel)
        {
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("sendpamar", chanel.sendpamar),
                Database.MakeInParam("moneyPre", chanel.moneyPre),
                Database.MakeInParam("singpos", chanel.singpos),
                Database.MakeInParam("method", chanel.method),
                Database.MakeInParam("respSign", chanel.respSign),
                Database.MakeInParam("respCode", chanel.respCode),
                Database.MakeInParam("successCode", chanel.successCode),
                Database.MakeInParam("infoName", chanel.infoName),
                Database.MakeInParam("infoType", chanel.infoType),
                Database.MakeInParam("orderkey", chanel.orderkey),
                Database.MakeInParam("signkey", chanel.signkey),
                Database.MakeInParam("moneykey", chanel.moneykey),
                Database.MakeInParam("codekey", chanel.codekey),
                Database.MakeInParam("codeSuccess", chanel.codeSuccess),
                Database.MakeInParam("backstring", chanel.backstring),
                Database.MakeInParam("sendSign", chanel.sendSign),
                Database.MakeInParam("backSign", chanel.backSign),
                Database.MakeInParam("callSign", chanel.callSign),
                Database.MakeInParam("name", chanel.name),
                Database.MakeInParam("bankType", chanel.bankType)
            };
            string sqlQuery;
            if (chanel.id == 0)
            {
                sqlQuery = @"INSERT INTO [dbo].[pay_chanel]( [sendpamar], [moneyPre], [singpos], [method], [respSign], [respCode], [successCode], [infoName], [infoType], [orderkey], [signkey], [moneykey], [codekey], [codeSuccess], [backstring], [sendSign], [backSign], [callSign], [name], [bankType]) 
                                                           VALUES (@sendpamar,@moneyPre,@singpos,@method,@respSign,@respCode,@successCode,@infoName,@infoType,@orderkey,@signkey,@moneykey,@codekey,@codeSuccess,@backstring,@sendSign,@backSign,@callSign,@name,@bankType)";
            }
            else
            {
                prams.Add(Database.MakeInParam("id", chanel.id));
                sqlQuery = @"UPDATE [dbo].[pay_chanel] SET sendpamar=@sendpamar,moneyPre=@moneyPre,singpos=@singpos,method=@method,respSign=@respSign,respCode=@respCode,successCode=@successCode,infoName=@infoName,
                                    infoType=@infoType,orderkey=@orderkey,signkey=@signkey,moneykey=@moneykey,codekey=@codekey,codeSuccess=@codeSuccess,sendSign=@sendSign,backSign=@backSign,backstring=@backstring,callSign=@callSign,name=@name,bankType=@bankType WHERE id=@id";
            }
            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }

        public int SaveEncryption(signtype mm)
        {
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("keyName", mm.keyName),
                Database.MakeInParam("signArray", mm.signArray),
                Database.MakeInParam("splicetype", mm.splicetype),
                Database.MakeInParam("joiner1", mm.joiner1),
                Database.MakeInParam("joiner2", mm.joiner2),
                Database.MakeInParam("type", mm.type),
                Database.MakeInParam("updown", mm.updown),
                Database.MakeInParam("mapPos", mm.mapPos),
                Database.MakeInParam("cyphertext", mm.cyphertext),
                Database.MakeInParam("cypType", mm.cypType),
                Database.MakeInParam("name", mm.name)
            };
            string sqlQuery;
            if (mm.id == 0)
            {
                sqlQuery = @"INSERT INTO [dbo].[signtype]( [keyName], [signArray], [splicetype], [joiner1], [joiner2], [type], [updown], [mapPos], [cyphertext], [cypType], [name]) 
                                                           VALUES (@keyName,@signArray,@splicetype,@joiner1,@joiner2,@type,@updown,@mapPos,@cyphertext,@cypType,@name)";
            }
            else
            {
                prams.Add(Database.MakeInParam("id", mm.id));
                sqlQuery = @"UPDATE [dbo].[signtype] SET keyName=@keyName,signArray=@signArray,splicetype=@splicetype,joiner1=@joiner1,joiner2=@joiner2,type=@type,
                                        updown=@updown,mapPos=@mapPos,cyphertext=@cyphertext,cypType=@cypType,name=@name WHERE id=@id";
            }
            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }


        public Message AddValiBet(int valiBet, int userID, byte type, int DepositID, string DepositName)
        {
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("ValidBet", valiBet),
                Database.MakeInParam("DepositType", type),
                Database.MakeInParam("UserID", userID),
                Database.MakeInParam("DepositID", DepositID),
                Database.MakeInParam("DepositName", DepositName),
                Database.MakeOutParam("strErrorDescribe", typeof(string), 127)
            };
            return MessageHelper.GetMessage(Database, "NET_PB_Deposit", prams);
        }

        public UserValidBet GetUserVailBet(int UserId)
        {
            string sqlQuery = $"SELECT * FROM UserValidBet WITH(NOLOCK) WHERE  UserID={UserId}";
            return Database.ExecuteObject<UserValidBet>(sqlQuery);
        }

        #endregion


        #region 充值配置
        /// <summary>
        /// 获取充值产品
        /// </summary>
        /// <param name="configId">充值产品标识</param>
        /// <returns></returns>
        public AppPayConfig GetAppPayConfig(int configId)
        {
            string sqlQuery = $"SELECT * FROM AppPayConfig WITH(NOLOCK) WHERE ConfigID = '{configId}'";
            return Database.ExecuteObject<AppPayConfig>(sqlQuery);
        }

        /// <summary>
        /// 删除充值产品
        /// </summary>
        /// <param name="idlist">标识列表</param>
        public int DeleteAppPayConfig(string idlist)
        {
            string sqlQuery = $"DELETE AppPayConfig WHERE ConfigID IN({idlist})";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        /// <summary>
        /// 判断充值产品是否存在
        /// </summary>
        /// <param name="where">查询条件</param>
        /// <returns></returns>
        public bool IsExistAppPayConfig(string where)
        {
            string sqlQuery = $"SELECT ConfigID FROM AppPayConfig WITH(NOLOCK) {where} ";
            return Database.ExecuteScalar(CommandType.Text, sqlQuery) != null;
        }

        /// <summary>
        /// 新增、修改充值产品
        /// </summary>
        /// <param name="config">充值产品</param>
        /// <returns></returns>
        public int SaveAppPayConfig(AppPayConfig config)
        {

            var prams = new List<DbParameter>
            {
                Database.MakeInParam("AppleID", config.AppleID),
                Database.MakeInParam("PayName", config.PayName),
                Database.MakeInParam("PayType", config.PayType),
                Database.MakeInParam("PayPrice", config.PayPrice),
                Database.MakeInParam("PayIdentity", config.PayIdentity),
                Database.MakeInParam("ImageType", config.ImageType),
                Database.MakeInParam("SortID", config.SortID),
                Database.MakeInParam("ScoreType", config.ScoreType),
                Database.MakeInParam("Score", config.Score),
                Database.MakeInParam("PresentScore", config.PresentScore),
                Database.MakeInParam("FristPresent", config.FristPresent),
                Database.MakeInParam("ConfigTime", config.ConfigTime)
            };
            string sqlQuery;
            if (config.ConfigID == 0)
            {
                sqlQuery = @"INSERT INTO AppPayConfig(AppleID,PayName,PayType,PayPrice,PayIdentity,ImageType,SortID,Score,FristPresent,PresentScore,ScoreType,ConfigTime) 
                                        VALUES(@AppleID,@PayName,@PayType,@PayPrice,@PayIdentity,@ImageType,@SortID,@Score,@FristPresent,@PresentScore,@ScoreType,@ConfigTime)";
            }
            else
            {
                prams.Add(Database.MakeInParam("ConfigID", config.ConfigID));
                StringBuilder sql = new StringBuilder();
                sql.Append("UPDATE AppPayConfig SET ")
                    .Append("AppleID=@AppleID, ")
                    .Append("PayName=@PayName, ")
                    .Append("PayType=@PayType, ")
                    .Append("PayPrice=@PayPrice, ")
                    .Append("PayIdentity=@PayIdentity, ")
                    .Append("ImageType=@ImageType, ")
                    .Append("Score=@Score, ")
                    .Append("ScoreType=@ScoreType, ")
                    .Append("PresentScore=@PresentScore, ")
                    .Append("FristPresent=@FristPresent, ")
                    .Append("SortID=@SortID ")
                    .Append("WHERE ConfigID=@ConfigID");
                sqlQuery = sql.ToString();
            }
            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }


        /// <summary>
        /// 获取在线充值配置
        /// </summary>
        /// <param name="configId">充值产品标识</param>
        /// <returns></returns>
        public OnLineWeChat GetOnLineWeChat(int configId)
        {
            string sqlQuery = $"SELECT * FROM OnLineWeChat WITH(NOLOCK) WHERE ConfigID = '{configId}'";
            return Database.ExecuteObject<OnLineWeChat>(sqlQuery);
        }
        /// <summary>
        /// 删除在线充值配置
        /// </summary>
        /// <param name="idlist">标识列表</param>
        public int DeleteOnLineWeChat(string idlist)
        {
            string sqlQuery = $"DELETE OnLineWeChat WHERE ConfigID IN({idlist})";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        /// <summary>
        /// 新增在线充值配置
        /// </summary>
        /// <param name="config">充值产品</param>
        /// <returns></returns>
        public int InsertOnLineWeChat(OnLineWeChat config)
        {
            string sqlQuery =
                @"INSERT INTO OnLineWeChat(ConfigName,WeChat,NickName,SortID,TagID,Nullity,CollectDate) 
                                        VALUES(@ConfigName,@WeChat,@NickName,@SortID,@TagID,@Nullity,getdate())";

            var prams = new List<DbParameter>
            {
                Database.MakeInParam("ConfigName", config.ConfigName),
                Database.MakeInParam("WeChat", config.WeChat),
                 Database.MakeInParam("NickName", config.NickName),
                Database.MakeInParam("SortID", config.SortID),
                 Database.MakeInParam("TagID", config.TagID),
                Database.MakeInParam("Nullity", config.Nullity),
            };

            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }
        /// <summary>
        /// 修改在线充值配置
        /// </summary>
        /// <param name="config">充值产品</param>
        /// <returns></returns>
        public int UpdateOnLineWeChat(OnLineWeChat config)
        {
            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.Append("UPDATE OnLineWeChat SET ")
                .Append("ConfigName=@ConfigName,")
                .Append("WeChat=@WeChat,")
                 .Append("NickName=@NickName,")
                .Append("SortID=@SortID,")
                 .Append("TagID=@TagID,")
                .Append("Nullity=@Nullity")
                .Append(" WHERE ConfigID=@ConfigID");

            var prams = new List<DbParameter>
            {
                Database.MakeInParam("ConfigName", config.ConfigName),
                Database.MakeInParam("WeChat", config.WeChat),
                 Database.MakeInParam("NickName", config.NickName),
                Database.MakeInParam("SortID", config.SortID),
                 Database.MakeInParam("TagID", config.TagID),
                Database.MakeInParam("Nullity", config.Nullity),
                Database.MakeInParam("ConfigID", config.ConfigID)
            };

            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery.ToString(), prams.ToArray());
        }

        public Message FinshOnlineOrder(string orderid, byte type, int payAmount, int masterId, string address)
        {
            List<DbParameter> prams = new List<DbParameter>
            {
                Database.MakeInParam("strOrdersID", orderid),
                Database.MakeInParam("callType", type),
                Database.MakeInParam("PayAmount", payAmount),
                Database.MakeInParam("MasterId", masterId),
                Database.MakeInParam("OrderAddress",address),
                Database.MakeOutParam("strErrorDescribe", typeof(string), 127)
            };
            return MessageHelper.GetMessage(Database, "NET_PW_FinishOnLineOrder", prams);
        }

        #endregion

        #region 推广配置

        /// <summary>
        /// 获取推广配置
        /// </summary>
        /// <param name="configId">推广配置id</param>
        /// <returns></returns>
        public SpreadConfig GetSpreadConfig(int configId)
        {
            string sqlQuery = $"SELECT * FROM SpreadConfig WITH(NOLOCK) WHERE ConfigID = {configId}";
            return Database.ExecuteObject<SpreadConfig>(sqlQuery);
        }

        /// <summary>
        /// 推广配置数量
        /// </summary>
        /// <returns></returns>
        public int SpreadConfigCount()
        {
            string sqlQuery = "SELECT COUNT(ConfigID) FROM SpreadConfig WITH(NOLOCK)";
            object obj = Database.ExecuteScalar(CommandType.Text, sqlQuery);
            return obj == null ? 0 : Convert.ToInt32(obj);
        }

        /// <summary>
        /// 删除推广配置
        /// </summary>
        /// <param name="configId">推广配置id</param>
        /// <returns></returns>
        public int DeleteSpreadConfig(int configId)
        {
            string sqlQuery = $"DELETE SpreadConfig WHERE ConfigID = {configId}";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        /// <summary>
        /// 新增推广信息
        /// </summary>
        /// <param name="config">推广配置</param>
        /// <returns></returns>
        public int InsertSpreadConfig(SpreadConfig config)
        {
            string sqlQuery =
                @"INSERT INTO SpreadConfig(SpreadNum,PresentDiamond,PresentPropID,PresentPropName,PresentPropNum,UpdateTime) 
                            VALUES(@SpreadNum,@PresentDiamond,@PresentPropID,@PresentPropName,@PresentPropNum,@UpdateTime)";
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("SpreadNum", config.SpreadNum),
                Database.MakeInParam("PresentDiamond", config.PresentDiamond),
                Database.MakeInParam("PresentPropID", config.PresentPropID),
                Database.MakeInParam("PresentPropName", config.PresentPropName),
                Database.MakeInParam("PresentPropNum", config.PresentPropNum),
                Database.MakeInParam("UpdateTime", config.UpdateTime)
            };

            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }

        /// <summary>
        /// 修改推广信息
        /// </summary>
        /// <param name="config">推广配置</param>
        /// <returns></returns>
        public int UpdateSpreadConfig(SpreadConfig config)
        {
            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.Append("UPDATE SpreadConfig SET ")
                .Append("SpreadNum=@SpreadNum, ")
                .Append("PresentDiamond=@PresentDiamond, ")
                .Append("PresentPropID=@PresentPropID, ")
                .Append("PresentPropName=@PresentPropName, ")
                .Append("PresentPropNum=@PresentPropNum ")
                .Append("WHERE ConfigID=@ConfigID");

            var prams = new List<DbParameter>
            {
                Database.MakeInParam("SpreadNum", config.SpreadNum),
                Database.MakeInParam("PresentDiamond", config.PresentDiamond),
                Database.MakeInParam("PresentPropID", config.PresentPropID),
                Database.MakeInParam("PresentPropName", config.PresentPropName),
                Database.MakeInParam("PresentPropNum", config.PresentPropNum),
                Database.MakeInParam("ConfigID", config.ConfigID)
            };

            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery.ToString(), prams.ToArray());
        }

        /// <summary>
        /// 获取推广返利配置
        /// </summary>
        /// <param name="configId"></param>
        /// <returns></returns>
        public SpreadReturnConfig GetSpreadReturnConfig(int configId)
        {
            string sqlQuery = $"SELECT * FROM SpreadReturnConfig WITH(NOLOCK) WHERE ConfigID = {configId}";
            return Database.ExecuteObject<SpreadReturnConfig>(sqlQuery);
        }

        /// <summary>
        /// 删除推广返利配置
        /// </summary>
        /// <param name="configId"></param>
        /// <returns></returns>
        public int DeleteSpreadReturnConfig(int configId)
        {
            string sqlQuery = $"DELETE SpreadReturnConfig WHERE ConfigID = {configId}";
            return Database.ExecuteNonQuery(sqlQuery);
        }


        /// <summary>
        /// 保存推广返利配置（新增、更新）
        /// </summary>
        /// <param name="config"></param>
        /// <returns></returns>
        public int SaveSpreadReturnConfig(SpreadReturnConfig config)
        {
            string sql;
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("SpreadLevel", config.SpreadLevel),
                Database.MakeInParam("PresentScale", config.PresentScale),
                Database.MakeInParam("Nullity", config.Nullity),
                Database.MakeInParam("UpdateTime", config.UpdateTime)
            };
            if (config.ConfigID > 0)
            {
                prams.Add(Database.MakeInParam("ConfigID", config.ConfigID));
                sql =
                    "UPDATE SpreadReturnConfig SET SpreadLevel=@SpreadLevel,PresentScale=@PresentScale,Nullity=@Nullity,UpdateTime=@UpdateTime WHERE ConfigID=@ConfigID";
            }
            else
            {
                sql = @"
                            IF NOT EXISTS (SELECT 1 FROM SpreadReturnConfig WHERE SpreadLevel = @SpreadLevel)
                            BEGIN
                                INSERT INTO SpreadReturnConfig(SpreadLevel,PresentScale,Nullity,UpdateTime) 
                                VALUES(@SpreadLevel,@PresentScale,@Nullity,@UpdateTime)
                            END";
            }
            return Database.ExecuteNonQuery(CommandType.Text, sql, prams.ToArray());
        }
        public DataSet GetSubList(int uid)
        {
            string sql = $"SELECT A.GameID, R.UserID FROM WHQJAccountsDB.dbo.AccountsInfo (NOLOCK) A INNER JOIN WHQJTreasureDB.dbo.AgentInfo (NOLOCK) R ON A.UserID = R.UserID WHERE R.ParentID={uid}";
            return Database.ExecuteDataset(CommandType.Text, sql);
        }
        #endregion

        #region 钻石信息与奖券
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        /// <param name="where">查询条件</param>
        /// <param name="order">排序</param>
        /// <param name="pageIndex">页下标</param>
        /// <param name="pageSize">页显示数</param>
        /// <returns></returns>
        public PagerSet GetPageDiamondList(string where, string order, int pageIndex, int pageSize)
        {
            PagerParameters pagerPrams = new PagerParameters("UserCurrency", where, order, pageIndex, pageSize, null, "WEB_PageView_Diamond");
            return GetPagerSet(pagerPrams);
        }
        /// <summary>
        /// 赠送钻石
        /// </summary>
        /// <param name="diamond">赠送钻石信息</param>
        /// <returns></returns>
        public Message GrantDiamond(RecordGrantDiamond diamond)
        {
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("MasterID", diamond.MasterID),
                Database.MakeInParam("ClientIP", diamond.ClientIP),
                Database.MakeInParam("UserID", diamond.UserID),
                Database.MakeInParam("AddDiamond", diamond.AddDiamond),
                Database.MakeInParam("TypeID", diamond.TypeID),
                Database.MakeInParam("CollectNote", diamond.CollectNote)
            };

            Message msg = MessageHelper.GetMessage(Database, "WSP_PM_GrantDiamond", prams);
            return msg;
        }

        /// <summary>
        /// 赠送奖券
        /// </summary>
        /// <param name="AwardTicket">赠送奖券信息</param>
        /// <returns></returns>
        public Message GrantAwardTicket(RecordGrantAwardTicket AwardTicket)
        {
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("MasterID", AwardTicket.MasterID),
                Database.MakeInParam("ClientIP", AwardTicket.ClientIP),
                Database.MakeInParam("UserID", AwardTicket.UserID),
                Database.MakeInParam("AddAwardTicket", AwardTicket.AddAwardTicket),
                Database.MakeInParam("TypeID", AwardTicket.TypeID),
                Database.MakeInParam("CollectNote", AwardTicket.CollectNote)
            };

            Message msg = MessageHelper.GetMessage(Database, "WSP_PM_GrantAwardTicket", prams);
            return msg;
        }

        /// <summary>
        /// 获取钻石前50名排行
        /// </summary>
        /// <returns></returns>
        public DataSet GetDiamondRank()
        {
            string sqlQuery = "SELECT TOP 50 UserID,Diamond FROM UserCurrency ORDER BY Diamond DESC,UserID ASC";
            return Database.ExecuteDataset(CommandType.Text, sqlQuery);
        }

        /// <summary>
        /// 获取奖券前50名排行
        /// </summary>
        /// <returns></returns>
        public DataSet GetAwardTicketRank()
        {
            string sqlQuery = "SELECT TOP 50 UserID,AwardTicket FROM UserCurrency ORDER BY AwardTicket DESC,UserID ASC";
            return Database.ExecuteDataset(CommandType.Text, sqlQuery);
        }

        #endregion

        #region 统计总数

        /// <summary>
        /// 系统统计
        /// </summary>
        /// <returns></returns>
        public DataSet GetStatInfo()
        {
            return Database.ExecuteDataset(CommandType.StoredProcedure, "NET_PM_StatInfo");
        }

        /// <summary>
        /// 按条件线上获取到账总数
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public decimal GetTotalPayAmount(string where)
        {
            string sql = $"SELECT ISNULL(SUM(PayAmount),0) AS Amount FROM OnLinePayOrder {where} AND OrderStates>0";
            return Convert.ToDecimal(Database.ExecuteScalar(CommandType.Text, sql));
        }
        //获取充值总数
        public decimal GetTotalAmount(string table, string where)
        {
            string sql = $"SELECT ISNULL(SUM(Amount),0) AS Amount FROM {table} {where}";
            return Convert.ToDecimal(Database.ExecuteScalar(CommandType.Text, sql));
        }

        /// <summary>
        /// 按条件获取已支付订单数
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public long GetTotalPayOrderCount(string table ,string where)
        {
            string sql = $"SELECT COUNT(1) AS [COUNT] FROM {table} {where}";
            return Convert.ToInt64(Database.ExecuteScalar(CommandType.Text, sql));
        }

        /// <summary>
        /// 获取钻石统计
        /// </summary>
        /// <param name="where">查询条件</param>
        /// <returns></returns>
        public long GetTotalUserDiamond(string where)
        {
            string sqlQuery = $"SELECT ISNULL(SUM(Diamond),0) AS Diamond FROM UserCurrency {where}";
            object obj = Database.ExecuteScalar(CommandType.Text, sqlQuery);
            return obj != null ? Convert.ToInt64(obj) : 0;
        }

        /// <summary>
        /// 获取金币分布统计
        /// </summary>
        /// <returns></returns>
        public DataSet GetGoldDistribute()
        {
            return Database.ExecuteDataset(CommandType.StoredProcedure, "NET_PW_GetGoldDistribute");
        }

        /// <summary>
        /// 获取钻石分布统计
        /// </summary>
        /// <returns></returns>
        public DataSet GetDiamondDistribute()
        {
            return Database.ExecuteDataset(CommandType.StoredProcedure, "NET_PW_GetDiamondDistribute");
        }

        public DataSet GetVIPDistribute()
        {
            return Database.ExecuteDataset(CommandType.StoredProcedure, "NET_PW_GetVIPDistribute");
        }

        #endregion

        #region 金币信息
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        /// <param name="where">查询条件</param>
        /// <param name="order">排序</param>
        /// <param name="pageIndex">页下标</param>
        /// <param name="pageSize">页显示数</param>
        /// <returns></returns>
        public PagerSet GetPageScoreList(string where, string order, int pageIndex, int pageSize)
        {
            PagerParameters pagerPrams = new PagerParameters("GameScoreLocker", where, order, pageIndex, pageSize, null, "WEB_PageView_ScoreLocker");
            return GetPagerSet(pagerPrams);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        /// <param name="where">查询条件</param>
        /// <param name="order">排序</param>
        /// <param name="pageIndex">页下标</param>
        /// <param name="pageSize">页显示数</param>
        /// <returns></returns>
        public PagerSet GetPageInoutList(string where, string order, int pageIndex, int pageSize)
        {
            PagerParameters pagerPrams = new PagerParameters("RecordUserInout", where, order, pageIndex, pageSize, null, "WEB_PageView_UserInout");
            return GetPagerSet(pagerPrams);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        /// <param name="where">查询条件</param>
        /// <param name="order">排序</param>
        /// <param name="pageIndex">页下标</param>
        /// <param name="pageSize">页显示数</param>
        /// <returns></returns>
        public PagerSet GetPageDrawList(string where, string order, int pageIndex, int pageSize)
        {
            PagerParameters pagerPrams = new PagerParameters("RecordDrawInfo", where, order, pageIndex, pageSize, null, "WEB_PageView_DrawInfo");
            return GetPagerSet(pagerPrams);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        /// <param name="where">查询条件</param>
        /// <param name="order">排序</param>
        /// <param name="pageIndex">页下标</param>
        /// <param name="pageSize">页显示数</param>
        /// <returns></returns>
        public PagerSet GetPageInsureList(string where, string order, int pageIndex, int pageSize)
        {
            PagerParameters pagerPrams = new PagerParameters("RecordInsure", where, order, pageIndex, pageSize, null, "WEB_PageView_Insure");
            return GetPagerSet(pagerPrams);
        }
        /// <summary>
        /// 赠送金币
        /// </summary>
        /// <param name="rgt">赠送金币信息</param>
        /// <returns></returns>
        public Message GrantTreasure(RecordGrantTreasure rgt)
        {
            var prams = new List<DbParameter>
            {
                Database.MakeInParam("MasterID", rgt.MasterID),
                Database.MakeInParam("ClientIP", rgt.ClientIP),
                Database.MakeInParam("UserID", rgt.UserID),
                Database.MakeInParam("AddGold", rgt.AddGold),
                Database.MakeInParam("Reason", rgt.Reason)
            };

            Message msg = MessageHelper.GetMessage(Database, "WSP_PM_GrantTreasure", prams);
            return msg;
        }

        /// <summary>
        /// 获取兑换金币配置
        /// </summary>
        /// <param name="configId">配置标识</param>
        /// <returns></returns>
        public CurrencyExchConfig GetCurrencyExch(int configId)
        {
            string sqlQuery = $"SELECT * FROM CurrencyExchConfig WITH(NOLOCK) WHERE ConfigID = '{configId}'";
            return Database.ExecuteObject<CurrencyExchConfig>(sqlQuery);
        }

        /// <summary>
        /// 删除兑换金币配置
        /// </summary>
        /// <param name="idlist">标识列表</param>
        public int DeleteCurrencyExch(string idlist)
        {
            string sqlQuery = $"DELETE CurrencyExchConfig WHERE ConfigID IN({idlist})";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        /// <summary>
        /// 判断兑换金币配置是否存在相同钻石
        /// </summary>
        /// <param name="diamond">兑换钻石数</param>
        /// <returns></returns>
        public bool IsExistCurrencyExch(int diamond)
        {
            string sqlQuery = $"SELECT ConfigID FROM CurrencyExchConfig WITH(NOLOCK) WHERE Diamond = {diamond} ";
            return Database.ExecuteScalar(CommandType.Text, sqlQuery) != null;
        }

        /// <summary>
        /// 新增兑换金币配置
        /// </summary>
        /// <param name="config">兑换金币配置</param>
        /// <returns></returns>
        public int InsertCurrencyExch(CurrencyExchConfig config)
        {
            string sqlQuery =
                @"INSERT INTO CurrencyExchConfig(ConfigName,Diamond,ExchGold,ImageType,SortID) VALUES(@ConfigName,@Diamond,@ExchGold,@ImageType,@SortID)";

            var prams = new List<DbParameter>
            {
                Database.MakeInParam("ConfigName", config.ConfigName),
                Database.MakeInParam("Diamond", config.Diamond),
                Database.MakeInParam("ExchGold", config.ExchGold),
                Database.MakeInParam("ImageType", config.ImageType),
                Database.MakeInParam("SortID", config.SortID)
            };

            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }

        /// <summary>
        /// 修改兑换金币配置
        /// </summary>
        /// <param name="config">兑换金币配置</param>
        /// <returns></returns>
        public int UpdateCurrencyExch(CurrencyExchConfig config)
        {
            string sqlQuery =
                @"UPDATE CurrencyExchConfig SET ConfigName=@ConfigName,Diamond=@Diamond,ExchGold=@ExchGold,ImageType=@ImageType,SortID=@SortID WHERE ConfigID=@ConfigID";

            var prams = new List<DbParameter>
            {
                Database.MakeInParam("ConfigName", config.ConfigName),
                Database.MakeInParam("Diamond", config.Diamond),
                Database.MakeInParam("ExchGold", config.ExchGold),
                Database.MakeInParam("ImageType", config.ImageType),
                Database.MakeInParam("SortID", config.SortID),
                Database.MakeInParam("ConfigID", config.ConfigID)
            };

            return Database.ExecuteNonQuery(CommandType.Text, sqlQuery, prams.ToArray());
        }

        #endregion

        #region 卡线管理

        /// <summary>
        /// 批量清除玩家卡线
        /// </summary>
        /// <param name="userlist"></param>
        /// <returns></returns>
        public int CleanGameScoreLocker(string userlist)
        {
            string sqlQuery = $"DELETE GameScoreLocker  WHERE UserID IN({userlist})";
            return Database.ExecuteNonQuery(sqlQuery);
        }

        #endregion
    }
}