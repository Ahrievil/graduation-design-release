package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaFeature;
import com.ty.xmoa.util.BaseDao;
import com.ty.xmoa.util.jdbcTemplete;

public class FeaDao extends BaseDao {

	private jdbcTemplete jt = new jdbcTemplete();

	@Override
	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = "select * from (select rownum as num,z.* from (select * from oa_feature order by feid asc) z) where num between ? and ?";
		return jt.findObject(sql, OaFeature.class, beginIndex, endIndex);
	}

	@Override
	public int queryCount() {
		String sql = "select nvl(count(*),0) as cou from oa_feature";
		return jt.queryCount(sql);
	}

	public OaFeature load(int feid) {
		String sql = "select * from oa_feature where feid = ?";
		List<Object> list = jt.findObject(sql, OaFeature.class, feid);
		return list.size() == 1 ? (OaFeature) list.get(0) : null;
	}

	public List<OaFeature> loadAll() {
		String sql = "select * from oa_feature";
		List<OaFeature> list = new ArrayList(jt.findObject(sql, OaFeature.class));
		return list;
	}

	public int insert(OaFeature fea) {
		String sql = "insert into oa_feature(feid,feName,prname,rname,moName,feNum,feLevel,feCreateTime,feother,reother) values((select nvl(max(feid),0) from oa_feature)+1,?,?,?,?,?,?,to_date(?,'yyyy-MM-dd hh24:mi:ss'),?,?)";
		return jt.update(sql, fea.getFeName(), fea.getPrname(), fea.getRname(), fea.getMoName(), fea.getFeNum(),
				fea.getFeLevel(), fea.getFeCreateTime(), fea.getFeother(), fea.getReother());
	}

	public int deleteProById(int feid) {
		String sql = "delete from oa_feature where feid = ?";
		return jt.update(sql, feid);
	}

	public int update(OaFeature fea) {
		String sql = "update oa_feature set feName = ?,rname=?,moName=?,feNum=?,feLevel=?,feother=?,reother=? where feid = ?";
		return jt.update(sql, fea.getFeName(), fea.getRname(), fea.getMoName(), fea.getFeNum(), fea.getFeLevel(),
				fea.getFeother(), fea.getReother(), fea.getFeid());
	}

	public int updateneed(OaFeature fea) {
		String sql = "update oa_feature set reother = ? where feid = ?";
		return jt.update(sql, fea.getReother(), fea.getFeid());
	}

	public List<OaFeature> loadAllName(String moname) {
		String sql = "select * from oa_feature fe where fe.moName = ?";
		List<OaFeature> list = new ArrayList(jt.findObject(sql, OaFeature.class, moname));
		return list;
	}

}
