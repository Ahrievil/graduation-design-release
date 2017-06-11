package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaPost;
import com.ty.xmoa.util.BaseDao;
import com.ty.xmoa.util.jdbcTemplete;

public class PostDao extends BaseDao {

	private jdbcTemplete jt = new jdbcTemplete();

	public List<OaPost> loadAll() {
		String sql = "select po.* from oa_post po order by po.poid asc";
		List<OaPost> list = new ArrayList(jt.findObject(sql, OaPost.class));
		return list;
	}

	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = "select * from (select rownum as num,z.* from (select * from oa_post order by poid desc) z) where num between ? and ?";
		List<Object> list = jt.findObject(sql, OaPost.class, beginIndex, endIndex);
		return list;
	}

	public int queryCount() {
		String sql = "select count(*) as cou from oa_post";
		return jt.queryCount(sql);
	}

	public int deleteById(int poid) {
		String sql = "delete from oa_post where poid = ?";
		return jt.update(sql, poid);
	}

	public int insertOne(int poid, String name, String other) {
		String sql = "insert into oa_post values(?,?,?)";
		return jt.update(sql, poid, name, other);
	}

	public OaPost load(int poid) {
		String sql = "select * from oa_post where poid = ?";
		List<Object> list = jt.findObject(sql, OaPost.class, poid);
		OaPost post = list.size() == 1 ? (OaPost) list.get(0) : null;
		return post;
	}

	public int updateById(int poid, String name, String other) {
		String sql = "update oa_post set name = ? , other = ? where poid = ?";
		return jt.update(sql, name, other, poid);
	}

	// public static void main(String[] args) {
	// PostDao pd = new PostDao();
	// System.out.println(pd.queryCount());
	// System.out.println(pd.queryAllByPage("oa_post", "poid", 1, 5));
	//
	// }
}
