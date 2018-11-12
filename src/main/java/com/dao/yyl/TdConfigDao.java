package com.dao.yyl;


import com.entity.yyl.TdConfig;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface TdConfigDao {

     List<Map> tdConfigQuery();
    /**
     *添加排班类型
     */
     void tdConfigAdd(TdConfig tc);
    /**
     * 修改排班类型
     */
     void tdConfigUpdate(TdConfig tc);
    /**
     * 删除排班类型
     */
     void tdConfigDelete(int tc_id);
}
