package com.itwill.guest;

import java.util.ArrayList;

public class GuestService {
	private GuestDao guestDao;
	public GuestService() {
		//System.out.println("1.GuestService객체생성:"+this);
		guestDao=new GuestDao();
	}
	
	public ArrayList<Guest> selectAll()throws Exception{
		return guestDao.selectAll();
	}
	public Guest selectByNo(int no)throws Exception{
		return guestDao.selectByNo(no);
	}
	public int insertGuest(Guest guest)throws Exception{
		return guestDao.insertGuest(guest);
	}
	public int updateGuest(Guest guest)throws Exception{
		return guestDao.updateGuest(guest);
	}
	public int deleteGuest(int no)throws Exception{
		return guestDao.deleteGuest(no);
	}
	
}
