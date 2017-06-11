package com.ty.xmoa.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ty.xmoa.dao.ReqDao;
import com.ty.xmoa.model.OaRequire;
import com.ty.xmoa.util.PageUtil;

public class ReqService {

	private ReqDao rd = new ReqDao();
	private PageUtil pu = new PageUtil();

	public PageUtil queryByPage(int page) {
		return pu.queryByPage(page, rd);
	}

	public int insertOne(OaRequire req) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		req.setReMakeTime(sdf.format(date));
		return rd.inertOne(req);
	}

	public int deleteReq(int reid) {
		return rd.deleteReq(reid);
	}

	public OaRequire queryById(int reid) {
		return rd.queryById(reid);
	}

	public int updateReq(OaRequire req) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		req.setReChangTime(sdf.format(date));
		return rd.updateReq(req);
	}

	public List<String> loadAllName(String prname) {
		List<OaRequire> l = rd.loadAllByPrname(prname);
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < l.size(); i++) {
			list.add(l.get(i).getRname());
		}
		return list;
	}
}
