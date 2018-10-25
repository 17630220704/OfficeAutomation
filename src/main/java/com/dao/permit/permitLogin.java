package com.dao.permit;


import com.entity.permit.TbUser;

import java.util.List;
import java.util.Map;

public interface permitLogin {
    //登陆
    public List<Map> getlogin(TbUser tbUser);
    //黑名单查询
    public List<Map> LoginLacklist(long userid);
    //登陆菜单查询
    public Map<String,Object> ListTree(long userid);
}
