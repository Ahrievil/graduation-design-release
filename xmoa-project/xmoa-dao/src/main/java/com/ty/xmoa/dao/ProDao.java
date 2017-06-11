package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaProject;
import com.ty.xmoa.util.BaseDao;
import com.ty.xmoa.util.jdbcTemplete;

public class ProDao extends BaseDao {

	private jdbcTemplete jt = new jdbcTemplete();

	@Override
	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = "select * from (select rownum as num,z.* from (select * from oa_project order by prid asc) z) where num between ? and ?";
		return jt.findObject(sql, OaProject.class, beginIndex, endIndex);
	}

	@Override
	public int queryCount() {
		String sql = "select nvl(count(*),0) as cou from oa_project";
		return jt.queryCount(sql);
	}

	public int insertPro(OaProject pro) {
		String sql = "insert into oa_project(prid,prname,prclient,prmgr,prnum,prmoney,prstatus,prcost,prstarttime,prendtime,prlevel,prother,prsetup) values((select nvl(max(prid),0) from oa_project)+1,?,?,?,?,?,?,?,to_date(?,'yyyy-MM-dd'),to_date(?,'yyyy-MM-dd'),?,?,to_date(?,'yyyy-MM-dd hh24:mi:ss'))";
		return jt.update(sql, pro.getPrName(), pro.getPrClient(), pro.getPrMgr(), pro.getPrNum(), pro.getPrMoney(),
				pro.getPrStatus(), pro.getPrCost(), pro.getPrStartTime(), pro.getPrEndTime(), pro.getPrLevel(),
				pro.getPrOther(), pro.getPrSetup());
	}

	public int deleteProById(int prid) {
		String sql = "delete from oa_project where prid = ?";
		return jt.update(sql, prid);
	}

	public OaProject load(int prid) {
		String sql = "select * from oa_project where prid = ?";
		List<Object> list = jt.findObject(sql, OaProject.class, prid);
		return list.size() == 1 ? (OaProject) list.get(0) : null;
	}

	public int updateProById(OaProject pro) {
		String sql = "update oa_project set prname = ?,prclient = ?,prmoney = ?,prnum = ?,prmgr = ?,prstatus = ?,prcost = ?,prstart = to_date(?,'yyyy-MM-dd'),prlevel = ?,prother = ?,prchangtime = to_date(?,'yyyy-MM-dd hh24:mi:ss') where prid = ?";
		return jt.update(sql, pro.getPrName(), pro.getPrClient(), pro.getPrMoney(), pro.getPrNum(), pro.getPrMgr(),
				pro.getPrStatus(), pro.getPrCost(), pro.getPrStart(), pro.getPrLevel(), pro.getPrOther(),
				pro.getPrChangTime(), pro.getPrid());
	}

	public List<OaProject> loadAll() {
		String sql = "select * from oa_project";
		List<OaProject> list = new ArrayList(jt.findObject(sql, OaProject.class));
		return list;
	}
}
