package com.dao.lqp;

import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentplan;

import java.util.List;
import java.util.Map;

public interface AHire {
    List<Map> findhireall(TbHirefile tbHirefile);
    List<Map> findplanthem(TbRecruitmentplan tbRecruitmentplan);
    int inserthire(TbHirefile tbHirefile);//增加数据
    int inserthireAdd(TbHirefile tbHirefile);//增加数据
    int deletehire(TbHirefile tbHirefile);//删除数据
    int updatehire(TbHirefile tbHirefile);//更新数据
    int updatehireAdd(TbHirefile tbHirefile);//更新数据
}
