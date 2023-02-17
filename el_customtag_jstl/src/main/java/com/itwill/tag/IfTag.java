package com.itwill.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class IfTag extends TagSupport{
	
	private boolean test;
	
	public void setTest(boolean test) {
		this.test = test;
	}

	@Override
	public int doStartTag() throws JspException {
		if(test) {
			return EVAL_BODY_INCLUDE;
		}else {
			return SKIP_BODY;
		}
	}
	
	@Override
	public int doEndTag() throws JspException {

		return super.doEndTag();
	}
}
