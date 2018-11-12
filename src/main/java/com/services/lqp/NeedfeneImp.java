package com.services.lqp;

import com.entity.lqp.TbRecruitmentneed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("needfeneImp")
public class NeedfeneImp implements  Needfenye {
 @Autowired(required = false)
    private Needfenye  needfenye;
    @Override
    public List<Map> queryAlltbRecruitmentneed(int pageneed, int limitneed, String keyWordneed) {
        pageneed=(pageneed-1)*limitneed;
        return needfenye.queryAlltbRecruitmentneed(pageneed, limitneed, keyWordneed);
    }
    @Override
    public int queryAlltbRecruitmentneedCount(String keyWordneed) {
        return needfenye.queryAlltbRecruitmentneedCount(keyWordneed);
    }
}
