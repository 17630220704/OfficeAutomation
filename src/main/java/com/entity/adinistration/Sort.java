package com.entity.adinistration;


public class Sort {

  private long sortId;
  private Bank bank;
  private String sortNumber;
  private String sortStyle;


  public long getSortId() {
    return sortId;
  }
  public void setSortId(long sortId) {
    this.sortId = sortId;
  }
  public Bank getBank() {
    return bank;
  }
  public void setBank(Bank bank) {
    this.bank = bank;
  }
  public String getSortNumber() {
    return sortNumber;
  }

  public void setSortNumber(String sortNumber) {
    this.sortNumber = sortNumber;
  }


  public String getSortStyle() {
    return sortStyle;
  }

  public void setSortStyle(String sortStyle) {
    this.sortStyle = sortStyle;
  }

  @Override
  public String toString() {
    return "Sort{" +
            "sortId=" + sortId +
            ", bank=" + bank +
            ", sortNumber='" + sortNumber + '\'' +
            ", sortStyle='" + sortStyle + '\'' +
            '}';
  }
}
