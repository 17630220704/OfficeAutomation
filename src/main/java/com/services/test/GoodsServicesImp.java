package com.services.test;

import com.dao.test.GoodsDao;
import com.dao.test.Goods_TypeDao;
import com.entity.test.tb_Goods;
import com.entity.test.tb_Goods_Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("goodsServicesImp")
public class GoodsServicesImp implements GoodsServices {

	@Autowired
	private Goods_TypeDao gtdao;
	
	@Autowired
	private GoodsDao gdao;
	
	@Override
	public List<tb_Goods_Type> gtAll() {
		return gtdao.gtAll();
	}

	@Override
	public List<tb_Goods> gAll() {
		return gdao.gAll();
	}

	@Override
	public int saveGoods(tb_Goods goods) {
		int result = gdao.saveGoods(goods);
		return result;
	}
	/*Get&Set*/

	public Goods_TypeDao getGtdao() {
		return gtdao;
	}
	public GoodsDao getGdao() {
		return gdao;
	}
	public void setGtdao(Goods_TypeDao gtdao) {
		this.gtdao = gtdao;
	}
	public void setGdao(GoodsDao gdao) {
		this.gdao = gdao;
	}
}
