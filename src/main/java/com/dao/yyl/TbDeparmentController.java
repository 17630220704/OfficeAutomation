package com.dao.yyl;

import com.entity.yyl.TbDeparment;
import com.service.yyl.TbDeparmentServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TbDeparmentController")
public class TbDeparmentController {
    @Resource
    private TbDeparmentServiceImp tpdao;
    @ResponseBody
    @RequestMapping(value="tbPquery.do")
    public List<Map>  TbPositionQuery(TbDeparment tp){
        List<Map> list = tpdao.TbDeparmentQuery(tp);
        return list;
    }
    @ResponseBody
    @RequestMapping(value="tbDPquery.do")
    public List<Map>  TbDeparmentpersonfoQuery(TbDeparment tp){
        List<Map> list = tpdao.TbDeparmentpersonfoQuery(tp);
        return list;
    }
    @ResponseBody
    @RequestMapping(value="tbDPquery2.do")
    public List<Map>  TbDeparmentpersonfoQuery2(TbDeparment tp){
        List<Map> list = tpdao.TbDeparmentpersonfoQuery2(tp);
        return list;
    }
    @ResponseBody
    @RequestMapping(value="tbSPquery.do")
    public List<Map>  TbDeparmentpersonfo_StaffQuery(TbDeparment tp){
        List<Map> list = tpdao.TbDeparmentpersonfo_StaffQuery(tp);
        return list;
    }
    @ResponseBody
    @RequestMapping(value="tbSPquery2.do")
    public List<Map>  TbDeparmentpersonfo_StaffQuery2(TbDeparment tp){
        List<Map> list = tpdao.TbDeparmentpersonfo_StaffQuery2(tp);
        return list;
    }
}
