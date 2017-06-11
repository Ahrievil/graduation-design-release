package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaModule;
import com.ty.xmoa.util.BaseDao;
import com.ty.xmoa.util.jdbcTemplete;

public class ModDao extends BaseDao{

	private jdbcTemplete jt = new jdbcTemplete();

	@Override
	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = "select * from (select rownum as num,z.* from (select * from oa_module order by moid asc) z) where num between ? and ?";
		List<Object> list = jt.findObject(sql, OaModule.class,beginIndex,endIndex);
		return list;
	}

	@Override
	public int queryCount() {
		String sql = "select nvl(count(*),0) as cou from oa_module";
		return jt.queryCount(sql);
	}
	public int insert(OaModule mod){
		String sql = "insert into oa_module(moid,moName,moMark,prname,rname,reLevel,moCreateTime,moOther,reOther) values((select nvl(max(moid),0) from oa_module)+1,?,?,?,?,?,to_date(?,'yyyy-MM-dd hh24:mi:ss'),?,?)";
		return jt.update(sql,mod.getMoName(),mod.getMoMark(),mod.getPrname(),mod.getRname(),mod.getReLevel(),mod.getMoCreateTime(),mod.getMoOther(),mod.getReOther());
		//"heh","ii","ss","hehea","很急","1993-12-03 08:08:08","hehe"
	}
	public int deleteModById(int moid){
		String sql = "delete from oa_module where moid = ?";
		return jt.update(sql, moid);
	}
	public OaModule load(int moid){
		String sql = "select * from oa_module where moid = ?";
		List<Object> list = jt.findObject(sql, OaModule.class, moid);
		return list.size()==1?(OaModule)list.get(0):null;
	}
	public int update(OaModule mod){
		String sql = "update oa_module set moName = ?,moMark = ?,prname = ?,rname = ?, reLevel = ?, moChangTime = to_date(?,'yyyy-MM-dd hh24:mi:ss'), moOther = ?, reOther = ? where moid = ?";
		return jt.update(sql, mod.getMoName(),mod.getMoMark(),mod.getPrname(),mod.getRname(),mod.getReLevel(),mod.getMoChangTime(),mod.getMoOther(),mod.getReOther(),mod.getMoid());
	}
	public int updateOther(OaModule mod){
		String sql = "update oa_module set moOther = ? where moid = ?";
		return jt.update(sql, mod.getMoOther(),mod.getMoid());
	}
	public List<OaModule> loadAll(String rname){
		String sql = "select * from oa_module where rname = ?";
		List<OaModule> list = new ArrayList(jt.findObject(sql, OaModule.class,rname));
		return list;
	}

	public static void main(String[] args) {
		ModDao md = new ModDao();
		md.insert(null);
	}
}
