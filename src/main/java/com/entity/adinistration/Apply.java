package com.entity.adinistration;


import com.entity.adinistration.Bank;
import com.entity.adinistration.Sort;
import com.entity.adinistration.Worksurface;

public class Apply {

  private long applyId;
  private Bank bank;
  private Sort sort;
  private Worksurface worksurface;
  private String applyStyle;
  private double applyPrice;
  private long applyNumber;
  private String applyComment;
  private long applyState;
  private String userid;
  private String applyPeople;
  private String applyTime;



  public long getApplyId() {
    return applyId;
  }

  public void setApplyId(long applyId) {
    this.applyId = applyId;
  }


  public Bank getBank() {
    return bank;
  }

  public void setBank(Bank bank) {
    this.bank = bank;
  }

  public Sort getSort() {
    return sort;
  }

  public void setSort(Sort sort) {
    this.sort = sort;
  }

  public Worksurface getWorksurface() {
    return worksurface;
  }

  public void setWorksurface(Worksurface worksurface) {
    this.worksurface = worksurface;
  }

  public String getApplyStyle() {
    return applyStyle;
  }

  public void setApplyStyle(String applyStyle) {
    this.applyStyle = applyStyle;
  }


  public double getApplyPrice() {
    return applyPrice;
  }

  public void setApplyPrice(double applyPrice) {
    this.applyPrice = applyPrice;
  }


  public long getApplyNumber() {
    return applyNumber;
  }

  public void setApplyNumber(long applyNumber) {
    this.applyNumber = applyNumber;
  }


  public String getApplyComment() {
    return applyComment;
  }

  public void setApplyComment(String applyComment) {
    this.applyComment = applyComment;
  }


  public long getApplyState() {
    return applyState;
  }

  public void setApplyState(long applyState) {
    this.applyState = applyState;
  }


  public String getUserid() {
    return userid;
  }

  public void setUserid(String userid) {
    this.userid = userid;
  }


  public String getApplyPeople() {
    return applyPeople;
  }

  public void setApplyPeople(String applyPeople) {
    this.applyPeople = applyPeople;
  }


  public String getApplyTime() {
    return applyTime;
  }

  public void setApplyTime(String applyTime) {
    this.applyTime = applyTime;
  }

  @Override
  public String toString() {
    return "Apply{" +
            "applyId=" + applyId +
            ", bank=" + bank +
            ", sort=" + sort +
            ", worksurface=" + worksurface +
            ", applyStyle='" + applyStyle + '\'' +
            ", applyPrice=" + applyPrice +
            ", applyNumber=" + applyNumber +
            ", applyComment='" + applyComment + '\'' +
            ", applyState=" + applyState +
            ", userid='" + userid + '\'' +
            ", applyPeople='" + applyPeople + '\'' +
            ", applyTime='" + applyTime + '\'' +
            '}';
  }
}
