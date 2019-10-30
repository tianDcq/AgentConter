/*
 * 版本： 4.0
 * 日期：2019/10/29 14:13:19
 * 
 * 描述：实体类
 * 
 */

using System;
using System.Collections.Generic;

namespace Game.Entity.Treasure
{
    /// <summary>
    /// 实体类 OfficalImgPay  (属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class OfficalImgPay
    {
        #region 常量 

        /// <summary>
        /// 表名
        /// </summary>
        public const string Tablename = "OfficalImgPay";

        #endregion 

        #region 私有变量

        private int p_id;
        private byte p_paytype;
        private string p_payurl;
        private int p_maxamount;
        private int p_minamount;
        private string p_configname;
        private int p_sortid;
        private string p_description;

        #endregion

        #region 构造函数 

        /// <summary>
        /// 初始化OfficalImgPay
        /// </summary>
        public OfficalImgPay() 
        {
            p_id = 0;
            p_paytype = 0;
            p_payurl = string.Empty;
            p_maxamount = 0;
            p_minamount = 0;
            p_configname = string.Empty;
            p_sortid = 0;
            p_description = string.Empty;
        }

        #endregion

        #region 公共属性 

        /// <summary>
        /// id
        /// </summary>
        public int id
        {
            set
            {
                p_id=value;
            }
            get
            {
                return p_id;
            }
        }

        /// <summary>
        /// PayType
        /// </summary>
        public byte PayType
        {
            set
            {
                p_paytype=value;
            }
            get
            {
                return p_paytype;
            }
        }

        /// <summary>
        /// PayUrl
        /// </summary>
        public string PayUrl
        {
            set
            {
                p_payurl=value;
            }
            get
            {
                return p_payurl;
            }
        }

        /// <summary>
        /// MaxAmount
        /// </summary>
        public int MaxAmount
        {
            set
            {
                p_maxamount=value;
            }
            get
            {
                return p_maxamount;
            }
        }

        /// <summary>
        /// MinAmount
        /// </summary>
        public int MinAmount
        {
            set
            {
                p_minamount=value;
            }
            get
            {
                return p_minamount;
            }
        }

        /// <summary>
        /// ConfigName
        /// </summary>
        public string ConfigName
        {
            set
            {
                p_configname=value;
            }
            get
            {
                return p_configname;
            }
        }

        /// <summary>
        /// SortId
        /// </summary>
        public int SortId
        {
            set
            {
                p_sortid=value;
            }
            get
            {
                return p_sortid;
            }
        }

        /// <summary>
        /// Description
        /// </summary>
        public string Description
        {
            set
            {
                p_description=value;
            }
            get
            {
                return p_description;
            }
        }

        #endregion
    }
}

