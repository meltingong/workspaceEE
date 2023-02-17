package com.itwill.i18n;

import java.util.Locale;
import java.util.ResourceBundle;

/*
 * Internationalization(i18n) 국제화
 */
public class InternationalizationMain {

	public static void main(String[] args) {
		
		Locale currentLocale = Locale.getDefault();//os locale
		Locale usLocale = new Locale("en", "US");
		Locale jpLocale = new Locale("ja", "JP");
		Locale krLocale = new Locale("ko", "KR");
		Locale cnLocale = new Locale("zh", "CN");
		Locale esLocale = new Locale("es", "ES");
		
		Locale locale = jpLocale;
		
		/*
		  Locale정보를 이용해서 guest_xx_YY.properties 중하나를 읽어서 
		 	xx--> 언어정보(en,ko,ja) 
		 	YY--> 국가정보(US,KR,JP)
		 
		 ResourceBundle객체생성
		 */
		ResourceBundle resBundle1 = ResourceBundle.getBundle("com/itwill/i18n/guest", locale);
		System.out.println(locale.getLanguage()+"_"+locale.getCountry());
		
		System.out.println(resBundle1.getString("title.main"));
		System.out.println(resBundle1.getString("title.list"));
		System.out.println(resBundle1.getString("title.view"));
		System.out.println(resBundle1.getString("title.write"));
		System.out.println(resBundle1.getString("write.label.name"));
		System.out.println(resBundle1.getString("write.label.email"));
		System.out.println(resBundle1.getString("write.label.homepage"));
		System.out.println(resBundle1.getString("write.label.title"));

	}

}
