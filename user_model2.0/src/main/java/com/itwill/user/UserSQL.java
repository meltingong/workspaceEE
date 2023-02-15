package com.itwill.user;

public class UserSQL {
	public final static String USER_INSERT=
	"insert into userinfo(userid,password,name,email) values(?,?,?,?)";
	public final static String USER_UPDATE=
	"update  userinfo set password=?,name=?,email=? where userid=?";
	public final static String USER_REMOVE=
	"delete userinfo where userid=?";
	public final static String USER_SELECT_BY_ID=
	"select userid,password,name,email from userinfo where userid=?";
	public final static String USER_SELECT_ALL=
	"select userid,password,name,email from userinfo";
	public final static String USER_SELECT_BY_ID_COUNT=
			"select count(*) cnt from userinfo where userid=?";
}
