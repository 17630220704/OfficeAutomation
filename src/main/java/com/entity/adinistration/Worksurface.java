package com.entity.adinistration;


public class Worksurface {

  private long workId;
  private Sort sort;
  private Bank bank;
  private long useUserId;
  private String workName;
  private String workSpecification;
  private String workStyle;
  private String workUnit;
  private long workSprice;
  private String workSupplier;
  private String setid;
  private long workRepertory;
  private long workDline;
  private long workGline;
  private String userId;

  @Override
  public String toString() {
    return "Worksurface{" +
            "workId=" + workId +
            ", sort=" + sort +
            ", bank=" + bank +
            ", useUserId=" + useUserId +
            ", workName='" + workName + '\'' +
            ", workSpecification='" + workSpecification + '\'' +
            ", workStyle='" + workStyle + '\'' +
            ", workUnit='" + workUnit + '\'' +
            ", workSprice=" + workSprice +
            ", workSupplier='" + workSupplier + '\'' +
            ", setid='" + setid + '\'' +
            ", workRepertory=" + workRepertory +
            ", workDline=" + workDline +
            ", workGline=" + workGline +
            ", userId='" + userId + '\'' +
            '}';
  }

  public Sort getSort() {
    return sort;
  }

  public void setSort(Sort sort) {
    this.sort = sort;
  }

  public long getWorkId() {
    return workId;
  }

  public void setWorkId(long workId) {
    this.workId = workId;
  }

  public Bank getBank() {
    return bank;
  }

  public void setBank(Bank bank) {
    this.bank = bank;
  }

  public long getUseUserId() {
    return useUserId;
  }

  public void setUseUserId(long useUserId) {
    this.useUserId = useUserId;
  }


  public String getWorkName() {
    return workName;
  }

  public void setWorkName(String workName) {
    this.workName = workName;
  }


  public String getWorkSpecification() {
    return workSpecification;
  }

  public void setWorkSpecification(String workSpecification) {
    this.workSpecification = workSpecification;
  }


  public String getWorkStyle() {
    return workStyle;
  }

  public void setWorkStyle(String workStyle) {
    this.workStyle = workStyle;
  }


  public String getWorkUnit() {
    return workUnit;
  }

  public void setWorkUnit(String workUnit) {
    this.workUnit = workUnit;
  }


  public long getWorkSprice() {
    return workSprice;
  }

  public void setWorkSprice(long workSprice) {
    this.workSprice = workSprice;
  }


  public String getWorkSupplier() {
    return workSupplier;
  }

  public void setWorkSupplier(String workSupplier) {
    this.workSupplier = workSupplier;
  }


  public String getSetid() {
    return setid;
  }

  public void setSetid(String setid) {
    this.setid = setid;
  }


  public long getWorkRepertory() {
    return workRepertory;
  }

  public void setWorkRepertory(long workRepertory) {
    this.workRepertory = workRepertory;
  }


  public long getWorkDline() {
    return workDline;
  }

  public void setWorkDline(long workDline) {
    this.workDline = workDline;
  }


  public long getWorkGline() {
    return workGline;
  }

  public void setWorkGline(long workGline) {
    this.workGline = workGline;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

}
