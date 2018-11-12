package com.controller.yyl;

import com.entity.yyl.TbPersoninfo;
import com.entity.yyl.TbPosition;
import com.service.yyl.TbPersoninfoServiceImp;
import com.service.yyl.TbPositionServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TbPositionController")
public class TbPositionController {
    @Resource
    private TbPositionServiceImp tbpdao;
    @ResponseBody
    @RequestMapping(value="tbPquery.do")
    public List<Map>  TbPositionQuery(TbPosition tp){
        List<Map> list = tbpdao.TbPositionQuery(tp);
        return list;
    }
}
