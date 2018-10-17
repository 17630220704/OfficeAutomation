package com.dao.test;

import com.entity.test.tb_Goods;

import java.util.List;


public interface GoodsDao {
	public List<tb_Goods> gAll();
	public int saveGoods(tb_Goods goods);
}
