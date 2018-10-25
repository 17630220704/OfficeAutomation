package com.services.permit;


import com.entity.permit.TbUser;

import java.util.List;
import java.util.Map;

public interface permitLoginService {
    //登陆
    public int getlogin(TbUser tbUser);
    //获取菜单
    public  Map<String,Object> getTree(long userid);
}
