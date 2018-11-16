package com.services.lqp;

import com.entity.lqp.TbRecruitmentemployed;
import com.entity.lqp.TbRecruitmentplan;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AEmployService {
    List<Map> findemployall(TbRecruitmentemployed tbRecruitmentemployed);
    List<Map> findemployallshaixuan(TbRecruitmentemployed tbRecruitmentemployed);
    List<Map<String,Object>> findemploybyname();
    List<Map<String,Object>> findemploybynamep();
    int insertemploy(TbRecruitmentemployed tbRecruitmentemployed);//增加数据
    int insertemployAdd(TbRecruitmentemployed tbRecruitmentemployed);//增加数据
    int deleteemploy(TbRecruitmentemployed tbRecruitmentemployed);//删除数据
    int updateemploy(TbRecruitmentemployed tbRecruitmentemployed);//更新数据

    List<Map<String,Object>> findShaixuan(TbRecruitmentemployed tbRecruitmentemployed);
    List<Map<String,Object>> findShaixuan2(TbRecruitmentemployed tbRecruitmentemployed);


    int updateShaixuan(TbRecruitmentemployed tbRecruitmentemployed);//更新数据
    int updateShaixuanluyong(TbRecruitmentemployed tbRecruitmentemployed);//更新数据

    int updatehire(TbRecruitmentemployed tbRecruitmentemployed);//更新hire数据
}
