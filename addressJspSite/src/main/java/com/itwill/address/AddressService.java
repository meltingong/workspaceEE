package com.itwill.address;

/*
AddressService객체
 	- 주소록 비즈니스로직(업무)을 수행하는 클래스
  	- Presentation객체(서블릿,JSP,SWING)에서 직접접근(메쏘드호출)하는 클래스
  	- AddressDao객체를 멤버변수로 가지고있다.
  	- 주소록 업무수행 메쏘드에서 DataBase접근(CRUD)이 필요하면 Dao를 사용한다.
 */
public class AddressService {
	private AddressDao addressDao;
	public AddressService() throws Exception {
		addressDao=new AddressDao();
	}
	
	public int insert(Address newAddress) throws Exception{
		return addressDao.insert(newAddress);
	}
	public Address findByNo(int no)throws Exception{
		return addressDao.findByPrimaryKey(no);
	}
	public java.util.List<Address> selectAll()throws Exception{
		return addressDao.findAll();
	}
	public int update(Address updateAddress)throws Exception{
		return addressDao.update(updateAddress);
	}
	public int delete(int no)throws Exception{
		return addressDao.delete(no);
	}
	
}











