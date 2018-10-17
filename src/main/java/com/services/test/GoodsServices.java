package com.services.test;

import com.entity.test.tb_Goods;
import com.entity.test.tb_Goods_Type;

import java.util.List;



public interface GoodsServices {
	public List<tb_Goods_Type> gtAll();
	public List<tb_Goods> gAll();
	public int saveGoods(tb_Goods goods);
}
