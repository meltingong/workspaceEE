package com.itwill.guest.test;

import com.itwill.guest.GuestService;

public class GuestServiceTestMain {

	public static void main(String[] args) throws Exception {
		GuestService guestService=new GuestService();
		System.out.println(guestService.findAll());

	}

}
