package com.services.adinistration;

import com.dao.adinistration.WorksurfaceDao;
import com.entity.adinistration.Apply;
import com.entity.adinistration.Bank;
import com.entity.adinistration.Sort;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.entity.adinistration.Worksurface;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service("worksurfaceServicesImp")
public class WorksurfaceServicesImp implements worksurfaceServicesDao {

    @Autowired
    private WorksurfaceDao worksurfacedao;


    /*
    * 办公用品
    * */
    //条件查询
    @Override
    public List<Map<String, Object>> query_worksurface(String workName) {
        return worksurfacedao.query_worksurface(workName);
    }
    //办公用品增加
    @Override
    public int save_worksurface(Worksurface worksurface) {
        return worksurfacedao.save_worksurface(worksurface);
    }
    //办公用品修改
    @Override
    public int update_worksurface(Worksurface worksurface) {
        return worksurfacedao.update_worksurface(worksurface);
    }
    //办公用品删除
    @Override
    public int delete_worksurface(Worksurface worksurface) {
        return worksurfacedao.delete_worksurface(worksurface);
    }
    //查询
    @Override
    public List<Map<String, Object>> query_worksurface1() {
        return worksurfacedao.query_worksurface1();
    }

   /* @Override
    public List<Worksurface> query1(String workName) {
        return worksurfacedao.query1(workName);
    }*/
    //分页
/*    @Override
    public PageInfo<Map> queryPage(Integer pageNum) {
        PageHelper.startPage(pageNum,3);
        List<Map> list=worksurfacedao.queryPage();
        PageInfo<Map> info=new PageInfo<Map>(list);
        System.out.print(info);
        return info;
    }*/





    /*
     * 办公用品类型
     * */
    //类型--查询
    @Override
    public List<Map<String, Object>> query_sort(String sortStyle) {
        return worksurfacedao.query_sort(sortStyle);
    }
    //类型--删除
    @Override
    public int delete_sort(Sort s) {
        return worksurfacedao.delete_sort(s);
    }
    //类型--增加
    @Override
    public int save_sort(Sort s) {
        return worksurfacedao.save_sort(s);
    }
    //类型--修改
    @Override
    public int update_sort(Sort s) { return worksurfacedao.update_sort(s); }

    /*
     * 办公用品库
     * */
    //办公用品库--查询(类型用)
    @Override
    public List<Map<String,Object>> query_bank() {
        return worksurfacedao.query_bank();
    }
    //办公用品库条件查询
    public List<Map<String,Object>> query_bank1(String bBankname) {
        return worksurfacedao.query_bank1(bBankname);
    }
    //职员--查询(库用)
    @Override
    public List<Map<String, Object>> query_tbPersoninfo() {
        return worksurfacedao.query_tbPersoninfo();
    }
    //办公用品库删除
    @Override
    public int delete_bank(Bank b) {
        System.out.println(b);
        return worksurfacedao.delete_bank(b);
    }
    //办公用品库--修改
    @Override
    public int update_bank(Bank b) { return worksurfacedao.update_bank(b); }
    //办公用品库--增加
    @Override
    public int save_bank(Bank b) {
        return worksurfacedao.save_bank(b);
    }

    /*
     * 申请用品--记录
     * */
    //申请用品--查询
    @Override
    public List<Map<String, Object>> query_apply() {
        return worksurfacedao.query_apply();
    }
    //根据状态查询
    @Override
    public List<Map<String, Object>> query_apply1() {
        return worksurfacedao.query_apply1();
    }

    //申请用品--删除
    @Override
    public int delete_apply(Apply ap) {
        return worksurfacedao.delete_apply(ap);
    }
    //申请用品--增加
    @Override
    public int save_apply(Apply ap) {
        /*worksurfacedao.update_kucun();*/

        return worksurfacedao.save_apply(ap);
    }
    //修改库存
    @Override
    @Transactional
    public int update_kucun(int applyId) {
        Apply apply=new Apply();
        apply.setApplyId(applyId);
        int result=0;
        System.out.println(apply.getApplyId());
        int a=worksurfacedao.updateState(apply);
        System.out.println(a);
        int b=worksurfacedao.update_kucun(apply);
        System.out.println(b);
        if(a>0&&b>0){
          result=1;
        }
        return result;
    }

    //申请记录--修改
    @Override
    public int update_apply(Apply ap) { return worksurfacedao.update_apply(ap); }

    //修改状态
   /* @Override
    public int updateState(Apply ap) {
        return worksurfacedao.updateState(ap);
    }*/

    @Override
    public int updateStat(Apply ap) {
        return worksurfacedao.updateStat(ap);
    }

    /*
    * 分页模糊查询
    * */
    @Override
    public List<Map<String, Object>> pageWorksurface(String name) {
        return worksurfacedao.pageWorksurface(name);
    }




}
