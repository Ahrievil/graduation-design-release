package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaUser;
import com.ty.xmoa.util.BaseDao;
import com.ty.xmoa.util.jdbcTemplete;

public class UserDao extends BaseDao {

	private jdbcTemplete jt = new jdbcTemplete();

	@Override
	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = "select * from (select rownum as num,z.* from (select * from oa_user order by usid asc) z) where num between ? and ?";
		return jt.findObject(sql, OaUser.class, beginIndex, endIndex);
	}

	@Override
	public int queryCount() {
		String sql = "select nvl(count(*),0) as cou from oa_user";
		return jt.queryCount(sql);
	}

	public OaUser load(String username) {
		String sql = "select * from oa_user where uname = ?";
		List<Object> u = jt.findObject(sql, OaUser.class, username);
		OaUser user = u.size() == 1 ? (OaUser) u.get(0) : null;
		return user;
	}

	public OaUser loadWithId(int usid) {
		String sql = "select * from oa_user where usid = ?";
		List<Object> u = jt.findObject(sql, OaUser.class, usid);
		OaUser user = u.size() == 1 ? (OaUser) u.get(0) : null;
		return user;
	}

	public int deleteonerow(int usid) {
		return jt.update("delete from oa_user where usid = ?", usid);
	}

	public int upload(OaUser user) {
		System.out.println(user);
		deleteonerow(user.getUsid());
		String sql = "insert into oa_user values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int k = jt.update(sql, user.getUsid(), user.getUname(), user.getUpwd(), user.getUsex(), user.getUbirthdate(),
				user.getUidNum(), user.getUemail(), user.getUtell(), user.getUadd(), user.getUstatus(), user.getUrole(),
				user.getUbankName(), user.getUbankAcc(), user.getUpay(), user.getUreward(), user.getUpaje(),
				user.getUhiredate(), user.getUpost(), user.getUother(), user.getUage());
		System.out.println("user更新的数据量：" + k);
		return k;
	}

	public int addOne(OaUser user) {
		System.out.println(user);
		String sql = "insert into oa_user(UNAME,UPWD,USEX,UBIRTHDATE,UIDNUM,UEMAIL,UTELL,UADD,USTATUS,UROLE,UBANKNAME,UBANKACC,UPAY,UREWARD,UPAJE,UHIREDATE,UPOST,UOTHER,UAGE) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int k = jt.update(sql, user.getUname(), user.getUpwd(), user.getUsex(), user.getUbirthdate(), user.getUidNum(),
				user.getUemail(), user.getUtell(), user.getUadd(), user.getUstatus(), user.getUrole(),
				user.getUbankName(), user.getUbankAcc(), user.getUpay(), user.getUreward(), user.getUpaje(),
				user.getUhiredate(), user.getUpost(), user.getUother(), user.getUage());
		System.out.println("user更新的数据量：" + k);
		return k;
	}

	public List<OaUser> queryall() {
		String sql = "select us.* from oa_user us order by us.usid desc";
		List<OaUser> list = new ArrayList(jt.findObject(sql, OaUser.class));
		return list;
	}

	public List<OaUser> queryallMgr() {
		String sql = "select us.* from oa_user us where upost = '项目经理' order by us.usid desc";
		List<OaUser> list = new ArrayList(jt.findObject(sql, OaUser.class));
		return list;
	}

	public List<OaUser> loadAllWorker() {
		String sql = "select us.* from oa_user us where upost != '管理员' order by us.usid desc";
		List<OaUser> list = new ArrayList(jt.findObject(sql, OaUser.class));
		return list;
	}
}
