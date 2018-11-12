package com.services.lqp;

import com.entity.lqp.TbRecruitmentneed;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface Needfenye {
    List<Map> queryAlltbRecruitmentneed(@Param("pageneed") int pageneed, @Param("limitneed") int limitneed, @Param("keyWordneed") String keyWordneed);
    int queryAlltbRecruitmentneedCount(String keyWordneed);
}
