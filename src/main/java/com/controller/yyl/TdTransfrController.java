package com.controller.yyl;

import com.entity.yyl.TbPersoninfo;
import com.entity.yyl.TdStaff;
import com.entity.yyl.TdTransfer;
import com.service.yyl.TbPersoninfoServiceImp;
import com.service.yyl.TdTransfrServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TdTransfrController")
public class TdTransfrController {
    @Resource
    private TdTransfrServiceImp ttdao;
    @Resource
    private TbPersoninfoServiceImp tpdao;
    @ResponseBody
    @RequestMapping(value="tt_query.do")
    public List tdStaffQuery(TdTransfer tt){
        List<Map> list = ttdao.TdTransferQuery(tt);
        return list;
    }
    @RequestMapping(value="tt_add.do")
    public void tdStaffAdd(TdTransfer tt, TbPersoninfo tp){
        ttdao.TdTransferAdd(tt,tp);
    }
    @RequestMapping(value="tt_update.do")
    public void tdScheduleUpdate(TdTransfer tt){
        ttdao.TdTransferUpdate(tt);
    }
    @RequestMapping(value="tt_delete.do")
    public void tdScheduleDelete(TdTransfer tt){
        ttdao.TdTransferDatity(tt);
    }
}
