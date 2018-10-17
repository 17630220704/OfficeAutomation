package com.entity.lqp;


public class Tyshop {
    private int tyshopno;
    private String tyshopname;
	public int getTyshopno() {
		return tyshopno;
	}
	public void setTyshopno(int tyshopno) {
		this.tyshopno = tyshopno;
	}
	public String getTyshopname() {
		return tyshopname;
	}
	public void setTyshopname(String tyshopname) {
		this.tyshopname = tyshopname;
	}
	@Override
	public String toString() {
		return "Tyshop [tyshopno=" + tyshopno + ", tyshopname=" + tyshopname + "]";
	}
	public Tyshop(int tyshopno, String tyshopname) {
		super();
		this.tyshopno = tyshopno;
		this.tyshopname = tyshopname;
	}
	public Tyshop() {
		super();
	}
	
    
}
