package com.ty.xmoa.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.ty.xmoa.dao.CustomerDao;
import com.ty.xmoa.model.OaCustomer;
import com.ty.xmoa.util.PageUtil;

public class CustomerService {

	private CustomerDao cd = new CustomerDao();
	private PageUtil pu = new PageUtil();

	public List<OaCustomer> queryAllName() {
		return cd.loadAll();
	}

	public PageUtil queryByPage(int page) {
		return pu.queryByPage(page, cd);
	}

	public int delectOneCus(int cuid) {
		return cd.delectOneCus(cuid);
	}

	public int insertOne(OaCustomer customer) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String sDate = sdf.format(date);
		customer.setCudate(sDate);
		return cd.insertOne(customer);
	}

	public OaCustomer load(int cuid) {
		return cd.load(cuid);
	}

	public int update(OaCustomer customer) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String sDate = sdf.format(date);
		customer.setCudate(sDate);
		return cd.update(customer);
	}
}
