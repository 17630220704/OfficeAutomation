package com.services.permit;


import com.entity.permit.TbUser;

import java.util.List;
import java.util.Map;

public interface permitLoginService {
    //登陆
    Map<String,Object> getlogin(TbUser tbUser);
    //获取菜单
    List<Map> getTree(int userid);
    //获取下级菜单
    List<Map> getTrees(Integer m_id, int userid);
}
