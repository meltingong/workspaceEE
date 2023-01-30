package com.itwill.user.test;

import com.itwill.user.User;
import com.itwill.user.UserDao;

public class UserDaoTestMain {

	public static void main(String[] args) throws Exception{
		UserDao userDao=new UserDao();
		System.out.println("1.insert:"+
				userDao.insert(new User("guard4", "4444", "사사님", "four@gmail.com")));
		User updateUser = new User("guard4", "4444", "사수정", "fourchange@gmail.com");
		System.out.println("2.update:"+userDao.update(updateUser));
		System.out.println("3.findUser:"+userDao.findUser("guard4"));
		System.out.println("4.remove:"+userDao.delete("guard4"));
		System.out.println("5.findUserList:"+userDao.findUserList());
		System.out.println("6.countByUserId:"+userDao.countByUserId("guard1"));
		System.out.println("6.countByUserId:"+userDao.countByUserId("guard2"));
		System.out.println("6.countByUserId:"+userDao.countByUserId("guard4"));
		
		
	}

}
