package com.services.permit;

import com.dao.permit.permitLogin;
import com.entity.permit.TbUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service("permitLoginServiceImp")
public class permitLoginServiceImp implements permitLoginService {

    @Autowired
    private permitLogin permitLogindao;

    @Override
    public int getlogin(TbUser tbUser) {
/**
 * @param loginresult 登陆结果
 * */
        int loginresult = 0;//登陆结果
        int lackresult = 0; //黑名单结果
        int userid = 0; //用户id
        //登陆验证
        List<Map> loginlist =  permitLogindao.getlogin(tbUser);
        loginresult = loginlist.size();
        try {
       //黑名单查询
        userid = Integer.parseInt(loginlist.get(0).get("u_id").toString());
        List<Map> Lacklist =  permitLogindao.LoginLacklist(userid);
        lackresult = Lacklist.size();
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("账号loginresult:"+loginresult);
        System.out.println("黑名单lackresult:"+lackresult);
        if (loginresult>0 && lackresult<=0 ){
            return 0;//登陆成功
        }else if(loginresult>0 &&lackresult>0) {
            return 2;//被加入黑名单
        }else if (loginresult<=0){
            return 1;//账号密码错
        }else {
            return  3;//系统繁忙
        }
    }

}
