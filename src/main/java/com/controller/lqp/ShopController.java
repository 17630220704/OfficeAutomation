package com.controller.lqp;


import com.entity.lqp.Shop;
import com.services.lqp.ShopserviceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/a1")
public class ShopController {

	@Autowired
	private ShopserviceDao service;

		@ResponseBody
		@RequestMapping(value="/select")
	public Map<String,Object> select(Shop shop){
		Map<String,Object> map = new HashMap<String,Object>();
		List<Shop> list = service.findall();
		map.put("list", list);
		return map;
	}
		@ResponseBody
		@RequestMapping(value="/insert")
		public Map<String, Object>insert(Shop shop){
			Map<String, Object> map = new HashMap<String, Object>();
			int a = service.insert(shop);
			System.out.println("Ӱ������"+a);
			map.put("a", a);
			return map;
		}
		
		@ResponseBody
		@RequestMapping(value="/select1")
		public Map<String,Object> select1(){
			Map<String,Object> map = new HashMap<String, Object>();
			List<Shop> list = service.findall1();
			map.put("list", list);
			return map;
		}
		@ResponseBody
		@RequestMapping(value="/select2")
	public List<Map<String,Object>> select2(){
		Map<String,Object> map = new HashMap<String,Object>();
		List<Map<String,Object>> list =service.findbyname();
		
		return list;
	}
		@ResponseBody
		@RequestMapping(value="/insert1",method= RequestMethod.POST)
		public Map<String,Object> insert1(Shop shop){
			Map<String, Object> map = new HashMap<String, Object>();
			int a = service.insert1(shop);

			System.out.println(map);
			map.put("a", a);
			return map;
		}
	
		@ResponseBody
		@RequestMapping(value="/delete1")
		public Map<String,Object> delete1(Shop shop){
			Map<String,Object> map = new HashMap<String, Object>();
			int delete = service.delete1(shop);
			map.put("delete", delete);
			return map;
		}
		@ResponseBody
		@RequestMapping(value="/update1")
		public Map<String,Object> update1(Shop shop){
			Map<String,Object> map = new HashMap<String, Object>();
			int update = service.update1(shop);
			map.put("update", update);
			return map;
		}
}
