package com.service.yyl;

import com.dao.yyl.TbPersoninfoDao;
import com.dao.yyl.TdTransferDao;
import com.entity.yyl.TbPersoninfo;
import com.entity.yyl.TdStaff;
import com.entity.yyl.TdTransfer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service
public class TdTransfrServiceImp implements TdTransferService{
    @Autowired
    private TdTransferDao tdTransferDao;
    @Autowired
    private TbPersoninfoDao tbpersoninfodao;

    @Override
    public List<Map> TdTransferQuery(TdTransfer tt) {
        return tdTransferDao.TdTransferQuery(tt);
    }

    @Override
    public void TdTransferAdd(TdTransfer tt, TbPersoninfo tp) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        session.getAttribute("username");
        session.getAttribute("userid");
        String a = (String)session.getAttribute("username");
        tt.setResponsiblePerson(a);
        tbpersoninfodao.TbPersoninfoUpdate(tp);
        tdTransferDao.TdTransferAdd(tt);
    }

    @Override
    public void TdTransferUpdate(TdTransfer tt) {
        tdTransferDao.TdTransferUpdate(tt);
    }

    @Override
    public void TdTransferDatity(TdTransfer tt) {
        tdTransferDao.TdTransferDatity(tt);
    }
}
