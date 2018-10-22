package com.dao.yyl;


import com.entity.yyl.TdConfig;

import java.util.List;
import java.util.Map;

public interface TdConfigDao {

    public List<Map> tdConfigQuery();
    /**
     * 修改排班类型
     */
    public void tdConfigAdd(TdConfig tc);
    /**
     * 添加排班类型
     */
    public void tdConfigUpdate(TdConfig tc);
    /**
     * 删除排班类型
     */
    public void tdConfigDelete(int tc_id);
}
