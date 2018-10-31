package com.controller.permit;

public class aaa {
    public static void main(String[] args) {
        String str = "1,2,3,4,5,6";
        String str1 = "";
        String [] arr = str.split(",");
        for(int i=0;i<arr.length;i++){
            System.out.println(arr[i]);
            str1+=arr[i];
        }

        System.out.println(str1);
    }
}
