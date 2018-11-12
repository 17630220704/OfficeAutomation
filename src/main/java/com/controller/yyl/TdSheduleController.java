package com.controller.yyl;

import com.entity.yyl.TdSchedule;
import com.service.yyl.TdScheduleServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TdScheduleController")
public class TdSheduleController {
    @Resource(name="tdScheduleServiceImp")
    private TdScheduleServiceImp tsdao;
    @ResponseBody
    @RequestMapping(value="td_squery.do")
    public List tdScheduleQuery(){
        List<Map> list = tsdao.TdScheduleQuery();
        return list;
    }
    @RequestMapping(value="td_sadd.do")
    public void tdScheduleAdd(TdSchedule ts){
        tsdao.TdScheduleAdd(ts);
    }
    @RequestMapping(value="tdupdate.do")
    public void tdScheduleUpdate(TdSchedule ts){
        tsdao.TdScheduleUpdate(ts);
    }
    @RequestMapping(value="tddelete.do")
    public void tdScheduleDelete(int ts_id){
        tsdao.TdScheduleDelete(ts_id);
    }
}
