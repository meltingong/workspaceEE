package com.itwill.shop.user.test;

import com.itwill.shop.user.User;
import com.itwill.shop.user.UserDao;

public class UserDaoTestMain {

	public static void main(String[] args) throws Exception{
		UserDao userDao=new UserDao();
		
		//회원가입
		//System.out.println(userDao.insert(new User("test99","1111","생성되길","aaa@naver.com","010-0000-0000","신도시")));
				
		//회원수정
		//System.out.println(userDao.update(new User("test1","1234","변경되길","update@aaa.com","010-4444-8888","수정시")));
		
		//회원탈퇴
		//System.out.println(userDao.remove("ggg"));
				
		//전체회원보기
		//System.out.println(userDao.findUserList());
				
		//유저한명 상세보기
		//System.out.println(userDao.findUser("test99"));
				
		//아이디 중복체크
		//System.out.println(userDao.existedUser("test50"));
		
		//주소만 업데이트
		//System.out.println(userDao.updateAddress("서울시 서초구 역삼동", "fffff"));
	}

}