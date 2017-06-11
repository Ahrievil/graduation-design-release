package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaRole;
import com.ty.xmoa.util.jdbcTemplete;

public class RoleDao {

	private jdbcTemplete jt = new jdbcTemplete();
	public List<OaRole> loadAll(){
		String sql = "select ro.* from oa_role ro order by ro.roid";
		List<OaRole> list = new ArrayList(jt.findObject(sql, OaRole.class));
		return list;
	}
	public int insertRole(OaRole role){
		String sql = "insert into oa_role values((select nvl(max(roid),0) from oa_role)+1,?,?)";
		return jt.update(sql,role.getRoname(),role.getOther());
	}
	public int deleteById(int roid){
		String sql = "delete from oa_role where roid = ?";
		return jt.update(sql, roid);
	}
	public String queryNameById(int roid){
		String sql = "select * from oa_role ro where roid = ?";
		List<OaRole> list = new ArrayList(jt.findObject(sql, OaRole.class,roid));
		return list.size()==1?list.get(0).getRoname():null;
	}
	
	//在伤处权限时要有限考录有没有用户在使用该角色
	public int countUser(int roid){
		String sql = "select count(*) as cou from oa_user us,oa_role ro where us.urole = ro.roname and ro.roid = '"+roid+"'";
		return jt.queryCount(sql);
	}
	public int deleteFunByRoid(int roid){
		String sql = "delete from role_fun where roid = ?";
		return jt.update(sql, roid);
	}
	
	public static void main(String[] args) {
		RoleDao rd = new  RoleDao();
//		rd.queryNameById(1);
		System.out.println(rd.countUser(1));
	}
}
