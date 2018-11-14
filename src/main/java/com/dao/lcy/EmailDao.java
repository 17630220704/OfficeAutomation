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
    int mailAdd(Mailboxinfo2 mailboxinfo2);

    /*添加记录*/
    int mailAdd1(Email email);

    /*查询员工 id name*/
    List<TbPersoninfo> emailQuery();

    /*  查询 邮件状态显示*/
    /*保存草稿箱*/
    int mailAddBox(Mailboxinfo2 mailboxinfo2);

    int mailAddBox1(Email email);

    /*查询收件箱 修该动态*/
    List<Map<String, Object>> mailQuery(@Param("posiId") int posiId, @Param("emailBoxid") int emailBoxid);

    List<Map> mailXq(int bodyId);

    /*修改阅读状态*/
    List<Email> app(@Param("bodyId") int bodyId, @Param("posiId") int posiId);

    /*删除邮件*/
    int mailUpdate(Email e);

    /*修改阅读状态*/
    void mailUpdelete(Email e);

    /*垃圾箱查询以及详情*/
    List<Map<String, Object>> LjQuery(@Param("posiId") int posiId, @Param("emailBoxid") int emailBoxid);

    List<Map> LjXq(int bodyId);

    int LjUpdate(int emailId);

    /*已发件箱*/
    List<Map<String, Object>> YfsQuery(@Param("posiId") int posiId, @Param("emailBoxid") int emailBoxid);

    List<Map> YfsXq(int bodyId);

    /*草稿箱*/
    List<Map<String, Object>> CGQuery(@Param("posiId") int posiId, @Param("emailBoxid") int emailBoxid);

    List<Map> CGqueryList(@Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid, @Param("PosiId") int PosiId);

    int CGdEdelete(@Param("emailId") int emailId);

    List<Email> CGQueryine(@Param("bodyId") int bodyId);

    int CGdMdelete(@Param("bodyId") int bodyId);

    List<Map> CGQueryt(@Param("bodyId") int bodyId);

    /*编辑邮件 修改状态 */
    int CGAddUP(Mailboxinfo2 mailboxinfo2);

    List<Email> CGQu(@Param("bodyId") int bodyId);

    void CGUPdatee(@Param("EmailId") int EmailId, @Param("EmailBoxid") int EmailBoxid);

    /*保存邮件*/
    int CGAddUP1(Mailboxinfo2 mailboxinfo2);

    List<Map> Tbuser(@Param("persoId") int persoId);

    void TbuserUP(@Param("uId") int uId, @Param("uloginPassword") String uloginPassword);

    List<Map> TbuserXq(@Param("persoId") int persoId);

    int Tbuserupp(TbPersoninfo td);

    /* 收件箱分页查询*/
    List<Mailboxinfo2> queryAllDataFromTable(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);

    int queryAllCount(String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);

    /* 发件箱分页查询*/
    List<Mailboxinfo2> YfsQuery(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId);

    int YfsQueryCount(String keyWord, @Param("persoId") int persoId);

    /*垃圾箱*/
    List<Mailboxinfo2> dustbin(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);

    int dustbinCount(String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);
   /*草稿箱*/
   List<Mailboxinfo2> rough(@Param("page") int page, @Param("limit") int limit, @Param("keyWord") String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);

    int roughCount(String keyWord, @Param("persoId") int persoId, @Param("EmailBoxid") int EmailBoxid);
     /*查询密码*/
     List<Map> Tbuserpass(@Param("uId") int uId);

}
