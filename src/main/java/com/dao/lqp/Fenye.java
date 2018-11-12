package com.dao.lqp;

import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbPersoninfo;
import com.entity.lqp.TbRecruitmentneed;
import com.entity.lqp.TbRecruitmentplan;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


public interface Fenye {
        List<TbHirefile> queryAllDataFromTable(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord);
        int queryAllCount(String keyWord);
        List<Map> queryAllinfo(@Param("page") int page, @Param("limit") int limit, @Param("keyWord1") String keyWord1);
        int queryinfoCount(String keyWord1);
        List<Map> queryAllplan(@Param("page") int page, @Param("limit") int limit, @Param("keyWord2") String keyWord2);
        int queryplanCount(String keyWord2);
        List<Map> queryAllneed(@Param("page") int page, @Param("limit") int limit, @Param("keyWord3") String keyWord3);
        int queryneedCount(String keyWord3);
}
