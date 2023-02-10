package com.itwill.shop.user;

public class UserSQL {
	
		//회원생성
		public final static String USER_INSERT = 
				"insert into userinfo(userId,password,name,email,phone,address) values(?,?,?,?,?,?)";
		
		//회원정보수정
		public final static String USER_UPDATE = 
				"update userinfo set password = ?, name = ?, email = ?, phone = ?, address = ? where userId=?";
		
		//회원탈퇴
		public final static String USER_REMOVE = 
				"delete from userinfo where userId=?";
		
		//유저id로 조회
		public final static String USER_SELECT_BY_ID=
				"select userId,password,name,email,phone,address from userinfo where userId = ?";
		
		//전체회원보기
		public final static String USER_SELECT_ALL = 
				"select userId,password,name,email,phone,address from userinfo";
		
		//아이디 중복체크
		public final static String USER_SELECT_BY_ID_COUNT = 
				"select count(*) cnt from userinfo where userId = ?";
		
		//주소정보만 업데이트
		public final static String USER_ADDRESS_UPDATE = 
				"update userinfo set address = ? where userid=?";
		
}