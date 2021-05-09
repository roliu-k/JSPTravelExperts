package com.example.JSPTravelExperts;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class bookingNo {
    public static String generateBookingNo()
    {
        final String source = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        final int N = source.length();
        Random rnd = new Random();
        //Each character is randomly picked from the source.
        String letterOne = Character.toString(source.charAt(rnd.nextInt(N)));
        String letteTwo = Character.toString(source.charAt(rnd.nextInt(N)));
        String letterThree = Character.toString(source.charAt(rnd.nextInt(N)));

        //Put today's date in a string, then extract each element.
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date date = new Date();
        String dateString = dateFormat.format(date);
        String year = dateString.substring(2, 4);
        String month = dateString.substring(5, 7);
        String day = dateString.substring(8, 10);

        String newBookingNo = letterOne + letteTwo + letterThree + year + month + day;
        return newBookingNo;
    }
}
