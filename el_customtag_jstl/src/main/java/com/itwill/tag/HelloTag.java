package com.itwill.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloTag extends TagSupport{
	public HelloTag() {
		System.out.println("1.HelloTag 기본 생성자");
	}
	
	@Override
	public int doStartTag() throws JspException {
		System.out.println("doStartTag()");
		return super.doStartTag();
	}
	@Override
	public int doEndTag() throws JspException {
		System.out.println("doEndTag()");
		return super.doEndTag();
	}
}
