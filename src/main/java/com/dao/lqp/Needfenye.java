package com.dao.lqp;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

public interface Needfenye {
    List<Map> queryAlltbRecruitmentneed(@Param("pageneed") int pageneed, @Param("limitneed") int limitneed, @Param("keyWordneed") String keyWordneed);
    int queryAlltbRecruitmentneedCount(String keyWordneed);
}
