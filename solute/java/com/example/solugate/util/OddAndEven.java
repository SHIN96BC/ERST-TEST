package com.example.solugate.util;

import static com.example.solugate.constant.CompanyConstant.*;

public class OddAndEven {

    public int checkOddAndEven(String numberStr) {
        try {
            long number = Long.parseLong(numberStr);
            if(number % 2 == 0) {
                return EVEN;
            }else{
                return ODD;
            }
        }catch(NumberFormatException nfe) {
            return ERROR;
        }
    }

    public int checkOddAndEven(int number) {
        if(number % 2 == 0) {
            return EVEN;
        }else{
            return ODD;
        }
    }

    public int checkOddAndEven(long number) {
        if(number % 2 == 0) {
            return EVEN;
        }else{
            return ODD;
        }
    }
}
