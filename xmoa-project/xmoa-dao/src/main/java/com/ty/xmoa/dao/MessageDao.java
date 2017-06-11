package com.ty.xmoa.dao;

import java.util.List;

import com.ty.xmoa.model.OaMessage;
import com.ty.xmoa.util.BaseDao;

public class MessageDao extends BaseDao {

	public String sender;
	public String taker;

	@Override
	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = null;
		if (sender != null) {
			sql = "select * from (select rownum as num,z.* from (select * from oa_message where sender = '" + sender
					+ "' order by mid desc) z) where num between ? and ?";
		} else if (taker != null) {
			sql = "select * from (select rownum as num,z.* from (select * from oa_message where taker = '" + taker
					+ "' order by mid desc) z) where num between ? and ?";
		} else {
			System.out.println("哈哈我进来了，我查的是全部");
			sql = "select * from (select rownum as num,z.* from (select * from oa_message order by mid desc) z) where num between ? and ?";
		}
		return jt.findObject(sql, OaMessage.class, beginIndex, endIndex);
	}

	@Override
	public int queryCount() {
		String sql = null;
		if (sender != null) {
			sql = "select nvl(count(*),0) as cou from oa_message where sender = '" + sender + "'";
		} else if (taker != null) {
			sql = "select nvl(count(*),0) as cou from oa_message where taker = '" + taker + "'";
		} else {
			sql = "select nvl(count(*),0) as cou from oa_message";
		}
		return jt.queryCount(sql);
	}

	public int insert(OaMessage mess) {
		String sql = "insert into oa_message values(?,?,?,?,?,?,?)";
		int id = this.queryMax() + 1;
		return jt.update(sql, id, mess.getSender(), mess.getTaker(), mess.getSendtime(), mess.getTaketime(),
				mess.getHead(), mess.getText());
	}

	public int queryMax() {
		String sql = "select nvl(max(mid),0) as cou from oa_message";
		return jt.queryCount(sql);
	}

	public int deleteById(int mid) {
		String sql = "delete from oa_message where mid = ?";
		return jt.update(sql, mid);
	}

	public OaMessage load(int mid) {
		String sql = "select * from oa_message where mid = ?";
		List<Object> list = jt.findObject(sql, OaMessage.class, mid);
		return list.size() == 1 ? (OaMessage) list.get(0) : null;
	}

	public void updatetaketime(OaMessage mess) {
		String sql = "update oa_message set taketime = ? where mid = ?";
		jt.update(sql, mess.getTaketime(), mess.getMid());
	}

	public static void main(String[] args) {
		MessageDao dao = new MessageDao();
		dao.queryAllByPage(1, 5);
	}
}
