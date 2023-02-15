package com.itwill.guest;

public class $1_GuestDao클래스작성순서 {
	/******************************************************************	
	0. 테이블설계(create drop) 					-->guest_create_drop.sql 파일생성
	
	1. sql문작성(insert,update,update,select)	-->guest.sql 파일생성
	
	2. Dto클래스작성[Guest.java]
	
	3. Dao클래스작성[GuestDao.java]
		- 테이블에 insert,delete,update,selectByPk,selectAll 단위메쏘드만들기
		- 단위메쏘드(인자 반환타입정의)생성
	
	4.<<< 반드시 테스트 되어야합니다.>>>
	public class GuestDaoTestMain{
		public static void main(String[] args){
		  GuestDao guestDao=new GuestDaoImpl();
		  guestDao.insertGuest();
		} 
	}   
	******************************************************************/
}