package com.entity.lcy;


public class Mailboxinfo2 {

  private long bodyId;
  private long persoId;
  private String toId2;

  @Override
  public String toString() {
    return "Mailboxinfo2{" +
            "bodyId=" + bodyId +
            ", persoId=" + persoId +
            ", toId2='" + toId2 + '\'' +
            ", toidname='" + toidname + '\'' +
            ", subject='" + subject + '\'' +
            ", size='" + size + '\'' +
            ", content='" + content + '\'' +
            ", sendTime='" + sendTime + '\'' +
            ", attachmentId='" + attachmentId + '\'' +
            ", attachmentName='" + attachmentName + '\'' +
            '}';
  }

  public String getToidname() {
    return toidname;
  }

  public void setToidname(String toidname) {
    this.toidname = toidname;
  }

  private String toidname;
  private String subject;
  private String size;
  private String content;

    private String sendTime;
  private String attachmentId;
  private String attachmentName;


  public long getBodyId() {
    return bodyId;
  }

  public void setBodyId(long bodyId) {
    this.bodyId = bodyId;
  }


  public long getPersoId() {
    return persoId;
  }

  public void setPersoId(long persoId) {
    this.persoId = persoId;
  }


  public String getToId2() {
    return toId2;
  }

  public void setToId2(String toId2) {
    this.toId2 = toId2;
  }


  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }


  public String getSize() {
    return size;
  }

  public void setSize(String size) {
    this.size = size;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    public String getAttachmentId() {
    return attachmentId;
  }

  public void setAttachmentId(String attachmentId) {
    this.attachmentId = attachmentId;
  }


  public String getAttachmentName() {
    return attachmentName;
  }

  public void setAttachmentName(String attachmentName) {
    this.attachmentName = attachmentName;
  }

}
