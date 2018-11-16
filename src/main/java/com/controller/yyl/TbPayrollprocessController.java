package com.controller.yyl;

import com.entity.yyl.TbPayrollprocess;
import com.service.yyl.TbPayrollprocessServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TbPayrollprocessController")
public class TbPayrollprocessController {
    @Resource
    private TbPayrollprocessServiceImp tpldao;
    @ResponseBody
    @RequestMapping(value="tpl_query.do")
    public List<Map> TbPayrollprocessQuery(TbPayrollprocess tpl){
        List<Map> map = tpldao.TbPayrollprocessQuery();
        return map;
    }
    @RequestMapping(value="tpl_add.do")
    public void TbPayrollprocessAdd(TbPayrollprocess tpl){
        System.out.println(tpl);
        tpldao.TbPayrollprocessAdd(tpl);
    }
    @RequestMapping(value="tpl_update.do")
    public void TbPayrollprocessUpdate(TbPayrollprocess tpl){
        tpldao.TbPayrollprocessUpdate(tpl);
    }
    @RequestMapping(value="tpl_delete.do")
    public void TbPayrollprocessDelete(TbPayrollprocess tpl){
        tpldao.TbPayrollprocessDetle(tpl);
    }
}
