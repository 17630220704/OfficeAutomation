package com.entity.lqp;

public class Shop {

	private int shopno;
	private String shopname;
	private int shopprice;
	private Tyshop tyshop;
	
	public Tyshop getTyshop() {
		return tyshop;
	}
	public void setTyshop(Tyshop tyshop) {
		this.tyshop = tyshop;
	}
	public int getShopno() {
		return shopno;
	}
	public void setShopno(int shopno) {
		this.shopno = shopno;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public int getShopprice() {
		return shopprice;
	}
	public void setShopprice(int shopprice) {
		this.shopprice = shopprice;
	}
	
	@Override
	public String toString() {
		return "Shop [shopno=" + shopno + ", shopname=" + shopname + ", shopprice=" + shopprice + ", tyshop=" + tyshop
				+ "]";
	}
	
	public Shop(int shopno, String shopname, int shopprice, Tyshop tyshop) {
		super();
		this.shopno = shopno;
		this.shopname = shopname;
		this.shopprice = shopprice;
		this.tyshop = tyshop;
	}
	public Shop() {
		super();
	}
	
	
}
