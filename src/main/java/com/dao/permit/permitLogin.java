package com.dao.permit;


import com.entity.permit.TbUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface permitLogin {
    //登陆
    List<Map> getlogin(TbUser tbUser);
    //黑名单查询
    List<Map> LoginLacklist(int userid);
    //登陆菜单查询
    List<Map> ListTree(int userid);
    //二级菜单查询
    List<Map> ListTrees(@Param("m_id") Integer m_id, @Param("userid") int userid);
}
