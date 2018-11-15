package com.entity.adinistration;


public class Bank {

  private long bId;
  private TbPersoninfo tbPersoninfo;
  private String bBankname;
  private String deptid;
  private String useridone;


  public long getBId() {
    return bId;
  }

  public void setBId(long bId) {
    this.bId = bId;
  }

  public TbPersoninfo getTbPersoninfo() {
    return tbPersoninfo;
  }

  public void setTbPersoninfo(TbPersoninfo tbPersoninfo) {
    this.tbPersoninfo = tbPersoninfo;
  }

  public String getBBankname() {
    return bBankname;
  }

  public void setBBankname(String bBankname) {
    this.bBankname = bBankname;
  }


  public String getDeptid() {
    return deptid;
  }

  public void setDeptid(String deptid) {
    this.deptid = deptid;
  }


  public String getUseridone() {
    return useridone;
  }

  public void setUseridone(String useridone) {
    this.useridone = useridone;
  }

  @Override
  public String toString() {
    return "Bank{" +
            "bId=" + bId +
            ", tbPersoninfo=" + tbPersoninfo +
            ", bBankname='" + bBankname + '\'' +
            ", deptid='" + deptid + '\'' +
            ", useridone='" + useridone + '\'' +
            '}';
  }
}
