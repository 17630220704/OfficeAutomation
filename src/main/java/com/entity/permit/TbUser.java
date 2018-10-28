package com.entity.permit;


import java.sql.Timestamp;

public class TbUser {

  private long uId;
  private long deptId;
  private long persoId;
  private String userName;
  private String uLoginName;
  private String uLoginPassword;
  private long uOnline;
  private long uLocking;
  private java.sql.Timestamp uDeadline;


  public long getuId() {
    return uId;
  }

  public void setuId(long uId) {
    this.uId = uId;
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

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getuLoginName() {
    return uLoginName;
  }

  public void setuLoginName(String uLoginName) {
    this.uLoginName = uLoginName;
  }

  public String getuLoginPassword() {
    return uLoginPassword;
  }

  public void setuLoginPassword(String uLoginPassword) {
    this.uLoginPassword = uLoginPassword;
  }

  public long getuOnline() {
    return uOnline;
  }

  public void setuOnline(long uOnline) {
    this.uOnline = uOnline;
  }

  public long getuLocking() {
    return uLocking;
  }

  public void setuLocking(long uLocking) {
    this.uLocking = uLocking;
  }

  public Timestamp getuDeadline() {
    return uDeadline;
  }

  public void setuDeadline(Timestamp uDeadline) {
    this.uDeadline = uDeadline;
  }
}
