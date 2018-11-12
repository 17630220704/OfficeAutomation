package com.entity.yyl;


public class TdStaff {

  private long contractId;
  private long persoId;
  private String staffContractNo;
  private String conTractType;
  private String makeContract;
  private String probationEffectiveDate;
  private String activePeriod;
  private String contractEndTime;
  private String remark;
  private String addTime;
  private String lastUpdateTime;
  private String remindUser;
  private long renewTime;
  private String contractEnterpries;
  private String adjunct;


  public long getContractId() {
    return contractId;
  }

  public void setContractId(long contractId) {
    this.contractId = contractId;
  }


  public long getPersoId() {
    return persoId;
  }

  public void setPersoId(long persoId) {
    this.persoId = persoId;
  }


  public String getStaffContractNo() {
    return staffContractNo;
  }

  public void setStaffContractNo(String staffContractNo) {
    this.staffContractNo = staffContractNo;
  }


  public String getConTractType() {
    return conTractType;
  }

  public void setConTractType(String conTractType) {
    this.conTractType = conTractType;
  }


  public String getMakeContract() {
    return makeContract;
  }

  public void setMakeContract(String makeContract) {
    this.makeContract = makeContract;
  }


  public String getProbationEffectiveDate() {
    return probationEffectiveDate;
  }

  public void setProbationEffectiveDate(String probationEffectiveDate) {
    this.probationEffectiveDate = probationEffectiveDate;
  }


  public String getActivePeriod() {
    return activePeriod;
  }

  public void setActivePeriod(String activePeriod) {
    this.activePeriod = activePeriod;
  }


  public String getContractEndTime() {
    return contractEndTime;
  }

  public void setContractEndTime(String contractEndTime) {
    this.contractEndTime = contractEndTime;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public String getAddTime() {
    return addTime;
  }

  public void setAddTime(String addTime) {
    this.addTime = addTime;
  }


  public String getLastUpdateTime() {
    return lastUpdateTime;
  }

  public void setLastUpdateTime(String lastUpdateTime) {
    this.lastUpdateTime = lastUpdateTime;
  }


  public String getRemindUser() {
    return remindUser;
  }

  public void setRemindUser(String remindUser) {
    this.remindUser = remindUser;
  }


  public long getRenewTime() {
    return renewTime;
  }

  public void setRenewTime(long renewTime) {
    this.renewTime = renewTime;
  }


  public String getContractEnterpries() {
    return contractEnterpries;
  }

  public void setContractEnterpries(String contractEnterpries) {
    this.contractEnterpries = contractEnterpries;
  }


  public String getAdjunct() {
    return adjunct;
  }

  public void setAdjunct(String adjunct) {
    this.adjunct = adjunct;
  }

    @Override
    public String toString() {
        return "TdStaff{" +
                "contractId=" + contractId +
                ", persoId=" + persoId +
                ", staffContractNo='" + staffContractNo + '\'' +
                ", conTractType='" + conTractType + '\'' +
                ", makeContract='" + makeContract + '\'' +
                ", probationEffectiveDate='" + probationEffectiveDate + '\'' +
                ", activePeriod='" + activePeriod + '\'' +
                ", contractEndTime='" + contractEndTime + '\'' +
                ", remark='" + remark + '\'' +
                ", addTime='" + addTime + '\'' +
                ", lastUpdateTime='" + lastUpdateTime + '\'' +
                ", remindUser='" + remindUser + '\'' +
                ", renewTime=" + renewTime +
                ", contractEnterpries='" + contractEnterpries + '\'' +
                ", adjunct='" + adjunct + '\'' +
                '}';
    }

}
