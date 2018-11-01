package com.services.permit;


import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface permitManageService {
    // 角色查询
    List<Map> listRole();
    //树形菜单查询
    List<Map<String,Object>> getModulTrees(Integer rid);
    //权限修改
    boolean updatePermit(String mid, int rid);
}
