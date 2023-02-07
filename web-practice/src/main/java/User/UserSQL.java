package User;

public class UserSQL {
	/*
	 * 회원 생성
	 */
	public final static String USER_INSERT
	= "insert into userinfo(userid,password,name,email,phone,address) values(?,?,?,?,?)";
	/*
	 * 회원 아이디로 조회
	 */
	public final static String USER_SELECT_BY_ID
	= "select userid,password,name,email,phone,address from userinfo where userid = ?";
	/*
	 * 회원 전체 조회
	 */
    public final static String USER_SELECT_ALL
    = "select userid,password,name,email,phone,address from userinfo";
    /*
     * 회원 아이디 중복체크
     */
    public final static String USER_SELECT_BY_ID_COUNT
    = "select count(*) cnt from userinfo where userid=?";
    /*
     * 회원 정보 수정 
     */
    public final static String USER_UPDATE
    = "update userinfo set password=?,name=?,email=?,phone=?,address=? where userid=?";
    /*
     * 회원 정보 삭제
     */
    public final static String USER_DELETE
    = "delete userinfo where userid=?";
}