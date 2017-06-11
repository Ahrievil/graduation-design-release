package com.ty.xmoa.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ty.xmoa.dao.PlanDao;
import com.ty.xmoa.model.OaPlan;
import com.ty.xmoa.util.PageUtil;

public class PlanService {

	private PlanDao pd = new PlanDao();
	private PageUtil pu = new PageUtil();

	public PageUtil queryByPage(int page) {
		return pu.queryByPage(page, pd);
	}

	public List<String> loadAllName() {
		List<OaPlan> l = pd.loadAll();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < l.size(); i++) {
			list.add(l.get(i).getPlName());
		}
		return list;
	}

	public int insert(OaPlan plan) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		plan.setPlCreateDate(sdf.format(date));
		int k = pd.loadIdByName(plan.getPlHeadPlan());
		plan.setPplid(k);
		plan.setFlag(0);
		plan.setPlIsExceed("否");
		plan.setPlStatus("未下发");
		String x = plan.getPlCreateTime();
		String y = plan.getPlEndTime();
		java.util.Date datax = sdf.parse(x);
		long lx = datax.getTime();
		datax = sdf.parse(y);
		long ly = datax.getTime();
		long l = (ly - lx) / (1000 * 60 * 60 * 24);
		plan.setPlDateNum(l);
		return pd.insert(plan);
	}

	public int deleteById(int plid) {
		return pd.deleteById(plid);
	}

	public OaPlan load(int plid) {
		return pd.load(plid);
	}

	public int update(OaPlan plan) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		if (plan.getIsok() == 1 && plan.getPlEndDate() == null) {
			plan.setPlEndDate(sdf.format(date));
		}
		return pd.update(plan);
	}

	public String doHomework(int plid) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String result = "任务下发成功";
		OaPlan plan = new OaPlan();
		plan.setPlid(plid);
		plan.setPlStatus("已下发");
		plan.setPlDownTime(sdf.format(date));
		pd.dowork(plan);
		return result;
	}

	public String PlanPost(int plid) {
		return pd.PlanPost(plid);
	}
}
