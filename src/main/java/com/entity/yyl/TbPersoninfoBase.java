package com.entity.yyl;


public class TbPersoninfoBase {

  private long persbaseId;
  private long persoId;
  private double perSalary;
  private double yanglaoPerson;
  private double yanglaoUnits;
  private double yiliaoPerson;
  private double yiliaoUnits;
  private double shiyePerson;
  private double shiyeUnits;
  private double zhufangPerson;
  private double zhufangUnits;
  private double gongshangUnits;
  private double shengyuUnits;
  private double riskBack;


  public long getPersbaseId() {
    return persbaseId;
  }

  public void setPersbaseId(long persbaseId) {
    this.persbaseId = persbaseId;
  }


  public long getPersoId() {
    return persoId;
  }

  public void setPersoId(long persoId) {
    this.persoId = persoId;
  }


  public double getPerSalary() {
    return perSalary;
  }

  public void setPerSalary(double perSalary) {
    this.perSalary = perSalary;
  }


  public double getYanglaoPerson() {
    return yanglaoPerson;
  }

  public void setYanglaoPerson(double yanglaoPerson) {
    this.yanglaoPerson = yanglaoPerson;
  }


  public double getYanglaoUnits() {
    return yanglaoUnits;
  }

  public void setYanglaoUnits(double yanglaoUnits) {
    this.yanglaoUnits = yanglaoUnits;
  }


  public double getYiliaoPerson() {
    return yiliaoPerson;
  }

  public void setYiliaoPerson(double yiliaoPerson) {
    this.yiliaoPerson = yiliaoPerson;
  }


  public double getYiliaoUnits() {
    return yiliaoUnits;
  }

  public void setYiliaoUnits(double yiliaoUnits) {
    this.yiliaoUnits = yiliaoUnits;
  }


  public double getShiyePerson() {
    return shiyePerson;
  }

  public void setShiyePerson(double shiyePerson) {
    this.shiyePerson = shiyePerson;
  }


  public double getShiyeUnits() {
    return shiyeUnits;
  }

  public void setShiyeUnits(double shiyeUnits) {
    this.shiyeUnits = shiyeUnits;
  }


  public double getZhufangPerson() {
    return zhufangPerson;
  }

  public void setZhufangPerson(double zhufangPerson) {
    this.zhufangPerson = zhufangPerson;
  }


  public double getZhufangUnits() {
    return zhufangUnits;
  }

  public void setZhufangUnits(double zhufangUnits) {
    this.zhufangUnits = zhufangUnits;
  }


  public double getGongshangUnits() {
    return gongshangUnits;
  }

  public void setGongshangUnits(double gongshangUnits) {
    this.gongshangUnits = gongshangUnits;
  }


  public double getShengyuUnits() {
    return shengyuUnits;
  }

  public void setShengyuUnits(double shengyuUnits) {
    this.shengyuUnits = shengyuUnits;
  }


  public double getRiskBack() {
    return riskBack;
  }

  public void setRiskBack(double riskBack) {
    this.riskBack = riskBack;
  }

    @Override
    public String toString() {
        return "TbPersoninfoBase{" +
                "persbaseId=" + persbaseId +
                ", persoId=" + persoId +
                ", perSalary=" + perSalary +
                ", yanglaoPerson=" + yanglaoPerson +
                ", yanglaoUnits=" + yanglaoUnits +
                ", yiliaoPerson=" + yiliaoPerson +
                ", yiliaoUnits=" + yiliaoUnits +
                ", shiyePerson=" + shiyePerson +
                ", shiyeUnits=" + shiyeUnits +
                ", zhufangPerson=" + zhufangPerson +
                ", zhufangUnits=" + zhufangUnits +
                ", gongshangUnits=" + gongshangUnits +
                ", shengyuUnits=" + shengyuUnits +
                ", riskBack=" + riskBack +
                '}';
    }
}
