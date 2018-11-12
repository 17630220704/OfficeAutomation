package com.controller.yyl;

import com.entity.yyl.TdStaff;
import com.service.yyl.TdStaffServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TdStaffController")
public class TdStaffController {
    @Resource
    private TdStaffServiceImp tsdao;
    @ResponseBody
    @RequestMapping(value="td_squery.do")
    public List tdStaffQuery(TdStaff ts){
        List<Map> tdStaff = tsdao.TdStaffQuery(ts);
        return tdStaff;
    }
    @RequestMapping(value="td_sadd.do")
    public void tdStaffAdd(TdStaff ts){
        tsdao.TdStaffAdd(ts);
    }
    @RequestMapping(value="td_update.do")
    public void tdScheduleUpdate(TdStaff ts){
        tsdao.TdStaffUpdate(ts);
    }
    @RequestMapping(value="td_delete.do")
    public void tdScheduleDelete(TdStaff ts){
        tsdao.TdStaffDelete(ts);
    }
}
