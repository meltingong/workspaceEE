package com.itwill.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloAttributeTag extends TagSupport{
	private String irum;
	public HelloAttributeTag() {
		System.out.println("1.HelloAttributeTag 기본 생성자");
	}
	
	public String getIrum() {
		System.out.println("2.setIrum("+irum+")메소드 호출");
		return irum;
	}
	
	
	public void setIrum(String irum) {
		this.irum = irum;
	}
	@Override
	public int doStartTag() throws JspException {
		
		return super.doStartTag();
	}


	@Override
	public int doEndTag() throws JspException {
	
		return super.doEndTag();
	}
}
