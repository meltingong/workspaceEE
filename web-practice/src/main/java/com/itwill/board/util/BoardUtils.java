package com.itwill.board.util;

import java.util.Iterator;

import com.itwill.board.Board;

public class BoardUtils {
	/*
	 * \r\n 을 html의 <br>로 convert한다
	 */
	public static String convertHtmlBr(String comment) {
		if (comment == null) {
			return "";
		}
		int length = comment.length();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < length; i++) {
			String tmp = comment.substring(i, i+1);
			if ("\r".compareTo(tmp) == 0) {
				tmp = comment.substring(++i, i+1);
				if ("\n".compareTo(tmp) == 0) {
					buffer.append("<br>\r");
				}else {
					buffer.append("\r");
				}
			}buffer.append(tmp);
		}
		return buffer.toString();
	}
	/*
	 * 게시글, 답글의 title 출력 설정
	 */
	public String getTitleString(Board board) {
		StringBuilder title = new StringBuilder(128);
		String t = board.getTitle();
		if (t.length() > 15) {
			t = String.format("%s...", t.substring(0, 15));
		}
		// 답글 공백 삽입
		for (int i = 0; i < board.getDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}
		// 답글 화살표이미지 삽입
		if (board.getDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}
		title.append(t.replace(" ", "&nbsp;"));
		return title.toString();
	}
	
}
