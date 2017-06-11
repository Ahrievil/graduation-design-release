package com.ty.xmoa.service;

import java.util.List;

import com.ty.xmoa.dao.FunDao;
import com.ty.xmoa.model.OaFunctions;

public class FunService {

	FunDao fd = new FunDao();
	public List<OaFunctions> queryFunByRoname(String roname){
		return fd.queryFunByRoname(roname);
	}
	public List<OaFunctions> queryAllFunName(){
		List<OaFunctions> list = fd.queryAllFunName();
//		List<String> list = new ArrayList<String>();
//		for(int i = 0;i < l.size();i++){
//			String name = l.get(0).getFname();
//			list.add(name);
//		}
		return list;
	}
	public int deleteFunByRoleName(String roname){
		return fd.deleteFunByRoname(roname);
	}
	public int insertFunByRoleName(String roname,int fid){
		return fd.insertFunByRoleName(roname, fid);
	}
}
