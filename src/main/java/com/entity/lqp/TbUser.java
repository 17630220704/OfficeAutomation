package com.entity.lqp;


public class TbUser {

  private long uId;
  private long rId;
  private long deptId;
  private long persoId;
  private String uLoginName;
  private String uLoginPassword;
  private long uOnline;
  private long uLocking;
  private java.sql.Timestamp uDeadline;


  public long getUId() {
    return uId;
  }

  public void setUId(long uId) {
    this.uId = uId;
  }


  public long getRId() {
    return rId;
  }

  public void setRId(long rId) {
    this.rId = rId;
  }


  public long getDeptId() {
    return deptId;
  }

  public void setDeptId(long deptId) {
    this.deptId = deptId;
  }


  public long getPersoId() {
    return persoId;
  }

  public void setPersoId(long persoId) {
    this.persoId = persoId;
  }


  public String getULoginName() {
    return uLoginName;
  }

  public void setULoginName(String uLoginName) {
    this.uLoginName = uLoginName;
  }


  public String getULoginPassword() {
    return uLoginPassword;
  }

  public void setULoginPassword(String uLoginPassword) {
    this.uLoginPassword = uLoginPassword;
  }


  public long getUOnline() {
    return uOnline;
  }

  public void setUOnline(long uOnline) {
    this.uOnline = uOnline;
  }


  public long getULocking() {
    return uLocking;
  }

  public void setULocking(long uLocking) {
    this.uLocking = uLocking;
  }


  public java.sql.Timestamp getUDeadline() {
    return uDeadline;
  }

  public void setUDeadline(java.sql.Timestamp uDeadline) {
    this.uDeadline = uDeadline;
  }

}
