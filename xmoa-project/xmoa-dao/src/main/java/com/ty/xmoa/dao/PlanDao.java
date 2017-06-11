package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaPlan;
import com.ty.xmoa.model.OaProject;
import com.ty.xmoa.util.BaseDao;
import com.ty.xmoa.util.jdbcTemplete;

public class PlanDao extends BaseDao {

	private jdbcTemplete jt = new jdbcTemplete();

	@Override
	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = "select * from (select rownum as num,z.* from (select * from oa_plan order by plid asc) z) where num between ? and ?";
		List<Object> list = jt.findObject(sql, OaPlan.class, beginIndex, endIndex);
		return list;
	}

	@Override
	public int queryCount() {
		String sql = "select nvl(count(*),0) as cou from oa_plan";
		return jt.queryCount(sql);
	}

	public OaPlan load(int plid) {
		String sql = "select * from oa_plan where plid = ?";
		List<Object> list = jt.findObject(sql, OaPlan.class, plid);
		return list.size() == 1 ? (OaPlan) list.get(0) : null;
	}

	public List<OaPlan> loadAll() {
		String sql = "select * from oa_plan";
		List<OaPlan> list = new ArrayList(jt.findObject(sql, OaPlan.class));
		return list;
	}

	public int loadIdByName(String plHeadPlan) {
		String sql = "select * from oa_plan where plName = ?";
		List<Object> list = jt.findObject(sql, OaPlan.class, plHeadPlan);
		return list.size() == 1 ? ((OaPlan) (list.get(0))).getPlid() : 0;
	}

	public int insert(OaPlan plan) {
		String sql = "insert into oa_plan(plid,plName,prname,fename,rname,moname,pplid,flag,plCreateTime,plEndTime,plCreateDate,plMgr,plWorker,plDateNum,plLevel,plType,plHeadPlan,plStatus,plOther,PlIsExceed) "
				+ "values((select nvl(max(plid),0) from oa_plan)+1,?,?,?,?,?,?,?,to_date(?,'yyyy-MM-dd'),to_date(?,'yyyy-MM-dd'),to_date(?,'yyyy-MM-dd'),?,?,?,?,?,?,?,?,?)";
		return jt.update(sql, plan.getPlName(), plan.getPrname(), plan.getFename(), plan.getRname(), plan.getMoname(),
				plan.getPplid(), plan.getFlag(), plan.getPlCreateTime(), plan.getPlEndTime(), plan.getPlCreateDate(),
				plan.getPlMgr(), plan.getPlWorker(), plan.getPlDateNum(), plan.getPlLevel(), plan.getPlType(),
				plan.getPlHeadPlan(), plan.getPlStatus(), plan.getPlOther(), plan.getPlIsExceed());
	}

	public int deleteById(int plid) {
		String sql = "delete from oa_plan where plid = ?";
		return jt.update(sql, plid);
	}

	public int update(OaPlan plan) {
		String sql = "update oa_plan set plName=?,plHeadPlan=?,plEndDate=to_date(?,'yyyy-MM-dd'),plWorker=?,plLevel=?,plType=?,flag=?,rname=?,moname=?,fename=?,isok=?,plOther=? where plid = ?";
		return jt.update(sql, plan.getPlName(), plan.getPlHeadPlan(), plan.getPlEndDate(), plan.getPlWorker(),
				plan.getPlLevel(), plan.getPlType(), plan.getFlag(), plan.getRname(), plan.getMoname(),
				plan.getFename(), plan.getIsok(), plan.getPlOther(), plan.getPlid());
	}

	public int dowork(OaPlan plan) {
		String sql = "update oa_plan set PlStatus = ?,PlDownTime= to_date(?,'yyyy-MM-dd') where plid = ?";
		return jt.update(sql, plan.getPlStatus(), plan.getPlDownTime(), plan.getPlid());
	}

	public String PlanPost(int plid) {
		String sql = "select * from oa_project pr,oa_plan pl where pr.prname = pl.prname and plid = ?";
		List<Object> list = jt.findObject(sql, OaProject.class, plid);
		return list.size() == 1 ? ((OaProject) list.get(0)).getPrClient() : null;
	}

}
