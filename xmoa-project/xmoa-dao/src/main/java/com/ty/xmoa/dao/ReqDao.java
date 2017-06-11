package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaRequire;
import com.ty.xmoa.util.BaseDao;
import com.ty.xmoa.util.jdbcTemplete;

public class ReqDao extends BaseDao {

	private jdbcTemplete jt = new jdbcTemplete();

	@Override
	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = "select * from (select rownum as num,z.* from (select * from oa_require order by reid desc) z) where num between ? and ?";
		List<Object> list = jt.findObject(sql, OaRequire.class, beginIndex, endIndex);
		return list;
	}

	@Override
	public int queryCount() {
		String sql = "select nvl(count(reid),0) as cou from oa_require";
		return jt.queryCount(sql);
	}

	public int inertOne(OaRequire req) {
		String sql = "insert into oa_require(reid,rname,prname,reMakeTime,reOther) values((select nvl(max(reid),0) from oa_require)+1,?,?,to_date(?,'yyyy-MM-dd hh24:mi:ss'),?)";
		return jt.update(sql, req.getRname(), req.getPrname(), req.getReMakeTime(), req.getReOther());
	}

	public int deleteReq(int reid) {
		String sql = "delete from oa_require where reid = ?";
		return jt.update(sql, reid);
	}

	public OaRequire queryById(int reid) {
		String sql = "select * from oa_require where reid = ?";
		List<Object> list = jt.findObject(sql, OaRequire.class, reid);
		return list.size() == 1 ? (OaRequire) list.get(0) : null;
	}

	public int updateReq(OaRequire req) {
		String sql = "update oa_require set rname = ?,reother = ?,reChangTime = to_date(?,'yyyy-MM-dd hh24:mi:ss') where reid = ?";
		return jt.update(sql, req.getRname(), req.getReOther(), req.getReChangTime(), req.getReid());
	}

	public List<OaRequire> loadAllByPrname(String prname) {
		String sql = "select * from oa_require where prname = ?";
		List<OaRequire> list = new ArrayList(jt.findObject(sql, OaRequire.class, prname));
		return list;
	}

	public static void main(String[] args) {
		ReqDao rd = new ReqDao();
		// rd.queryAllByPage(1, 5);
		// rd.inertOne(null);
		rd.updateReq(null);
	}
}
