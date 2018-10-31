package com.services.permit;


import java.util.List;
import java.util.Map;

public interface permitManageService {
    // 角色查询
    List<Map> listRole();
    //权限查询
    List<Map> getRolePermit(Integer rid);
    //树形菜单查询
    List<Map<String,Object>> getModulTrees(String rid);
}
