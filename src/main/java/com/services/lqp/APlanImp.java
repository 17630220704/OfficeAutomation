package com.services.lqp;

import com.dao.lqp.APlan;
import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentplan;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class APlanImp implements APlanService {
    @Autowired
    private APlan plan;
    @Override
    public List<Map> findplanall() {
        return plan.findplanall();
    }

    @Override
    public List<Map> findplanSX() {
        return plan.findplanSX();
    }

    @Override
    public List<Map> findplanSX1() {
        return plan.findplanSX1();
    }

    @Override
    public List<Map> findplanthem(TbRecruitmentplan tbRecruitmentplans) {
        return plan.findplanthem(tbRecruitmentplans);
    }

    @Override
    public int updatethem(TbRecruitmentplan tbRecruitmentplan) {
        return plan.updatethem(tbRecruitmentplan);
    }


    @Override
    public List<Map<String, Object>> findplanbyname() {
        return plan.findplanbyname();
    }

    @Override
    public List<Map<String, Object>> findplanbynameEnd() {
        return plan.findplanbynameEnd();
    }

    @Override
    public List<Map<String, Object>> findplanbypeople() {
        return plan.findplanbypeople();
    }

    @Override
    public int insertplan(TbRecruitmentplan tbRecruitmentplan) {
        return plan.insertplan(tbRecruitmentplan);
    }

    @Override
    public int insertplanAdd(TbRecruitmentplan tbRecruitmentplan) {
        return plan.insertplanAdd(tbRecruitmentplan);
    }

    @Override
    public int deleteplan(TbRecruitmentplan tbRecruitmentplan) {
        return plan.deleteplan(tbRecruitmentplan);
    }

    @Override
    public int updateplan(TbRecruitmentplan tbRecruitmentplan) {
        return plan.updateplan(tbRecruitmentplan);
    }

    @Override
    public int updateplanAdd(TbRecruitmentplan tbRecruitmentplan) {
        return plan.updateplanAdd(tbRecruitmentplan);
    }

    @Override
    public int updatehire(TbRecruitmentplan tbRecruitmentplan) {
        return plan.updatehire(tbRecruitmentplan);
    }

    @Override
    public List<Map> findpeople(String people) {
        return plan.findpeople(people);
    }

    @Override
    public List<Map> findhirepeople(TbHirefile tbHirefile) {
        return plan.findhirepeople(tbHirefile);
    }

    @Override
    public List<Map> findhirepeople1(TbHirefile tbHirefile, String people) {
        return plan.findhirepeople1(tbHirefile, people);
    }

    @Override
    public int updatepeople(TbRecruitmentplan tbRecruitmentplan) {
        return plan.updatepeople(tbRecruitmentplan);
    }

    @Override
    public int updatepeople1(TbRecruitmentplan tbRecruitmentplan) {
        return plan.updatepeople1(tbRecruitmentplan);
    }


}
