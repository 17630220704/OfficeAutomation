package com.controller.permit;

import com.entity.permit.TbUser;
import com.services.permit.permitLoginService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("singleton")
public class permitLoginController {

    @Resource(name="permitLoginServiceImp")
    private permitLoginService permitLoginServicedao;
    private int userid=0;

    @ResponseBody
    @RequestMapping(value = "/permitLogin.do")
    public Map permitLogin(TbUser user){            //登陆
        Map<String,Object> map = new HashMap<String,Object>();
        int login_result = 3;   // 0正常   1账号密码错   2 被加入黑名单    3系统繁忙
        map= permitLoginServicedao.getlogin(user);
        login_result = Integer.parseInt(map.get("loginresult").toString());
        if (login_result==0){
        userid = Integer.parseInt(map.get("userid").toString());
        }
        map.put("loginresult",login_result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/Signout.do")
    public void Signout(){         //登出
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        session.invalidate();
    }
    @ResponseBody
    @RequestMapping(value = "/permitgetTree.do")
    public Map<String, Object> permitgetTree(){          //获取一级菜单
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map> list= permitLoginServicedao.getTree(userid);
        System.out.println("controller   菜单："+list);
        map.put("getTree",list);
        return map;
    };
    @ResponseBody
    @RequestMapping(value = "/getTrees.do")
    public Map getTrees(int m_id){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map> list= permitLoginServicedao.getTrees(m_id);
        map.put("getTrees",list);
        System.out.println("controller 二级菜单："+list);
        return map;
    }

    /*Get&Set*/
    public permitLoginService getPermitLoginServicedao() {
        return permitLoginServicedao;
    }

    public void setPermitLoginServicedao(permitLoginService permitLoginServicedao) {
        this.permitLoginServicedao = permitLoginServicedao;
    }
}
