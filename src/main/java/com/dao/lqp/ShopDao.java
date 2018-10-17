package com.dao.lqp;


import com.entity.lqp.Shop;

import java.util.List;
import java.util.Map;

public interface ShopDao {

	
public List<Shop> findall();
public int insert(Shop shop);
public int delete(Shop shop);
public int update(Shop shop);

public List<Shop> findall1();
public List<Map<String,Object>> findbyname();
public int insert1(Shop shop);
public int delete1(Shop shop);
public int update1(Shop shop);
}
