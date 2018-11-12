package com.services.lqp;

import com.entity.lqp.TbDeparment;
import com.entity.lqp.TbRecruitmentneed;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ANeedService {
    public List<Map> findneedall(@Param("tbRecruitmentneed") TbRecruitmentneed tbRecruitmentneed, TbDeparment tbDeparment, @Param("small") Date small, @Param("big") Date big);
    public List<Map<String,Object>> findneedbyname();
    public int insertneed(TbRecruitmentneed tbRecruitmentneed);//增加数据
    public int deleteneed(TbRecruitmentneed tbRecruitmentneed);//删除数据
    public int updateneed(TbRecruitmentneed tbRecruitmentneed);//更新数据

    public List<Map> findneedShenpi(@Param("tbRecruitmentneed") TbRecruitmentneed tbRecruitmentneed, @Param("shenpi") String shenpi);
}
