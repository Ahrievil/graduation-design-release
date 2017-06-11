package com.ty.xmoa.service;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.dao.RoleDao;
import com.ty.xmoa.model.OaRole;

public class RoleService {

	private RoleDao rd = new RoleDao();

	public List<String> queryAllName() {
		List<OaRole> role = rd.loadAll();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < role.size(); i++) {
			list.add(role.get(i).getRoname());
		}
		return list;
	}

	public List<OaRole> loadAll() {
		return rd.loadAll();
	}

	public int insertRole(OaRole role) {
		return rd.insertRole(role);
	}

	public int deleteById(int roid) {
		return rd.deleteById(roid);
	}

	public String queryNameById(int roid) {
		return rd.queryNameById(roid);
	}

	public int countUser(int roid) {
		return rd.countUser(roid);
	}

	public int deleteFunByRoid(int roid) {
		return rd.deleteFunByRoid(roid);
	}
}
