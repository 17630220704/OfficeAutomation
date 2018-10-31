package com.dao.permit;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface permitManage {
    // 角色查询
    List<Map> listRole();
    //权限查询
    List<Map> getRolePermit(@Param("rid") Integer rid);
    //树形菜单查询
    List<Map<String,Object>> getModulTrees(@Param("rid") String rid);
}
