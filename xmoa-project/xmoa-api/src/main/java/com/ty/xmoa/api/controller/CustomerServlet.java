package com.ty.xmoa.api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.xmoa.model.OaCustomer;
import com.ty.xmoa.service.CustomerService;
import com.ty.xmoa.util.BaseServlet;
import com.ty.xmoa.util.PageUtil;

import net.sf.json.JSONArray;

public class CustomerServlet extends BaseServlet {

	CustomerService cs = new CustomerService();

	public void getAllInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<OaCustomer> list = cs.queryAllName();
		List<String> list1 = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			list1.add(list.get(i).getCuname());
		}
		JSONArray array = JSONArray.fromObject(list1);
		System.out.println(array.toString());
		out.println(array.toString());
		out.flush();
	}

	public String queryAllCustomer(HttpServletRequest request,
			HttpServletResponse response) {
		String curPage = request.getParameter("curPage");
		System.out.println("curPage======>" + curPage);
		if (curPage == null || curPage == "") {
			curPage = "1";
		}
		PageUtil util = cs.queryByPage(Integer.parseInt(curPage));
		request.setAttribute("util", util);
		Long l = System.currentTimeMillis();
		request.setAttribute("curPage", curPage);
		request.getSession().setAttribute("check", l + "");
		return "/files/listkehuxinxi.jsp";
	}

	public String deleteSecCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] array = request.getParameterValues("hello");
		String[] array1 = request.getParameterValues("world");
		System.out.println(array.length + "====" + array1.length);
		int k = 0;
		for (int i = 0; i < array.length; i++) {
			if (array1[i].equals("yes")) {
				System.out.println(array[i] + "----" + array1[i]);
				cs.delectOneCus(Integer.parseInt(array[i]));
				k++;
			}
		}
		request.setAttribute("result", "成功删除"+k+"条记录");
		return queryAllCustomer(request, response);
	}
	public String insertOne(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String check = (String)request.getSession().getAttribute("check");
		String refresh = request.getParameter("refresh");
		System.out.println(check+"----"+refresh);
		int k = 0;
		if(check.equals(refresh)){
			String  cuname = request.getParameter("clientname");
			String  cuper = request.getParameter("cper");
			String  cuadd = request.getParameter("caddr");
			String  cutell = request.getParameter("ctel");
			String  cubg = request.getParameter("cbackground");
			OaCustomer customer = new OaCustomer();
			customer.setCuname(cuname);
			customer.setCuper(cuper);
			customer.setCuadd(cuadd);
			customer.setCutell(cutell);
			customer.setCubg(cubg);
			k = cs.insertOne(customer);
			request.setAttribute("result", "成功插入"+k+"条客户信息");
		}
		return queryAllCustomer(request, response);
		
		
	}
	public String queryInfo(HttpServletRequest request,HttpServletResponse response){
		String cuid = request.getParameter("cuid");
		OaCustomer customer = cs.load(Integer.parseInt(cuid));
		request.setAttribute("customer", customer);
		return "/files/Editkehu.jsp";
	}
	public String updateCus(HttpServletRequest request,HttpServletResponse response){
		String cuid = request.getParameter("cuid");
		String cuname = request.getParameter("clientname");
		String cuper = request.getParameter("cper");
		String cuadd = request.getParameter("caddr");
		String cutell = request.getParameter("ctel");
		String cubg = request.getParameter("cbackground");
		OaCustomer customer = new OaCustomer();
		customer.setCuid(Integer.parseInt(cuid));
		customer.setCuname(cuname);
		customer.setCuper(cuper);
		customer.setCuadd(cuadd);
		customer.setCutell(cutell);
		customer.setCubg(cubg);
		cs.update(customer);
		request.setAttribute("result", "保存成功");
		
//		System.out.println(cuid+"--"+cuname+"--"+cuper+"---"+cuadd+"--"+cutell+"--"+cubg);
		return queryAllCustomer(request, response);
	}
	public String queryForSee(HttpServletRequest request,HttpServletResponse response){
		String cuid = request.getParameter("cuid");
		OaCustomer customer = cs.load(Integer.parseInt(cuid));
		request.setAttribute("customer", customer);
		return "/files/kehuminxi.jsp";
	}
	
}
