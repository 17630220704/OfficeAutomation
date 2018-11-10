package com.factory.permit;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class treefactory {
    public List<Map<String,Object>> menuCommon;
    public List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    public List<Map<String,Object>> deptList(List<Map<String,Object>> menu){
        this.menuCommon = menu;
        for (Map<String,Object> x : menu) {
            Map<String,Object> mapArr = new LinkedHashMap<String, Object>();
            if((Integer) x.get("mlevel")==0){
                mapArr.put("id",x.get("mid"));
                mapArr.put("name", x.get("mname"));
                mapArr.put("parentId",x.get("mlevel"));
                mapArr.put("checked",x.get("checked"));
                mapArr.put("value",x.get("mid"));
                mapArr.put("list", deptChild((Integer)x.get("mid")));
                list.add(mapArr);
            }
        }
        return list;
    }

    public List<Map<String,Object>> deptChild(Integer id){
        List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
        for(Map<String,Object> a:menuCommon){
            Map<String,Object> childArray = new LinkedHashMap<String, Object>();
            if(a.get("mlevel")==id){
                childArray.put("id", a.get("mid"));
                childArray.put("name", a.get("mname"));
                childArray.put("parentId", a.get("mlevel"));
                childArray.put("checked",a.get("checked"));
                childArray.put("value", a.get("mid"));
                childArray.put("list", deptChild((Integer) a.get("mid")));
                lists.add(childArray);
            }
        }
        return lists;
    }
}
