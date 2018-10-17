package com.controller.test;

import com.entity.test.tb_Goods;
import com.entity.test.tb_Goods_Type;
import com.services.test.GoodsServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



@Controller
public class Goods_TypeController {
	
	@Resource(name="goodsServicesImp")
	private GoodsServices gtdao;
	
	@ResponseBody
	@RequestMapping(value="gtAll.do")
	public Map<String,Object> Goods_TyepAll(){
		Map<String,Object> map = new HashMap<String,Object>();
		List<tb_Goods_Type> list = gtdao.gtAll();
		map.put("gtlist", list);
		System.out.println(" 输出map:  "+map);
		return map;
	};
	@ResponseBody
	@RequestMapping(value="gAll.do")
	public Map<String,Object> GoodsAll(){
		Map<String,Object> map = new HashMap<String,Object>();
		List<tb_Goods> list = gtdao.gAll();
		map.put("glist", list);
		return map;
	};
	@ResponseBody
	@RequestMapping(value="saveGoods.do")
	public Map<String,Object> saveGoods(tb_Goods goods){
		Map<String,Object> map = new HashMap<String,Object>();
		int result= gtdao.saveGoods(goods);
		if(result>0){
			map.put("result", "添加成功");
		}else {
			map.put("result", "添加失败");
		}
		return map;
	};
	
	/*Get&Set*/
	public GoodsServices getGtdao() {
		return gtdao;
	}
	public void setGtdao(GoodsServices gtdao) {
		this.gtdao = gtdao;
	}
	
}
