package com.ty.xmoa.api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.xmoa.model.OaPlan;
import com.ty.xmoa.model.OaUser;
import com.ty.xmoa.service.PlanService;
import com.ty.xmoa.util.BaseServlet;
import com.ty.xmoa.util.PageUtil;

import net.sf.json.JSONArray;

public class PlanServlet extends BaseServlet{

	private PlanService service = new PlanService();
	public String queryAll(HttpServletRequest request,HttpServletResponse response){
		String curPage = request.getParameter("curPage");
		System.out.println("curPage======>" + curPage);
		if (curPage == null || curPage == "") {
			curPage = "1";
		}
		PageUtil util = service.queryByPage(Integer.parseInt(curPage));
		request.setAttribute("util", util);
		request.setAttribute("curPage", curPage);
		return "/files/listjihua.jsp";
	}
	public void getAllName(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<String> list = service.loadAllName();
		JSONArray array = JSONArray.fromObject(list);
		System.out.println(array.toString());
		out.println(array.toString());
		out.flush();
		out.close();
	}
	
	//prono jtitle plHeadPlan jrbegindate jrenddate jbyper jmission jleixing iscomplete xuqiu1 modu feature jbeizhu
	public String insert(HttpServletRequest request,HttpServletResponse response) throws ParseException{
		System.out.println("request.getQueryString(): " + request.getQueryString());
		String prname = request.getParameter("prono");
		String plName = request.getParameter("jtitle");
		String plHeadPlan = request.getParameter("plHeadPlan");
		String plCreateTime = request.getParameter("jrbegindate");
		String plEndTime = request.getParameter("jrenddate");
		String plWorker = request.getParameter("jbyper");
		String plLevel = request.getParameter("jmission");
		String plType =request.getParameter("jleixing");
		String rname = request.getParameter("xuqiu1");
		String moname = request.getParameter("modu");
		String feName = request.getParameter("feature");
		String plOther = request.getParameter("jbeizhu");
		OaPlan plan = new OaPlan();
		OaUser user = (OaUser)request.getSession().getAttribute("currentuser");
		plan.setPlMgr(user.getUname());
		plan.setPrname(prname);
		plan.setPlName(plName);
		plan.setPlHeadPlan(plHeadPlan);
		plan.setPlCreateTime(plCreateTime);
		plan.setPlEndTime(plEndTime);
		plan.setPlWorker(plWorker);
		plan.setPlLevel(plLevel);
		plan.setPlType(plType);
		plan.setRname(rname);
		plan.setMoname(moname);
		plan.setFename(feName);
		plan.setPlOther(plOther);
		System.out.println(plan);
		int k = service.insert(plan);
		String result = "插入失败！";
		if(k==1){
			result = "插入成功！";
		}
		request.setAttribute("result", result);
		return queryAll(request, response);
	}
	public String deletePlan(HttpServletRequest request,HttpServletResponse response){
		String [] array=request.getParameterValues("hello");
		String [] array1=request.getParameterValues("world");
		int k = 0;
		String result = "已有后置任务，请先完成或删除后置任务后再来删除";
		for(int i=0;i<array.length;i++){
			if(array1[i].equals("yes")){
				k+=service.deleteById(Integer.parseInt(array[i]));
				result = "成功删除"+k+"条记录！";
			}
		}
		request.setAttribute("result", result);
		return queryAll(request, response);
	}
	public String editForSee(HttpServletRequest request,HttpServletResponse response){
		String plid = request.getParameter("plid");
		String tag = request.getParameter("tag");
		String path = null;
		OaPlan plan = service.load(Integer.parseInt(plid));
		System.out.println(plan);
		request.setAttribute("jh", plan);
		if("1".equals(tag)){
			path = "/files/editjihua.jsp";
		}else if("2".equals(tag)){
			path = "/files/jihuamingxi.jsp";
		}else{
			String post = service.PlanPost(Integer.parseInt(plid));
			request.setAttribute("post", post);
			path = "/files/listrenwumingxi1.jsp";
		}
		return path;
	}
	public String update(HttpServletRequest request,HttpServletResponse response){
		String plid = request.getParameter("jnoo");
		String plName = request.getParameter("jtitle");
		String plHeadPlan = request.getParameter("plHeadPlan");
		String plEndDate = request.getParameter("jrenddate");
		String plWorker = request.getParameter("jbyper");
		String plLevel = request.getParameter("jmission");
		String plType = request.getParameter("jleixing");
		String flag = request.getParameter("iscomplete");
		String rname = request.getParameter("nno");
		String moname = request.getParameter("modu");
		String fename = request.getParameter("gno");
		String isok = request.getParameter("isok");
		String plOther = request.getParameter("jbeizhu");
		OaPlan plan = new OaPlan();
		plan.setPlid(Integer.parseInt(plid));
		plan.setPlName(plName);
		plan.setRname(rname);
		plan.setPlHeadPlan(plHeadPlan);
		plan.setPlEndDate(plEndDate);
		plan.setPlWorker(plWorker);
		plan.setPlLevel(plLevel);
		plan.setPlType(plType);
		plan.setFlag(Integer.parseInt(flag));
		plan.setMoname(moname);
		plan.setFename(fename);
		plan.setIsok(Integer.parseInt(isok));
		plan.setPlOther(plOther);
		System.out.println(plan);
		String result = "更新失败！";
		int k = service.update(plan);
		if(k==1){
			result = "更新成功！";
		}
		request.setAttribute("result", result);
		return queryAll(request, response);
	}
	public String doWork(HttpServletRequest request,HttpServletResponse response){
		String plid = request.getParameter("plid");
		String result = service.doHomework(Integer.parseInt(plid));
		request.setAttribute("result", result);
		return queryAll(request, response);
	}
	
}
