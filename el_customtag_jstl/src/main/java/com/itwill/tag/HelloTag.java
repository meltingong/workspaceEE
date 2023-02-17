package com.itwill.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloTag extends TagSupport{
	public HelloTag() {
		System.out.println("1.HelloTag기본생성자");
	}
	@Override
	public int doStartTag() throws JspException {
		System.out.println("doStartTag()");
		try {
			JspWriter out = pageContext.getOut();
			String sUserId = (String)pageContext.getSession().getAttribute("sUserId");
			if(sUserId==null) {
				sUserId="GUEST";
			}
			
			out.println(sUserId+" 님 안뇽하세요<br>");
			
		}catch (IOException e) {
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}
	@Override
	public int doEndTag() throws JspException {
		System.out.println("doEndTag()");
		try {
			pageContext.getOut().print("<hr>");
		}catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return EVAL_PAGE;
	}
}
