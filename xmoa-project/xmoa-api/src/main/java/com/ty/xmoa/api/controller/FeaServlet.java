package com.ty.xmoa.api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.xmoa.model.OaFeature;
import com.ty.xmoa.service.FeaService;
import com.ty.xmoa.util.BaseServlet;
import com.ty.xmoa.util.PageUtil;

import net.sf.json.JSONArray;

public class FeaServlet extends BaseServlet{

	private FeaService service = new FeaService();
	public String queryAll(HttpServletRequest request,HttpServletResponse response){
		String curPage = request.getParameter("curPage");
		System.out.println("curPage======>" + curPage);
		if (curPage == null || curPage == "") {
			curPage = "1";
		}
		PageUtil util = service.queryByPage(Integer.parseInt(curPage));
		request.setAttribute("util", util);
		request.setAttribute("curPage", curPage);
		Long l = System.currentTimeMillis();
		request.getSession().setAttribute("check", l+"");
		return "/files/listgongneng.jsp";
	}
	public String insert(HttpServletRequest request,HttpServletResponse response){
		String prname = request.getParameter("pid");
		String feName = request.getParameter("gname");
		String feNum = request.getParameter("hao");
		String feLevel = request.getParameter("miss");
		String rname = request.getParameter("xuqiu");
		String moName = request.getParameter("modno");
		String feOther = request.getParameter("miao");
		String reOther = request.getParameter("reother");
		OaFeature fea = new OaFeature();
		fea.setFeName(feName);
		fea.setFeNum(Integer.parseInt(feNum));
		fea.setPrname(prname);
		fea.setFeLevel(feLevel);
		fea.setRname(rname);
		fea.setMoName(moName);
		fea.setFeother(feOther);
		fea.setReother(reOther);
		System.out.println(fea);
		int k = service.insert(fea);
		String result = "插入数据失败！";
		if(k==1){
			result = "插入成功！";
		}
		request.setAttribute("result", result);
		return queryAll(request, response);
	}
	public String deleteSecFea(HttpServletRequest request,HttpServletResponse response){
		String [] array=request.getParameterValues("hello");
		String [] array1=request.getParameterValues("world");
		int k = 0;
		for(int i=0;i<array.length;i++){
			if(array1[i].equals("yes")){
				k+=service.deleteProById(Integer.parseInt(array[i]));
			}
		}
		request.setAttribute("result", "成功删除"+k+"条记录！");
		return queryAll(request, response);
	}
	public String editForSee(HttpServletRequest request,HttpServletResponse response){
		String feid = request.getParameter("feid");
		String flag = request.getParameter("flag");
		OaFeature fea = service.load(Integer.parseInt(feid));
		request.setAttribute("gongneng", fea);
		if("1".equals(flag)){
			return "/files/editgongneng.jsp";
		}else if("2".equals(flag)){
			return "/files/gongnengxuqiu.jsp";
		}else if("3".equals(flag)){
			return "/files/listgongnengmingxi.jsp";
		}
		return "";
	}
	public String update(HttpServletRequest request,HttpServletResponse response){
		String feid = request.getParameter("feid");
		String prname = request.getParameter("pid");
		String feName = request.getParameter("gname");
		String feNum = request.getParameter("hao");
		String feLevel = request.getParameter("miss");
		String rname = request.getParameter("xuqiu");
		String moName = request.getParameter("modno");
		String feOther = request.getParameter("miao");
		String reOther = request.getParameter("reother");
		OaFeature fea = new OaFeature();
		fea.setFeid(Integer.parseInt(feid));
		fea.setFeName(feName);
		fea.setFeNum(Integer.parseInt(feNum));
		fea.setPrname(prname);
		fea.setFeLevel(feLevel);
		fea.setRname(rname);
		fea.setMoName(moName);
		fea.setFeother(feOther);
		fea.setReother(reOther);
		System.out.println(fea);
		int k = service.update(fea);
		String result = "更新数据失败！";
		if(k==1){
			result = "更新成功！";
		}
		request.setAttribute("result", result);
		return queryAll(request, response);
	}
	public String updateNeed(HttpServletRequest request,HttpServletResponse response){
		String feid = request.getParameter("feid");
		String reother = request.getParameter("needmiao");
		OaFeature fea = new OaFeature();
		fea.setFeid(Integer.parseInt(feid));
		fea.setReother(reother);
		service.updateneed(fea);
		return queryAll(request, response);
	}
	public void loadAllName(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String moname1 = request.getParameter("moname");
		String moname = new String((moname1.getBytes("ISO-8859-1")),"UTF-8");
		System.out.println(moname);
		List<String> list = service.loadAllName(moname);
		JSONArray array1 = JSONArray.fromObject(list);
		System.out.println(array1.toString());
		out.println(array1.toString());
		out.flush();
		out.close();
	}
}
