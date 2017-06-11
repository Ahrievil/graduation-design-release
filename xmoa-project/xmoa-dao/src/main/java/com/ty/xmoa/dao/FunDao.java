package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaFunctions;
import com.ty.xmoa.util.jdbcTemplete;

public class FunDao {

	private jdbcTemplete jt = new jdbcTemplete();

	public List<OaFunctions> queryFunByRoname(String roname) {
		String sql = "select fu.* from oa_role ro,role_fun rf,oa_functions fu where ro.roid = rf.roid and rf.fid = fu.fid and ro.roname = ?";
		List<OaFunctions> list  = new ArrayList(jt.findObject(sql, OaFunctions.class, roname));
		return list;
	}
	public List<OaFunctions> queryAllFunName(){
		String sql = "select * from oa_functions";
		List<OaFunctions> list = new ArrayList(jt.findObject(sql, OaFunctions.class));
		return list;
	}
	public int deleteFunByRoname(String roname){
		String sql = "delete from role_fun rf where rf.roid = (select ro.roid from oa_role ro where ro.roname = ?)";
		return jt.update(sql, roname);
	}
	public int insertFunByRoleName(String roname,int fid){
		String sql = "insert into role_fun values((select ro.roid from oa_role ro where ro.roname = ?),?)";
		return jt.update(sql, roname,fid);
	}
}
