package com.entity.lqp;

import lombok.Getter;
import lombok.Setter;

/*@Setter
@Getter*/
@Setter
@Getter
public class QueryObject {
    private int currentPage = 1;
    private int pageSize = 5;
    private int StartIndex;

   /* public int getStartIndex(){
        return pageSize * (currentPage - 1);
    }
}*/
public int getStartIndex(){
    return  pageSize*(currentPage-1);

}}