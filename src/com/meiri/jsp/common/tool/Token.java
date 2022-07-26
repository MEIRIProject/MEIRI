package com.meiri.jsp.common.tool;

public class Token {

   public static String random(int size) {
        StringBuilder sb = new StringBuilder();

        String tokenArray[] = {
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
                "U", "V", "W", "X", "Y", "Z",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
        };

        for (int i = 0; i < size; i++) {
            int idx = (int) (Math.random() * tokenArray.length);
            sb.append(tokenArray[idx]);
        }
        return sb.toString();
    }

}