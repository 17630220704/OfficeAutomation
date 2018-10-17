package com.entity.test;

import java.sql.Date;

public class tb_Goods {
	private int goodsId;
	private String goodsName;
	private tb_Goods_Type typeId;
	private String goodsDesc;
	private int goodsUnitPrice;
	private String goodsImageName;
	private int sellCount;
	private Date goodsDate;
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public tb_Goods_Type getTypeId() {
		return typeId;
	}
	public void setTypeId(tb_Goods_Type typeId) {
		this.typeId = typeId;
	}
	public String getGoodsDesc() {
		return goodsDesc;
	}
	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}
	public int getGoodsUnitPrice() {
		return goodsUnitPrice;
	}
	public void setGoodsUnitPrice(int goodsUnitPrice) {
		this.goodsUnitPrice = goodsUnitPrice;
	}
	public String getGoodsImageName() {
		return goodsImageName;
	}
	public void setGoodsImageName(String goodsImageName) {
		this.goodsImageName = goodsImageName;
	}
	public int getSellCount() {
		return sellCount;
	}
	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}
	public Date getGoodsDate() {
		return goodsDate;
	}
	public void setGoodsDate(Date goodsDate) {
		this.goodsDate = goodsDate;
	}
	public tb_Goods(int goodsId, String goodsName, tb_Goods_Type typeId, String goodsDesc, int goodsUnitPrice,
			String goodsImageName, int sellCount, Date goodsDate) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.typeId = typeId;
		this.goodsDesc = goodsDesc;
		this.goodsUnitPrice = goodsUnitPrice;
		this.goodsImageName = goodsImageName;
		this.sellCount = sellCount;
		this.goodsDate = goodsDate;
	}
	
	public tb_Goods(int goodsId, String goodsName, String goodsDesc, int goodsUnitPrice, String goodsImageName,
			int sellCount, Date goodsDate) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.goodsDesc = goodsDesc;
		this.goodsUnitPrice = goodsUnitPrice;
		this.goodsImageName = goodsImageName;
		this.sellCount = sellCount;
		this.goodsDate = goodsDate;
	}
	public tb_Goods() {
		super();
	}
	@Override
	public String toString() {
		return "tb_Goods [goodsId=" + goodsId + ", goodsName=" + goodsName + ", typeId=" + typeId + ", goodsDesc="
				+ goodsDesc + ", goodsUnitPrice=" + goodsUnitPrice + ", goodsImageName=" + goodsImageName
				+ ", sellCount=" + sellCount + ", goodsDate=" + goodsDate + "]";
	}
	
	
}
