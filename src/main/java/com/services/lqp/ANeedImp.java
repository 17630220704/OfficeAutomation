package com.services.lqp;

import com.dao.lqp.ANeed;
import com.entity.lqp.TbDeparment;
import com.entity.lqp.TbRecruitmentneed;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;
@Service
public class ANeedImp implements ANeedService {
    @Autowired
    private ANeed need;
    @Override
    public List<Map> findneedall(@Param("tbRecruitmentneed") TbRecruitmentneed tbRecruitmentneed, TbDeparment tbDeparment, @Param("small") Date small, @Param("big") Date big ) {
        return need.findneedall(tbRecruitmentneed,tbDeparment,small, big);
    }

    @Override
    public List<Map<String, Object>> findneedbyname() {
        return need.findneedbyname();
    }

    @Override
    public int insertneed(TbRecruitmentneed tbRecruitmentneed) {
        return need.insertneed(tbRecruitmentneed);
    }

    @Override
    public int deleteneed(TbRecruitmentneed tbRecruitmentneed) {
        return need.deleteneed(tbRecruitmentneed);
    }

    @Override
    public int updateneed(TbRecruitmentneed tbRecruitmentneed) {
        return need.updateneed(tbRecruitmentneed);
    }

    @Override
    public List<Map> findneedShenpi(TbRecruitmentneed tbRecruitmentneed, String shenpi) {
        return need.findneedShenpi(tbRecruitmentneed, shenpi);
    }
}
