package com.ty.xmoa.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ty.xmoa.dao.ModDao;
import com.ty.xmoa.model.OaModule;
import com.ty.xmoa.util.PageUtil;

public class ModService {

	private ModDao md = new ModDao();
	private PageUtil pu = new PageUtil();
	public PageUtil queryByPage(int page){
		return pu.queryByPage(page, md);
	}
	public int insert(OaModule mod){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		mod.setMoCreateTime(sdf.format(date));
		return md.insert(mod);
	}
	public int deleteModById(int moid){
		return md.deleteModById(moid);
	}
	public OaModule load(int moid){
		return md.load(moid);
	}
	public int update(OaModule mod){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		mod.setMoChangTime(sdf.format(date));
		return md.update(mod);
	}
	public int updateOther(OaModule mod){
		return md.updateOther(mod);
	}
	public List<String> loadAllName(String rname){
		List<OaModule> l = md.loadAll(rname);
		List<String> list = new ArrayList<String>();
		for(int i = 0;i < l.size();i ++){
			list.add(l.get(i).getMoName());
		}
		return list;
	}
}
