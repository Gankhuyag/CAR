package edu.mum.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

import edu.mum.domain.Phone;


public class PhoneFormatter implements Formatter<Phone>{

	@Override
	public String print(Phone phone, Locale locale) {
		
		
		
		return phone.getArea() + "-" + phone.getPrefix() + "-" + phone.getNumber() ;
	}

	@Override
	public Phone parse(String phoneString, Locale locale) throws ParseException {
		
		Phone phoneNum;
		
		int area = Integer.parseInt(phoneString.substring(0-3));
		int prefix = Integer.parseInt(phoneString.substring(4, 7));
		int number = Integer.parseInt(phoneString.substring(8, 12));
		
		phoneNum = new Phone();
		phoneNum.setArea(area);
		phoneNum.setPrefix(prefix);
		phoneNum.setNumber(number);
		return phoneNum;
	}

	

}
