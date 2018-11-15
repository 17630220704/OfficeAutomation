package com.entity.yyl;


public class TdTransfer {

  private long transferId;
  private long persoId;
  private String transferPerson;
  private String transferDate;
  private String transferEffectiveDate;
  private String transferType;
  private String tranCompanyBefore;
  private String tranDeptBefore;
  private String tranCompanyAfter;
  private String tranDeptAfter;
  private String tranReason;
  private String responsiblePerson;
  private String attachmentName;
  private String remark;
  private String updateTime;


  public long getTransferId() {
    return transferId;
  }

  public void setTransferId(long transferId) {
    this.transferId = transferId;
  }


  public long getPersoId() {
    return persoId;
  }

  public void setPersoId(long persoId) {
    this.persoId = persoId;
  }


  public String getTransferPerson() {
    return transferPerson;
  }

  public void setTransferPerson(String transferPerson) {
    this.transferPerson = transferPerson;
  }


  public String getTransferDate() {
    return transferDate;
  }

  public void setTransferDate(String transferDate) {
    this.transferDate = transferDate;
  }


  public String getTransferEffectiveDate() {
    return transferEffectiveDate;
  }

  public void setTransferEffectiveDate(String transferEffectiveDate) {
    this.transferEffectiveDate = transferEffectiveDate;
  }


  public String getTransferType() {
    return transferType;
  }

  public void setTransferType(String transferType) {
    this.transferType = transferType;
  }


  public String getTranCompanyBefore() {
    return tranCompanyBefore;
  }

  public void setTranCompanyBefore(String tranCompanyBefore) {
    this.tranCompanyBefore = tranCompanyBefore;
  }


  public String getTranDeptBefore() {
    return tranDeptBefore;
  }

  public void setTranDeptBefore(String tranDeptBefore) {
    this.tranDeptBefore = tranDeptBefore;
  }


  public String getTranCompanyAfter() {
    return tranCompanyAfter;
  }

  public void setTranCompanyAfter(String tranCompanyAfter) {
    this.tranCompanyAfter = tranCompanyAfter;
  }


  public String getTranDeptAfter() {
    return tranDeptAfter;
  }

  public void setTranDeptAfter(String tranDeptAfter) {
    this.tranDeptAfter = tranDeptAfter;
  }


  public String getTranReason() {
    return tranReason;
  }

  public void setTranReason(String tranReason) {
    this.tranReason = tranReason;
  }


  public String getResponsiblePerson() {
    return responsiblePerson;
  }

  public void setResponsiblePerson(String responsiblePerson) {
    this.responsiblePerson = responsiblePerson;
  }


  public String getAttachmentName() {
    return attachmentName;
  }

  public void setAttachmentName(String attachmentName) {
    this.attachmentName = attachmentName;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public String getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(String updateTime) {
    this.updateTime = updateTime;
  }

  @Override
  public String toString() {
    return "TdTransfer{" +
            "transferId=" + transferId +
            ", persoId=" + persoId +
            ", transferPerson='" + transferPerson + '\'' +
            ", transferDate='" + transferDate + '\'' +
            ", transferEffectiveDate='" + transferEffectiveDate + '\'' +
            ", transferType='" + transferType + '\'' +
            ", tranCompanyBefore='" + tranCompanyBefore + '\'' +
            ", tranDeptBefore='" + tranDeptBefore + '\'' +
            ", tranCompanyAfter='" + tranCompanyAfter + '\'' +
            ", tranDeptAfter='" + tranDeptAfter + '\'' +
            ", tranReason='" + tranReason + '\'' +
            ", responsiblePerson='" + responsiblePerson + '\'' +
            ", attachmentName='" + attachmentName + '\'' +
            ", remark='" + remark + '\'' +
            ", updateTime='" + updateTime + '\'' +
            '}';
  }
}
