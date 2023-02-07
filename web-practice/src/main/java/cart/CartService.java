package cart;

import java.util.List;
public class CartService {
	private CartDao cartDao;
	public CartService() throws Exception {
		cartDao=new CartDao();
	}
	
	/*
	 * 카트추가 or 수정
	 */
	
	public int addCart(String sUserId,int p_no,int cart_qty)throws Exception {
		if(cartDao.countByProductNo(sUserId,p_no) > 0) {
			return cartDao.updateByProductNo(sUserId,p_no,cart_qty);
		}else {
			return cartDao.insert(sUserId,p_no,cart_qty);
		}
	}
	/*
	 * 카트리스트에서 수량변경
	 */
	
	public int updateCart(int cart_no,int cart_qty)throws Exception {
		return cartDao.updateByCartNo(cart_no,cart_qty);
	}
	/*
	 * 카트보기
	 */
	public List<Cart> getCartItemByUserId(String sUserId) throws Exception{
		return cartDao.findByUserId(sUserId);
	}
	/*
	 * 카트아이템1개보기
	 */
	public Cart getCartItemByCartNo(int cart_no) throws Exception{
		return cartDao.findByCartNo(cart_no);
	}
	
	/*
	 * 카트아이템1개삭제
	 */
	public int deleteCartItemByCartNo(int cart_no) throws Exception{
		return cartDao.deleteByCartNo(cart_no);
	}
	/*
	 * 카트삭제
	 */
	public int deleteCartItemByUserId(String sUserId)throws Exception {
		return cartDao.deleteByUserId(sUserId);
	}
}
