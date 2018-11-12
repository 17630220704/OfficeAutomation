package com.entity.lqp;

import com.alibaba.druid.util.StringUtils;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class EmployeeQueryObject extends QueryObject {
    private String planName;
    private Long planId = -1L;


  /*  public String getKeyword(){
        return StringUtils.isEmpty(keyword)?null : keyword;
    }
}*/
public String getPlanName(){return StringUtils.isEmpty(planName)?null:planName;}}
