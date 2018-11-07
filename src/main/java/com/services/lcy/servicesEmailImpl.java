package com.services.lcy;

import com.dao.lcy.EmailDao;
import com.entity.lcy.Email;
import com.entity.lcy.Mailboxinfo2;
import com.entity.lcy.TbPersoninfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class servicesEmailImpl implements servicesEmail {
    @Autowired
    private EmailDao dao;

    @Override
    public int mailAdd(Mailboxinfo2 mailboxinfo2) {
        return dao.mailAdd(mailboxinfo2);
    }

    @Override
    public List<TbPersoninfo> emailQuery() {
        return dao.emailQuery();
    }

    @Override
    public int mailAdd1(Email email) {
        return dao.mailAdd1(email);
    }

    @Override
    public int mailAddBox(Mailboxinfo2 mailboxinfo2) {
        return dao.mailAddBox(mailboxinfo2);
    }

    @Override
    public int mailAddBox1(Email email) {
        return dao.mailAddBox1(email);
    }

    @Override
    public List<Map<String, Object>> mailQuery(int posiId, int emailBoxid) {
        return dao.mailQuery(posiId, emailBoxid);
    }

    @Override
    public List<Map> mailXq(int bodyId) {
        return dao.mailXq(bodyId);
    }

    @Override
    public int mailUpdate(Email e) {
        return dao.mailUpdate(e);
    }

    @Override
    public List<Email> app(int bodyId, int posiId) {
        return dao.app(bodyId, posiId);
    }

    @Override
    public void mailUpdelete(Email e) {
        dao.mailUpdelete(e);
    }

    @Override
    public List<Map<String, Object>> LjQuery(int persoId, int emailBoxid) {
        return dao.LjQuery(persoId, emailBoxid);
    }

    @Override
    public List<Map> LjXq(int bodyId) {
        return dao.LjXq(bodyId);
    }

    @Override
    public int LjUpdate(int emailId) {
        return dao.LjUpdate(emailId);
    }

    @Override
    public List<Map<String, Object>> YfsQuery(int persoId, int emailBoxid) {
        return dao.YfsQuery(persoId, emailBoxid);
    }

    @Override
    public List<Map> YfsXq(int bodyId) {
        return dao.YfsXq(bodyId);
    }

    @Override
    public List<Map<String, Object>> CGQuery(int posiId, int emailBoxid) {
        return dao.CGQuery(posiId, emailBoxid);
    }

    @Override
    public List<Map> CGqueryList(int persoId, int EmailBoxid, int PosiId) {
        return dao.CGqueryList(persoId, EmailBoxid, PosiId);
    }

    @Override
    public int CGdEdelete(int emailId) {
        return dao.CGdEdelete(emailId);
    }

    @Override
    public int CGdMdelete(int bodyId) {
        return dao.CGdMdelete(bodyId);
    }

    @Override
    public List<Email> CGQueryine(int bodyId) {
        return dao.CGQueryine(bodyId);
    }

    @Override
    public List<Map> CGQueryt(int bodyId) {
        return dao.CGQueryt(bodyId);
    }

    @Override
    public int CGAddUP(Mailboxinfo2 mailboxinfo2) {
        return dao.CGAddUP(mailboxinfo2);
    }

    @Override
    public List<Email> CGQu(int bodyId) {
        return dao.CGQu(bodyId);
    }

    @Override
    public void CGUPdatee(int EmailId, int EmailBoxid) {
        dao.CGUPdatee(EmailId, EmailBoxid);
    }

    @Override
    public int CGAddUP1(Mailboxinfo2 mailboxinfo2) {
        return dao.CGAddUP1(mailboxinfo2);
    }

    @Override
    public List<Map> Tbuser(int persoId) {
        return dao.Tbuser(persoId);
    }

    @Override
    public void TbuserUP(int uId, String uloginPassword) {
        dao.TbuserUP(uId, uloginPassword);
    }

    @Override
    public List<Map> TbuserXq(int persoId) {
        return dao.TbuserXq(persoId);
    }

    @Override
    public int Tbuserupp(TbPersoninfo td) {
        return dao.Tbuserupp(td);
    }

    @Override
    public List<Mailboxinfo2> queryAllDataFromTable(int page, int limit, String keyWord, int persoId, int EmailBoxid) {
        page = (page - 1) * limit;
        return dao.queryAllDataFromTable(page, limit, keyWord, persoId, EmailBoxid);
    }

    @Override
    public int queryAllCount(String keyWord, int persoId, int EmailBoxid) {
        return dao.queryAllCount(keyWord, persoId, EmailBoxid);
    }

    @Override
    public List<Mailboxinfo2> YfsQuery(int page, int limit, String keyWord, int persoId) {
        page = (page - 1) * limit;
        return dao.YfsQuery(page, limit, keyWord, persoId);
    }

    @Override
    public int YfsQueryCount(String keyWord, int persoId) {
        return dao.YfsQueryCount(keyWord, persoId);
    }

    @Override
    public List<Mailboxinfo2> dustbin(int page, int limit, String keyWord, int persoId,int EmailBoxid) {
        page = (page - 1) * limit;
        return dao.dustbin(page, limit, keyWord, persoId,EmailBoxid);
    }

    @Override
    public int dustbinCount(String keyWord, int persoId,int EmailBoxid) {
        return dao.dustbinCount(keyWord, persoId, EmailBoxid);
    }
}
