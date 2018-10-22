package com.entity.permit;


public class TbUser {

  private long uId;
  private long dId;
  private String userName;
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


  public long getDId() {
    return dId;
  }

  public void setDId(long dId) {
    this.dId = dId;
  }


  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
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

  @Override
  public String toString() {
    return "TbUser{" +
            "uId=" + uId +
            ", dId=" + dId +
            ", userName='" + userName + '\'' +
            ", uLoginName='" + uLoginName + '\'' +
            ", uLoginPassword='" + uLoginPassword + '\'' +
            ", uOnline=" + uOnline +
            ", uLocking=" + uLocking +
            ", uDeadline=" + uDeadline +
            '}';
  }
}
