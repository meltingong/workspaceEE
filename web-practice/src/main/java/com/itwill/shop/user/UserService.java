package com.itwill.shop.user;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.user.exception.ExistedUserException;
import com.itwill.shop.user.exception.PasswordMismatchException;
import com.itwill.shop.user.exception.UserNotFoundException;

public class UserService {
	private UserDao userDao;
	
	public UserService() throws Exception {
		userDao = new UserDao();
	}
	
	/*
	 * 회원가입
	 */
	public int create(User user) throws Exception {
		if(userDao.existedUser(user.getUserId())) {
			return -1; //-1 =아이디 중복 , 1 = 가입성공
		}else {
			int insertRowCount = userDao.insert(user);
			return insertRowCount; //아이디 중복X
		}
	}
	
	/*
	 * 아이디(영문+숫자 4~10자 이하), 비밀번호(영문+숫자 4~10)
	 */
	public int createUserIdDetail(User user) throws Exception {
		int result = 0;
		char[] temp = user.getUserId().toCharArray();
		for (int i = 0; i < temp.length; i++) {
			if((temp.length >= 4 && temp.length <= 10) && ((temp[i] >= 'a' && temp[i] <= 'z') || (temp[i] >= '0' && temp[i] <= '9'))) {
				if(i == temp.length-1) {
					result = 1;
					break;
				}
			}else {
				result = 2;
			}
		}
		
		return result;
		
	}
	
	public int createUserPwDetail(User user) throws Exception {
		int result = 0;
		char[] temp = user.getPassword().toCharArray();
		for (int i = 0; i < temp.length; i++) {
			if((temp.length >= 4 && temp.length <= 10) && ((temp[i] >= 'a' && temp[i] <= 'z') || (temp[i] >= '0' && temp[i] <= '9'))) {
				if(i == temp.length-1) {
					result = 1;
					break;
				}
			}else {
				result = 2;
			}
		}
		
		return result;
		
	}
	
	/*
	 * 로그인
	 */
	public User login(String userId, String password) throws Exception {
		// 1.아이디존재여부
		User user = userDao.findUser(userId);
		if (user == null) {
			throw new UserNotFoundException(userId + " 는 존재하지않는 아이디 입니다.");
		}
		// 2.패쓰워드일치여부
		if (!user.isMatchPassword(password)) {
			throw new PasswordMismatchException("패쓰워드가 일치하지않습니다.");
		}
		
		return user;
	}
	
	/*
	 * 회원정보수정
	 */
	public int update(User user) throws Exception {
		return userDao.update(user);
	}
	
	/*
	 * 회원탈퇴
	 */
	public int remove(String userId) throws Exception {
		return userDao.remove(userId);
	}
	
	/*
	 * 회원상세보기
	 */
	public User findUser(String userId) throws Exception {
		return userDao.findUser(userId);
	}
	
	/*
	 * 회원전체보기
	 */
	public List<User> findAll() throws Exception {
		return userDao.findUserList();
	}
	
	
	/*
	 * 아이디중복체크
	 */
	public boolean isDuplicateId(String userId) throws Exception {
		boolean isExist = userDao.existedUser(userId);
		if(isExist) {
			return true;
		}else {
			return false;
		}
	}
	
	/*
	 * 주소변경
	 */
	public int updateAddress(String address, String userId) throws Exception{
		
		return userDao.updateAddress(address, userId);
	}
	
	
	
	
}
