package com.ty.xmoa.service;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.dao.UserDao;
import com.ty.xmoa.model.OaUser;
import com.ty.xmoa.util.PageUtil;

public class UserService {

	UserDao ud = new UserDao();
	PageUtil pageUtil = new PageUtil();

	public PageUtil queryByPage(int page) {
		return pageUtil.queryByPage(page, ud);
	}

	public OaUser login(String username) {
		return ud.load(username);
	}

	public int upload(OaUser user) {
		return ud.upload(user);
	}

	public List<String> loadAllMgr() {
		List<OaUser> l = ud.queryallMgr();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < l.size(); i++) {
			list.add(l.get(i).getUname());
		}
		return list;
	}

	public List<OaUser> loadAll() {
		return ud.queryall();
	}

	public OaUser loadWithId(int usid) {
		return ud.loadWithId(usid);
	}

	public int deleteOneUser(int usid) {
		return ud.deleteonerow(usid);
	}

	public List<String> loadAllName() {
		List<OaUser> l = ud.queryall();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < l.size(); i++) {
			list.add(l.get(i).getUname());
		}
		return list;
	}

	public List<String> loadAllWorker() {
		List<OaUser> l = ud.loadAllWorker();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < l.size(); i++) {
			list.add(l.get(i).getUname());
		}
		return list;
	}

	public int addOne(OaUser oaUser) {
		return ud.addOne(oaUser);
	}
}
