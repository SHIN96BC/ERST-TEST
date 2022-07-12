package com.example.solugate.util;

public class CastUtil {
    public int changeStringToInt(String numberStr) {
        try{
            int number = Integer.parseInt(numberStr);
            return number;
        }catch (NumberFormatException nfe){
            return -1;
        }
    }

    public long changeStringToLong(String numberStr) {
        try{
            long number = Long.parseLong(numberStr);
            return number;
        }catch (NumberFormatException nfe){
            return -1;
        }
    }
}
