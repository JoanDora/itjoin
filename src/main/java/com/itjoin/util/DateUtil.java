package com.itjoin.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil{
	
	
	
	public static Date parseDate(String dateStr){
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf2.parse(dateStr);
		} catch (ParseException e) {
			try {
				return sdf.parse(dateStr);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			return null;
		}
		
	}

}
