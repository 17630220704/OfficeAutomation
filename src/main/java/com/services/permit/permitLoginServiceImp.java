package com.services.permit;

import com.dao.permit.permitLogin;
import com.entity.permit.TbUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service("permitLoginServiceImp")
public class permitLoginServiceImp implements permitLoginService {

    @Autowired
    private permitLogin permitLogindao;

    @Override
    public Map<String,Object> getlogin(TbUser tbUser) {
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    HttpSession session = request.getSession();
    Map<String,Object> map = new HashMap<String,Object>();
        int loginresult = 0;//登陆结果
        int lackresult = 1; //黑名单结果
        int userid = 0; //用户id
        String username = null;//用户名
        //登陆验证
        List<Map> loginlist =  permitLogindao.getlogin(tbUser);
        loginresult = loginlist.size();
        //黑名单查询
        if (loginresult>0){
            username = loginlist.get(0).get("PersonName").toString();
            userid = Integer.parseInt(loginlist.get(0).get("u_id").toString());
            List<Map> Lacklist =  permitLogindao.LoginLacklist(userid);
            lackresult = Lacklist.size();
            if (lackresult==0){
                session.setAttribute("username",username);
                session.setAttribute("userid",userid);
                map.put("loginresult",0);//登陆成功
                map.put("userid",userid);
                //System.out.println("登陆成功的map："+map);
            }else {
                map.put("loginresult",2);//被加入黑名单
                // System.out.println("被加入黑名单的map："+map);
            }
        }else if (loginresult<=0){
            map.put("loginresult",1);//账号密码错
            //System.out.println("账号密码错的map："+map);
        }else {
            map.put("loginresult",3);//系统繁忙
            //System.out.println("系统繁忙的map："+map);
        }
        return map;
    }

    @Override
    public  List<Map> getTree(int userid) {
        List<Map> list= permitLogindao.ListTree(userid);
        return list;
    }

    @Override
    public List<Map> getTrees(Integer m_id,int userid) {
        List<Map> list= permitLogindao.ListTrees(m_id,userid);
        return list;
    }

}
