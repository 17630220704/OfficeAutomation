package com.services.lcy;

import com.entity.lcy.Email;
import com.entity.lcy.Mailboxinfo2;
import com.entity.lcy.TbPersoninfo;
import com.entity.lcy.TbUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface servicesEmail {
    public int mailAdd(Mailboxinfo2 mailboxinfo2);

    public List<TbPersoninfo> emailQuery();

    public int mailAdd1(Email email);

    public int mailAddBox(Mailboxinfo2 mailboxinfo2);

    public int mailAddBox1(Email email);

    public List<Map<String, Object>> mailQuery(@Param("posiId")int posiId,@Param("emailBoxid")int emailBoxid);
    public List<Map> mailXq(int bodyId);
    public int mailUpdate(Email e);
    public List<Email> app(@Param("bodyId")int bodyId, @Param("posiId")int posiId);
    public void mailUpdelete(Email e);
    public List<Map<String, Object>> LjQuery(@Param("posiId")int posiId,@Param("emailBoxid")int emailBoxid);
    public List<Map> LjXq(int bodyId);
    public int LjUpdate(int emailId);
    public List<Map<String, Object>> YfsQuery(@Param("posiId")int posiId,@Param("emailBoxid")int emailBoxid);
    public List<Map> YfsXq(int bodyId);
    public List<Map<String, Object>> CGQuery(@Param("posiId")int posiId,@Param("emailBoxid")int emailBoxid);
    public List<Map> CGqueryList(@Param("persoId")int persoId,@Param("EmailBoxid")int EmailBoxid,@Param("PosiId")int PosiId);
    public int CGdEdelete(@Param("emailId")int emailId);
    public int CGdMdelete(@Param("bodyId")int bodyId);
    public List<Email> CGQueryine(@Param("bodyId")int bodyId);
    public List<Map> CGQueryt(@Param("bodyId")int bodyId);
    public int CGAddUP(Mailboxinfo2 mailboxinfo2);
    public List<Email> CGQu(@Param("bodyId")int bodyId);
    public void CGUPdatee(@Param("EmailId")int EmailId,@Param("EmailBoxid")int EmailBoxid);
    public int CGAddUP1(Mailboxinfo2 mailboxinfo2);
    public List<Map> Tbuser(@Param("persoId")int persoId);
    public void TbuserUP(@Param("uId")int uId,@Param("uloginPassword")String uloginPassword);
    public List<Map> TbuserXq(@Param("persoId")int persoId);
    public int Tbuserupp(TbPersoninfo td);
    List<Mailboxinfo2> queryAllDataFromTable(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord,@Param("persoId") int persoId,@Param("EmailBoxid") int EmailBoxid);
    int queryAllCount(String keyWord,@Param("persoId") int persoId,@Param("EmailBoxid") int EmailBoxid);
    List<Mailboxinfo2> YfsQuery(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId);
    int YfsQueryCount(String keyWord, @Param("persoId") int persoId);
    List<Mailboxinfo2> dustbin(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);

    int dustbinCount(String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);


}
