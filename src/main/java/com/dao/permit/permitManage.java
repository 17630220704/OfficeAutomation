package com.dao.permit;

import com.entity.permit.TbUser;
import com.entity.permit.upRoleUser;
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
    //添加角色
    Integer saveRole(@Param("rname") String rname);
    //删除角色
    Integer deleteRole(@Param("rid") int rid);
    //部门查询
    List<Map<String,Object>> listDept();
    //部门下拉框
    List<Map<String,Object>> getDept();
    //删除部门
    Integer deleteDept(@Param("deptid") int deptid);
    //修改部门
    Integer updateDept(@Param("DeptId") int DeptId, @Param("DeptType") String DeptType, @Param("DeptName") String DeptName);
    //添加部门
    Integer saveDept(@Param("DeptNumber") int DeptNumber, @Param("DeptName") String DeptName);
    //查询角色用户
    List<Map<String, Object>> listRoleUser(@Param("personname") String personname);
    //修改角色
    Integer updateRole(upRoleUser upru);
    //修改角色
    Integer updateUser(upRoleUser upru);
    //登陆锁定&&解锁
    Integer updatelocking(@Param("uid") int uid, @Param("ulocking") int ulocking);

}
