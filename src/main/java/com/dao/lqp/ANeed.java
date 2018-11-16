package com.dao.lqp;

import com.entity.lqp.TbDeparment;
import com.entity.lqp.TbRecruitmentneed;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ANeed {
    List<Map> findneedall(@Param("tbRecruitmentneed") TbRecruitmentneed tbRecruitmentneed, TbDeparment tbDeparment, @Param("small") String small, @Param("big") String big);
    List<Map<String,Object>> findneedbyname();
    int insertneed(TbRecruitmentneed tbRecruitmentneed);//增加数据
    int deleteneed(TbRecruitmentneed tbRecruitmentneed);//删除数据
    int updateneed(TbRecruitmentneed tbRecruitmentneed);//更新数据
    int updateneedshenpi(TbRecruitmentneed tbRecruitmentneed);//更新shenpi数据
    List<Map> findneedShenpi(@Param("tbRecruitmentneed") TbRecruitmentneed tbRecruitmentneed, @Param("shenpi") String shenpi);
}
