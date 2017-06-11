package com.ty.xmoa.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ty.xmoa.dao.ProDao;
import com.ty.xmoa.model.OaProject;
import com.ty.xmoa.util.PageUtil;

public class ProService {

	private PageUtil pu = new PageUtil();
	private ProDao pd = new ProDao();

	public PageUtil queryByPage(int page) {
		return pu.queryByPage(page, pd);
	}

	public int insertPro(OaProject pro) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		pro.setPrSetup(sdf.format(date));
		return pd.insertPro(pro);
	}

	public int deleteProById(int prid) {
		return pd.deleteProById(prid);
	}

	public OaProject load(int prid) {
		return pd.load(prid);
	}

	public int updateProById(OaProject pro) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		System.out.println(sdf.format(date));
		pro.setPrChangTime(sdf.format(date));
		return pd.updateProById(pro);
	}

	public List<String> loadAllName() {
		List<OaProject> l = pd.loadAll();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < l.size(); i++) {
			list.add(l.get(i).getPrName());
		}
		return list;
	}
}
