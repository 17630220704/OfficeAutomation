package com.services.lcy;

import com.entity.lcy.Email;
import com.entity.lcy.Mailboxinfo2;
import com.entity.lcy.TbPersoninfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface servicesEmail {
    int mailAdd(Mailboxinfo2 mailboxinfo2);

    List<TbPersoninfo> emailQuery();

    int mailAdd1(Email email);

    int mailAddBox(Mailboxinfo2 mailboxinfo2);

    int mailAddBox1(Email email);

    List<Map<String, Object>> mailQuery(@Param("posiId") int posiId, @Param("emailBoxid") int emailBoxid);
    List<Map> mailXq(int bodyId);
    int mailUpdate(Email e);
    List<Email> app(@Param("bodyId") int bodyId, @Param("posiId") int posiId);
    void mailUpdelete(Email e);
    List<Map<String, Object>> LjQuery(@Param("posiId") int posiId, @Param("emailBoxid") int emailBoxid);
    List<Map> LjXq(int bodyId);
    int LjUpdate(int emailId);
    List<Map<String, Object>> YfsQuery(@Param("posiId") int posiId, @Param("emailBoxid") int emailBoxid);
    List<Map> YfsXq(int bodyId);
    List<Map<String, Object>> CGQuery(@Param("posiId") int posiId, @Param("emailBoxid") int emailBoxid);
    List<Map> CGqueryList(@Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid, @Param("PosiId") int PosiId);
    int CGdEdelete(@Param("emailId") int emailId);
    int CGdMdelete(@Param("bodyId") int bodyId);
    List<Email> CGQueryine(@Param("bodyId") int bodyId);
    List<Map> CGQueryt(@Param("bodyId") int bodyId);
    int CGAddUP(Mailboxinfo2 mailboxinfo2);
    List<Email> CGQu(@Param("bodyId") int bodyId);
    void CGUPdatee(@Param("EmailId") int EmailId, @Param("EmailBoxid") int EmailBoxid);
    int CGAddUP1(Mailboxinfo2 mailboxinfo2);
    List<Map> Tbuser(@Param("persoId") int persoId);
    void TbuserUP(@Param("uId") int uId, @Param("uloginPassword") String uloginPassword);
    List<Map> TbuserXq(@Param("persoId") int persoId);
    int Tbuserupp(TbPersoninfo td);
    List<Mailboxinfo2> queryAllDataFromTable(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);
    int queryAllCount(String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);
    List<Mailboxinfo2> YfsQuery(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId);
    int YfsQueryCount(String keyWord, @Param("persoId") int persoId);
    List<Mailboxinfo2> dustbin(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);

    int dustbinCount(String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);
    List<Mailboxinfo2> rough(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);

    int roughCount(String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);
    List<Map> Tbuserpass(@Param("uId") int uId);
}
