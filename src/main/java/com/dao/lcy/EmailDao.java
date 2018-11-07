package com.dao.lcy;

import com.entity.lcy.Email;
import com.entity.lcy.Mailboxinfo2;
import com.entity.lcy.TbPersoninfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface EmailDao {
    /*添加邮件主题*/
    public int mailAdd(Mailboxinfo2 mailboxinfo2);

    /*添加记录*/
    public int mailAdd1(Email email);

    /*查询员工 id name*/
    public List<TbPersoninfo> emailQuery();

    /*  查询 邮件状态显示*/
    /*保存草稿箱*/
    public int mailAddBox(Mailboxinfo2 mailboxinfo2);

    public int mailAddBox1(Email email);
    /*查询收件箱 修该动态*/
    public List<Map<String, Object>> mailQuery(@Param("posiId")int posiId,@Param("emailBoxid")int emailBoxid);
    public List<Map> mailXq(int bodyId);
    /*修改阅读状态*/
    public List<Email> app(@Param("bodyId")int bodyId,@Param("posiId")int posiId);
   /*删除邮件*/
    public int mailUpdate(Email e);
    /*修改阅读状态*/
    public void mailUpdelete(Email e);
    /*垃圾箱查询以及详情*/
    public List<Map<String, Object>> LjQuery(@Param("posiId")int posiId,@Param("emailBoxid")int emailBoxid);
    public List<Map> LjXq(int bodyId);
    public int LjUpdate(int emailId);
    /*已发件箱*/
    public List<Map<String, Object>> YfsQuery(@Param("posiId")int posiId,@Param("emailBoxid")int emailBoxid);
    public List<Map> YfsXq(int bodyId);
    /*草稿箱*/
    public List<Map<String, Object>> CGQuery(@Param("posiId")int posiId,@Param("emailBoxid")int emailBoxid);
    public List<Map> CGqueryList(@Param("persoId")int persoId,@Param("EmailBoxid")int EmailBoxid,@Param("PosiId")int PosiId);
    public int CGdEdelete(@Param("emailId")int emailId);
    public List<Email> CGQueryine(@Param("bodyId")int bodyId);
    public int CGdMdelete(@Param("bodyId")int bodyId);
    public List<Map> CGQueryt(@Param("bodyId")int bodyId);
    /*编辑邮件 修改状态 */
    public int CGAddUP(Mailboxinfo2 mailboxinfo2);
    public List<Email> CGQu(@Param("bodyId")int bodyId);
    public void CGUPdatee(@Param("EmailId")int EmailId,@Param("EmailBoxid")int EmailBoxid);
    /*保存邮件*/
    public int CGAddUP1(Mailboxinfo2 mailboxinfo2);
    public List<Map> Tbuser(@Param("persoId")int persoId);
    public void TbuserUP(@Param("uId")int uId,@Param("uloginPassword")String uloginPassword);
    public List<Map> TbuserXq(@Param("persoId")int persoId);
    public int Tbuserupp(TbPersoninfo td);
   /* 分页查询*/
   List<Mailboxinfo2> queryAllDataFromTable(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord,@Param("persoId") int persoId,@Param("EmailBoxid") int EmailBoxid);
   int queryAllCount(String keyWord,@Param("persoId") int persoId,@Param("EmailBoxid") int EmailBoxid);

}
