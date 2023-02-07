package User;

import java.util.ArrayList;

import User.exception.ExistedUserException;
import User.exception.PasswordMismatchException;
import User.exception.UserNotFoundException;


public class UserService {
	private UserDao userDao;
	
	public UserService() throws Exception {
		userDao = new UserDao();
	}
	
	/*
	 * 회원가입
	 */
	public int create(User user) throws Exception {
		// 아이디 중복체크
		if(userDao.existedUser(user.getUserid())) {
			throw new ExistedUserException(user.getUserid()+"이미존재하는 아이디 입니다.");		
		}
		return userDao.create(user);
	}
	
	/*
	 * 로그인
	 */
	public User login(String userid, String password) throws Exception {
		// 아이디존재여부
		User user = userDao.findUser(userid);
		if(user==null) {
			throw new UserNotFoundException(userid + "존재하지않는 아이디 입니다.");
		}
		// 패쓰워드일치여부
		if(!user.isMathPassword(password)) {
			throw new PasswordMismatchException("패쓰워드가 일치하지 않습니다.");
		}
		return user;
	}
	
	/*
	 * 회원전체리스트
	 */
	public ArrayList<User> findUserList() throws Exception {
		return userDao.findUserList();
	}
	
	/*
	 * 아이디중복체크
	 */
	public boolean isDuplicateId(String userid) throws Exception {
		boolean isExist = userDao.existedUser(userid);
		if(isExist) {
			return true;
		}else {
			return false;
		}
	}
	
	/*
	 * 회원수정
	 */
	public int update(User user) throws Exception {
		return userDao.update(user);
	}
	
	/*
	 * 회원탈퇴
	 */
	public int delete(String userid) throws Exception {
		return userDao.delete(userid);
	}

}