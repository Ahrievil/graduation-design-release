package com.ty.xmoa.api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.xmoa.model.OaRequire;
import com.ty.xmoa.service.ReqService;
import com.ty.xmoa.util.BaseServlet;
import com.ty.xmoa.util.PageUtil;

import net.sf.json.JSONArray;

public class ReqServlet extends BaseServlet {

	private ReqService service = new ReqService();

	public String queryAll(HttpServletRequest request, HttpServletResponse response) {
		String curPage = request.getParameter("curPage");
		System.out.println("curPage======>" + curPage);
		if (curPage == null || curPage == "") {
			curPage = "1";
		}
		PageUtil util = service.queryByPage(Integer.parseInt(curPage));
		request.setAttribute("util", util);
		Long l = System.currentTimeMillis();
		request.setAttribute("curPage", curPage);
		request.getSession().setAttribute("check", l + "");
		return "/files/listxuqiu.jsp";
	}

	public String addReq(HttpServletRequest request, HttpServletResponse response) {
		String prname = request.getParameter("proname");
		String rname = request.getParameter("title");
		String reOther = request.getParameter("ms");
		OaRequire req = new OaRequire();
		req.setPrname(prname);
		req.setRname(rname);
		req.setReOther(reOther);
		int k = service.insertOne(req);
		request.setAttribute("result", "成功插入" + k + "条记录");
		return queryAll(request, response);
	}

	public String deleteReq(HttpServletRequest request, HttpServletResponse response) {
		String[] array = request.getParameterValues("hello");
		String[] array1 = request.getParameterValues("world");
		int k = 0;
		for (int i = 0; i < array.length; i++) {
			if (array1[i].equals("yes")) {
				System.out.println(array[i] + "--" + array1[i]);
				k += service.deleteReq(Integer.parseInt(array[i]));
			}
		}
		request.setAttribute("result", "成功删除" + k + "条记录！");
		return queryAll(request, response);
	}

	public String updateReqForSee(HttpServletRequest request, HttpServletResponse response) {
		String reid = request.getParameter("reid");
		OaRequire req = service.queryById(Integer.parseInt(reid));
		request.setAttribute("req", req);
		return "/files/editxuqiu.jsp";
	}

	public String updateReq(HttpServletRequest request, HttpServletResponse response) {
		String reid = request.getParameter("reid");
		String rname = request.getParameter("title");
		String reOther = request.getParameter("neirong");
		OaRequire req = new OaRequire();
		req.setReid(Integer.parseInt(reid));
		req.setRname(rname);
		;
		req.setReOther(reOther);
		int k = service.updateReq(req);
		request.setAttribute("result", "一共成功更新了" + k + "条数据");
		return queryAll(request, response);
	}

	public String queryReq(HttpServletRequest request, HttpServletResponse response) {
		String reid = request.getParameter("reid");
		OaRequire req = service.queryById(Integer.parseInt(reid));
		request.setAttribute("req", req);
		return "/files/listxuqiumingxi.jsp";
	}

	public void loadAllName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String prname1 = request.getParameter("prname");
		String prname = new String((prname1.getBytes("ISO-8859-1")), "UTF-8");
		System.out.println("hehehehehehhehehhe----" + prname);
		List<String> list = service.loadAllName(prname);
		JSONArray array1 = JSONArray.fromObject(list);
		System.out.println(array1.toString());
		out.println(array1.toString());
		out.flush();
		out.close();
	}

}
