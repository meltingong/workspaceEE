package com.itwill.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloAttributeTag extends TagSupport{
	private String irum;
	public HelloAttributeTag() {
		System.out.println("1.HelloAttributeTag기본생성자");
	}
	public void setIrum(String irum) {
		System.out.println("2.setIrum("+irum+")메쏘드호출");
		this.irum = irum;
	}

	
	
	@Override
	public int doStartTag() throws JspException {
		try {
			String msg="";
			if(irum.equals("김경호")) {
				msg= "잘생긴 "+ irum+" 님 안녕하세요.<br>";
			}else {
				msg= irum+" 님 안녕하세요.<br>";
			}
			pageContext.getOut().println(msg);
		}catch (Exception e) {
		}
		return SKIP_BODY;
	}


}
