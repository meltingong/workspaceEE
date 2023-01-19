package com.itwill.address;


import java.util.List;

public class AddressService {
	private AddressDao addressDao;
	public AddressService() throws Exception {
		addressDao = new AddressDao();
	}
public int insert(Address newAddress) throws Exception {
		return addressDao.insert(newAddress);
	}

	public int update(Address updateAddress) throws Exception{	
		return addressDao.update(updateAddress);
	}
	
	public int delete(int no) throws Exception{
		return addressDao.delete(no);
	}
	
	public Address findByPrimaryKey(int no) throws Exception{
		return addressDao.findByPrimaryKey(no);
	}
	
	public List<Address> findAll() throws Exception{
		return addressDao.findAll();	
	}
}
