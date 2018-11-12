package com.entity.yyl;


public class TpPayment {

  private long paymentId;
  private String paymentName;
  private String paymentType;
  private long paymentState;


  public long getPaymentId() {
    return paymentId;
  }

  public void setPaymentId(long paymentId) {
    this.paymentId = paymentId;
  }


  public String getPaymentName() {
    return paymentName;
  }

  public void setPaymentName(String paymentName) {
    this.paymentName = paymentName;
  }


  public String getPaymentType() {
    return paymentType;
  }

  public void setPaymentType(String paymentType) {
    this.paymentType = paymentType;
  }


  public long getPaymentState() {
    return paymentState;
  }

  public void setPaymentState(long paymentState) {
    this.paymentState = paymentState;
  }

}
