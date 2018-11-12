package com.dao.lqp;

import com.entity.lqp.TbPersoninfo;
import com.entity.lqp.TbRecruitmentemployed;
import com.entity.lqp.TbRecruitmentplan;
import com.entity.lqp.TbUser;

import java.util.List;
import java.util.Map;

public interface AEmploy {
    public List<Map> findemployall();
    public List<Map<String,Object>> findemploybyname();
    public List<Map<String,Object>> findemploybynamep();
    public int insertemploy(TbRecruitmentemployed tbRecruitmentemployed);//增加数据
    public int deleteemploy(TbRecruitmentemployed tbRecruitmentemployed);//删除数据
    public int updateemploy(TbRecruitmentemployed tbRecruitmentemployed);//更新数据

    public List<Map<String,Object>> findShaixuan(TbRecruitmentemployed tbRecruitmentemployed);
    public int updateShaixuan(TbRecruitmentemployed tbRecruitmentemployed);//更新数据



}
