package com.ty.xmoa.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ty.xmoa.dao.FeaDao;
import com.ty.xmoa.model.OaFeature;
import com.ty.xmoa.util.PageUtil;

public class FeaService {

	private PageUtil pu = new PageUtil();
	private FeaDao fd = new FeaDao();
	public PageUtil queryByPage(int page){
		return pu.queryByPage(page, fd);
	}
	public int insert(OaFeature fea){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		fea.setFeCreateTime(sdf.format(date));
		return fd.insert(fea);
	}
	public int deleteProById(int feid){
		return fd.deleteProById(feid);
	}
	public OaFeature load(int feid){
		return fd.load(feid);
	}
	public int update(OaFeature fea){
		return fd.update(fea);
	}
	public int updateneed(OaFeature fea){
		return fd.updateneed(fea);
	}
	public List<String> loadAllName(String moname){
		List<OaFeature> l = fd.loadAllName(moname);
		List<String> list = new ArrayList<String>();
		for(int i = 0;i < l.size();i ++){
			list.add(l.get(i).getFeName());
		}
		return list;
	}
}
