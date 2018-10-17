package com.services.lqp;
import com.dao.lqp.ShopDao;
import com.entity.lqp.Shop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ShopServiceDaoImp implements ShopserviceDao {
	@Autowired
	private ShopDao dao;


	@Override
	public List<Shop> findall() {
		// TODO Auto-generated method stub
		return dao.findall();
	}

	@Override
	public int insert(Shop shop) {
		// TODO Auto-generated method stub
		return dao.insert(shop);
	}

	@Override
	public int delete(Shop shop) {
		// TODO Auto-generated method stub
		return dao.delete(shop);
	}

	@Override
	public int update(Shop shop) {
		// TODO Auto-generated method stub
		return dao.update(shop);
	}



	@Override
	public int insert1(Shop shop) {
		// TODO Auto-generated method stub
		return dao.insert1(shop);
	}

	@Override
	public int delete1(Shop shop) {
		// TODO Auto-generated method stub
		return dao.delete1(shop);
	}

	@Override
	public int update1(Shop shop) {
		// TODO Auto-generated method stub
		return dao.update1(shop);
	}

	@Override
	public List<Shop> findall1() {
		// TODO Auto-generated method stub
		List<Shop> list = dao.findall1();
		return list;
			
	}

	@Override
	public List<Map<String, Object>> findbyname() {
		// TODO Auto-generated method stub
		return dao.findbyname();
	}

}
