package com.entity.lcy;


public class Mailboxinfo {

  private long emailBoxid;
  private String emailType;


  public long getEmailBoxid() {
    return emailBoxid;
  }

  public void setEmailBoxid(long emailBoxid) {
    this.emailBoxid = emailBoxid;
  }


  public String getEmailType() {
    return emailType;
  }

  public void setEmailType(String emailType) {
    this.emailType = emailType;
  }

  @Override
  public String toString() {
    return "Mailboxinfo{" +
            "emailBoxid=" + emailBoxid +
            ", emailType='" + emailType + '\'' +
            '}';
  }
}
