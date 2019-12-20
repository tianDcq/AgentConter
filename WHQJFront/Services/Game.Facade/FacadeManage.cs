﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Game.Facade.DataStruct;
using Game.Entity.Platform;
using Game.Entity.Accounts;

namespace Game.Facade
{
    /// <summary>
    /// 逻辑层管理类
    /// </summary>
    public class FacadeManage
    {
        public static List<TurntableReward> bList;
        public static List<TurntableReward> nList;

        private static object lockObj = new object();

        ///// <summary>
        ///// 前台逻辑
        ///// </summary>
        private static volatile NativeWebFacade _aideNativeWebFacade;
        public static NativeWebFacade aideNativeWebFacade
        {
            get
            {
                if( _aideNativeWebFacade == null )
                {
                    lock( lockObj )
                    {
                        if( _aideNativeWebFacade == null )
                            _aideNativeWebFacade = new NativeWebFacade();
                    }
                }
                return _aideNativeWebFacade;
            }
        }

        ///// <summary>
        ///// 平台逻辑
        ///// </summary>
        private static volatile PlatformFacade _aidePlatformFacade;
        public static PlatformFacade aidePlatformFacade
        {
            get
            {
                if( _aidePlatformFacade == null )
                {
                    lock( lockObj )
                    {
                        if( _aidePlatformFacade == null )
                            _aidePlatformFacade = new PlatformFacade();
                    }
                }
                return _aidePlatformFacade;
            }
        }

        ///// <summary>
        ///// 游戏币库逻辑
        ///// </summary>
        private static volatile TreasureFacade _aideTreasureFacade;
        public static TreasureFacade aideTreasureFacade
        {
            get
            {
                if( _aideTreasureFacade == null )
                {
                    lock( lockObj )
                    {
                        if( _aideTreasureFacade == null )
                            _aideTreasureFacade = new TreasureFacade();
                    }
                }
                return _aideTreasureFacade;
            }
        }

        ///// <summary>
        ///// 帐号库逻辑
        ///// </summary>
        private static volatile AccountsFacade _aideAccountsFacade;
        public static AccountsFacade aideAccountsFacade
        {
            get
            {
                if( _aideAccountsFacade == null )
                {
                    lock( lockObj )
                    {
                        if( _aideAccountsFacade == null )
                            _aideAccountsFacade = new AccountsFacade();
                    }
                }
                return _aideAccountsFacade;
            }
        }

        ///// <summary>
        ///// 记录库逻辑
        ///// </summary>
        private static volatile RecordFacade _aideRecordFacade;
        public static RecordFacade aideRecordFacade
        {
            get
            {
                if( _aideRecordFacade == null )
                {
                    lock( lockObj )
                    {
                        if( _aideRecordFacade == null )
                            _aideRecordFacade = new RecordFacade();
                    }
                }
                return _aideRecordFacade;
            }
        }

        ///// <summary>
        ///// 比赛库逻辑
        ///// </summary>
        private static volatile GameMatchFacade _aideGameMatchFacade;
        public static GameMatchFacade aideGameMatchFacade
        {
            get
            {
                if( _aideGameMatchFacade == null )
                {
                    lock( lockObj )
                    {
                        if( _aideGameMatchFacade == null )
                            _aideGameMatchFacade = new GameMatchFacade();
                    }
                }
                return _aideGameMatchFacade;
            }
        }

        ///// <summary>
        ///// 代理逻辑
        ///// </summary>
        private static volatile AgentFacade _aideAgentFacade;
        public static AgentFacade aideAgentFacade
        {
            get
            {
                if (_aideAgentFacade != null) return _aideAgentFacade;
                lock (lockObj)
                {
                    if (_aideAgentFacade == null)
                        _aideAgentFacade = new AgentFacade();
                }
                return _aideAgentFacade;
            }
        }

        ///// <summary>
        ///// 群组逻辑
        ///// </summary>
        private static volatile GroupFacade _aideGroupFacade;
        public static GroupFacade aideGroupFacade
        {
            get
            {
                if (_aideGroupFacade != null) return _aideGroupFacade;
                lock (lockObj)
                {
                    if (_aideGroupFacade == null)
                        _aideGroupFacade = new GroupFacade();
                }
                return _aideGroupFacade;
            }
        }
        public static string GetOrperteName(int type)
        {
            switch (type)
            {
                case 0:
                    return "后台赠送";
                case 1:
                    return "注册赠送";
                case 2:
                    return "后台赠送";
                case 3:
                    return "注册赠送";
                case 4:
                    return "后台赠送";
                case 5:
                    return "购买房卡";
                case 6:
                    return "银行入款";
                case 7:
                    return "银行出款";
                case 10:
                    return "提现退款";
                case 11:
                    return "提现";
                case 12:
                    return "充值入款";
                case 13:
                    return "代理奖励";
                case 14:
                    return "签到";
                case 15:
                    return "分享";
                default:
                    return "未知类型";
            }
        }

        public static void CreatTurnTableDate()
        {
            IList<TurntableConfig> list = aidePlatformFacade.GetTurntableConfigs();
            int pp = new Random().Next(10);
            int turnIndex = 0;
            if (pp > 3 && pp < 8)
            {
                turnIndex = 1;
            }
            else if (pp>8)
            {
                turnIndex = 2;
            }
            TurntableConfig broad = list[4 * turnIndex + 2];
            AccountsInfo android = aideAccountsFacade.RandomAndroid();
            long reward = StartTurntable(list[4 * turnIndex + 3], list[4 * turnIndex], broad);
            TurntableReward record = new TurntableReward();
            record.money = reward;
            record.time = DateTime.Now;
            record.turnName = broad.TurnName;
            record.nickName = android.NickName;
            PustTurnTableRecord(record, (int)broad.GetType().GetProperty("Money" + turnIndex).GetValue(broad, null));
        }

        public static long StartTurntable(TurntableConfig pre, TurntableConfig money, TurntableConfig broad)
        {
            int r = new Random().Next(Convert.ToInt32(pre.TurnName));

            int i = 1;
            int p = 0;
            for (; i < 14; ++i)
            {
                p+= (int)pre.GetType().GetProperty("Money"+i).GetValue(pre, null);
                if (p > r)
                {
                    break;
                }
            }
            long reward = (long)money.GetType().GetProperty("Money" + i).GetValue(money,null);
            return reward;
        }
        public static void PustTurnTableRecord(TurntableReward record,int big)
        {
            nList.Add(record);
            if (nList.Count > 20)
            {
                nList.RemoveAt(0);
            }
            if (big == 1)
            {
                bList.Add(record);
                if (bList.Count > 20)
                {
                    bList.RemoveAt(0);
                }
            }
        }
    }
}
