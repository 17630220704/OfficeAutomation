package com.entity.test;

import java.util.List;

public class tb_Goods_Type {
	private int typeId;
	private String typeName;
	private List<tb_Goods> tb_Goods;
	
	public List<tb_Goods> getTb_Goods() {
		return tb_Goods;
	}
	public void setTb_Goods(List<tb_Goods> tb_Goods) {
		this.tb_Goods = tb_Goods;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public tb_Goods_Type(int typeId, String typeName) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
	}
	public tb_Goods_Type() {
		super();
	}

	public tb_Goods_Type(int typeId, String typeName, List<com.entity.test.tb_Goods> tb_Goods) {
		this.typeId = typeId;
		this.typeName = typeName;
		this.tb_Goods = tb_Goods;
	}

	@Override
	public String toString() {
		return "tb_Goods_Type [typeId=" + typeId + ", typeName=" + typeName + ", tb_Goods=" + tb_Goods + "]";
	}
	
}
