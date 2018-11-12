package com.dao.lqp;

import com.entity.lqp.TbPersoninfo;
import com.entity.lqp.TbRecruitmentplan;
import com.entity.lqp.TbRoleUser;
import com.entity.lqp.TbUser;

import java.util.List;
import java.util.Map;

public interface APersoninfo {
    public List<Map> findinfoall();
    public List<Map<String,Object>> findinfobyname();
    public int insertinfo(TbPersoninfo tbPersoninfo);//增加数据
    public int deleteinfo(TbPersoninfo tbPersoninfo);//删除数据
    public int updateinfo(TbPersoninfo tbPersoninfo);//更新数据

    public List<Map<String,Object>> findShaixuan(TbPersoninfo tbPersoninfo);
    public int updateShaixuan(TbPersoninfo tbPersoninfo);//更新数据

    public int insertuser(TbUser tbUser);//增加user数据
    public List<Map<String,Object>> findinfobydept();
    public int insertRoleUser(TbRoleUser tbRoleUser);//增加user数据
    public List<Map<String,Object>> findinfobyrole();

}
