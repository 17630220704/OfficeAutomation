package com.services.lqp;

import com.dao.lqp.AEmploy;
import com.entity.lqp.TbRecruitmentemployed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class AEmployServiceImp implements  AEmployService{
    @Autowired
    private AEmploy aEmploy;
    @Override
    public List<Map> findemployall() {
        return aEmploy.findemployall();
    }

    @Override
    public List<Map<String, Object>> findemploybynamep() {
        return aEmploy.findemploybynamep();
    }

    @Override
    public List<Map<String, Object>> findemploybyname() {
        return aEmploy.findemploybyname();
    }

    @Override
    public int insertemploy(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.insertemploy(tbRecruitmentemployed);
    }

    @Override
    public int deleteemploy(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.deleteemploy(tbRecruitmentemployed);
    }

    @Override
    public int updateemploy(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.updateemploy(tbRecruitmentemployed);
    }

    @Override
    public List<Map<String, Object>> findShaixuan(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.findShaixuan(tbRecruitmentemployed);
    }

    @Override
    public int updateShaixuan(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.updateShaixuan(tbRecruitmentemployed);
    }
}
