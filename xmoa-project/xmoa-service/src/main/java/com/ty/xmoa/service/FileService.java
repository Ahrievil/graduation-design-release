package com.ty.xmoa.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.ty.xmoa.dao.FileDao;
import com.ty.xmoa.model.OaFile;
import com.ty.xmoa.util.PageUtil;

public class FileService {

	private FileDao fd = new FileDao();
	private PageUtil pu = new PageUtil();
	public PageUtil queryByPage(int page){
		return pu.queryByPage(page, fd);
	}
	public int insert(OaFile file){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		file.setFlupdate(sdf.format(date));
		return fd.insert(file);
	}
	public int delete(int id){
		return fd.delete(id);
	}
	public OaFile load(int id) {
		return fd.load(id);
	}
}
