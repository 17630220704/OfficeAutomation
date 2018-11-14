package com.entity.lcy;


public class Email {

  private long emailId;
  private long emailBoxid;
  private long bodyId;
  private long posiId;
  private long readFlag;
  private long deleteFlag;
  private long receipt;

  @Override
  public String toString() {
    return "Email{" +
            "emailId=" + emailId +
            ", emailBoxid=" + emailBoxid +
            ", bodyId=" + bodyId +
            ", posiId=" + posiId +
            ", readFlag=" + readFlag +
            ", deleteFlag=" + deleteFlag +
            ", receipt=" + receipt +
            ", isF=" + isF +
            ", isR=" + isR +
            ", sign=" + sign +
            ", m2=" + m2 +
            '}';
  }

  private long isF;
  private long isR;
  private long sign;
  private Mailboxinfo2 m2;

  public Mailboxinfo2 getM2() {
    return m2;
  }

  public void setM2(Mailboxinfo2 m2) {
    this.m2 = m2;
  }

  public long getEmailId() {
    return emailId;
  }

  public void setEmailId(long emailId) {
    this.emailId = emailId;
  }


  public long getEmailBoxid() {
    return emailBoxid;
  }

  public void setEmailBoxid(long emailBoxid) {
    this.emailBoxid = emailBoxid;
  }


  public long getBodyId() {
    return bodyId;
  }

  public void setBodyId(long bodyId) {
    this.bodyId = bodyId;
  }


  public long getPosiId() {
    return posiId;
  }

  public void setPosiId(long posiId) {
    this.posiId = posiId;
  }


  public long getReadFlag() {
    return readFlag;
  }

  public void setReadFlag(long readFlag) {
    this.readFlag = readFlag;
  }


  public long getDeleteFlag() {
    return deleteFlag;
  }

  public void setDeleteFlag(long deleteFlag) {
    this.deleteFlag = deleteFlag;
  }


  public long getReceipt() {
    return receipt;
  }

  public void setReceipt(long receipt) {
    this.receipt = receipt;
  }


  public long getIsF() {
    return isF;
  }

  public void setIsF(long isF) {
    this.isF = isF;
  }


  public long getIsR() {
    return isR;
  }

  public void setIsR(long isR) {
    this.isR = isR;
  }


  public long getSign() {
    return sign;
  }

  public void setSign(long sign) {
    this.sign = sign;
  }

}
