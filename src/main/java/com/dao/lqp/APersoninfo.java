package com.dao.lqp;

import com.entity.lqp.*;

import java.util.List;
import java.util.Map;

public interface APersoninfo {
    List<Map> findinfoall();
    List<Map<String,Object>> findinfobyname();
    int insertinfo(TbPersoninfo tbPersoninfo);//增加数据
    int insertinfoAdd(TbPersoninfo tbPersoninfo);//增加数据
    int deleteinfo(TbPersoninfo tbPersoninfo);//删除数据
    int updateinfo(TbPersoninfo tbPersoninfo);//更新数据

    List<Map<String,Object>> findShaixuan(TbPersoninfo tbPersoninfo);
    int updateShaixuan(TbPersoninfo tbPersoninfo);//更新数据

    int insertuser(TbUser tbUser);//增加user数据
    List<Map<String,Object>> findinfobydept();
    int insertRoleUser(TbRoleUser tbRoleUser);//增加user数据
    List<Map<String,Object>> findinfobyrole();


    int updatehire(TbPersoninfo tbPersoninfo);//更新hire数据
}
