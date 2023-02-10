package com.itwill.shop.user.test;

import com.itwill.shop.user.User;
import com.itwill.shop.user.UserService;

public class UserServiceTestMain {

	public static void main(String[] args) throws Exception {
		UserService userService = new UserService();
		
		//회원가입
		//System.out.println(userService.create(new User("stest11", "1234", "섭테스트중", "ser1@abc.com", "010-4888-4888", "수수구")));
		
		//System.out.println(userService.createUserIdDetail(new User("stest1215", "1234", "섭테스트중", "ser1@abc.com", "010-4888-4888", "수수구")));
		//System.out.println(userService.createUserPwDetail(new User("stest123", "1234", "섭테스트중", "ser1@abc.com", "010-4888-4888", "수수구")));
		
		//로그인
		//System.out.println(userService.login("test1", "1234"));
		
		//아이디 중복체크
		//System.out.println(userService.isDuplicateId("test99"));
		
		//정보수정
		//System.out.println(userService.update(new User("test6", "4885", "서비스수정", "update@ser.com", "010-1000-1000", "어딘가")));
		
		//탈퇴
		//System.out.println(userService.remove("test2"));
		
		//1명 보기
		//System.out.println(userService.findUser("test99"));
		
		//전체보기
		//System.out.println(userService.findAll());
		
		//주소만 업데이트 테스트
		System.out.println(userService.updateAddress("서울시", "test99"));

	}

}
