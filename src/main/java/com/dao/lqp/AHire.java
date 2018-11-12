package com.dao.lqp;

import com.entity.lqp.TbHirefile;

import java.util.List;
import java.util.Map;

public interface AHire {
    public List<Map> findhireall(TbHirefile tbHirefile);
    public int inserthire(TbHirefile tbHirefile);//增加数据
    public int deletehire(TbHirefile tbHirefile);//删除数据
    public int updatehire(TbHirefile tbHirefile);//更新数据
}
