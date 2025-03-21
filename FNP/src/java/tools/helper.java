/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author ducmi
 */
public class helper {
    public static String formatNumber(long number) {
        NumberFormat numberFormat = NumberFormat.getInstance(Locale.ITALY);
        return numberFormat.format(number);
    }
    public static String cutString(String str, int size) {
        if (str.length() > size) {
            str = str.substring(0, size);
            str += "...";
        }
        return str;
    }
}
