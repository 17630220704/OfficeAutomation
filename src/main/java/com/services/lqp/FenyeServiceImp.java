package com.services.lqp;

import com.dao.lqp.Fenye;
import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbPersoninfo;
import com.entity.lqp.TbRecruitmentneed;
import com.entity.lqp.TbRecruitmentplan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class FenyeServiceImp implements FenyeService {
@Autowired
private  Fenye fenye;


    @Override
    public List<TbHirefile> queryAllDataFromTable(int page, int limit, String keyWord) {
        page=(page-1)*limit;
        return fenye.queryAllDataFromTable(page, limit, keyWord);
    }

    @Override
    public int queryAllCount(String keyWord) {
        return fenye.queryAllCount(keyWord);
    }

    @Override
    public List<Map> queryAllinfo(int page, int limit, String keyWord1) {
        page=(page-1)*limit;
        return fenye.queryAllinfo(page, limit, keyWord1);
    }

    @Override
    public int queryinfoCount(String keyWord1) {
        return fenye.queryinfoCount(keyWord1);
    }

    @Override
    public List<Map> queryAllplan(int page, int limit, String keyWord2) {
        page=(page-1)*limit;
        return fenye.queryAllplan(page, limit, keyWord2);
    }

    @Override
    public int queryplanCount(String keyWord2) {
        return fenye.queryplanCount(keyWord2);
    }

    @Override
    public List<Map> queryAllneed(int page, int limit, String keyWord3) {
        page=(page-1)*limit;
        return fenye.queryAllneed(page, limit, keyWord3);
    }

    @Override
    public int queryneedCount(String keyWord3) {
        return fenye.queryneedCount(keyWord3);
    }


}
