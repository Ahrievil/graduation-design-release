package com.ty.xmoa.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.ty.xmoa.dao.PerwDao;
import com.ty.xmoa.model.OaPlan;
import com.ty.xmoa.util.PageUtil;

public class PerwService {

	public PerwDao pd = new PerwDao();
	private PageUtil pu = new PageUtil();

	public PageUtil queryByPage(int page) {
		return pu.queryByPage(page, pd);
	}

	public String doWork(int plid) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		OaPlan plan = new OaPlan();
		String result = "任务无法执行！";
		plan.setPlid(plid);
		plan.setFlag(1);
		plan.setPlStartTime(sdf.format(date));
		int k = pd.doWork(plan);
		if (k == 1) {
			result = "任务完成，等待审核!";
		}
		return result;
	}
}
