package com.service.yyl;

import com.entity.yyl.TdConfig;

import java.util.List;
import java.util.Map;

public interface TdConfigService {
    /**
     * 查询排班类型
     * */
    public List<Map> tdConfigQuery();
    public void tdConfigAdd(TdConfig tc);
    public void tdConfigUpdate(TdConfig tc);
    public void tdConfigDelete(int tc_id);
}
