package com.services.permit;


import com.entity.permit.TbUser;

import java.util.List;
import java.util.Map;

public interface permitLoginService {
    //登陆
    public Map<String,Object> getlogin(TbUser tbUser);
    //获取菜单
    public  List<Map> getTree(int userid);
    //获取下级菜单
    public List<Map> getTrees(Integer m_id);
}
