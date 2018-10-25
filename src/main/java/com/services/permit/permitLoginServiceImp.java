package com.services.permit;

import com.dao.permit.permitLogin;
import com.entity.permit.TbUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service("permitLoginServiceImp")
public class permitLoginServiceImp implements permitLoginService {

    @Autowired
    private permitLogin permitLogindao;

    @Override
    public int getlogin(TbUser tbUser) {
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    HttpSession session = request.getSession();
        int loginresult = 0;//登陆结果
        int lackresult = 1; //黑名单结果
        int userid = 0; //用户id
        String username = null;//用户名
        //登陆验证
        List<Map> loginlist =  permitLogindao.getlogin(tbUser);
        loginresult = loginlist.size();
        //黑名单查询
        if (loginresult>0){
            username = loginlist.get(0).get("userName").toString();
            userid = Integer.parseInt(loginlist.get(0).get("u_id").toString());
            List<Map> Lacklist =  permitLogindao.LoginLacklist(userid);
            lackresult = Lacklist.size();
        }
        if (loginresult>0 && lackresult<=0 ){
            session.setAttribute("userid",userid);
            session.setAttribute("username",username);
            return 0;//登陆成功
        }else if(loginresult>0 &&lackresult>0) {
            return 2;//被加入黑名单
        }else if (loginresult<=0){
            return 1;//账号密码错
        }else {
            return  3;//系统繁忙
        }

    }

    @Override
    public  Map<String,Object> getTree(long userid) {
        Map<String,Object> map = new HashMap<String,Object>();
        map = permitLogindao.ListTree(userid);
        return map;
    }

}
