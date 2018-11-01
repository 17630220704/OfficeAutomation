package com.dao.permit;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface permitManage {
    // 角色查询
    List<Map> listRole();
    //树形菜单查询
    List<Map<String,Object>> getModulTrees(@Param("rid") Integer rid);
    //权限修改—删除
    Integer deletePermit(@Param("rid") int rid);
    //权限修改—添加
    Integer savePermit(@Param("rid") int rid, @Param("mid") Integer mid);
}
