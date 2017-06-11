package com.ty.xmoa.api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ty.xmoa.model.OaPost;
import com.ty.xmoa.service.PostService;
import com.ty.xmoa.util.BaseServlet;
import com.ty.xmoa.util.PageUtil;

import net.sf.json.JSONArray;

public class PostServlet extends BaseServlet{
	
	private PostService service = new PostService();

	public void getAllPostName(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<String> list = service.queryAllName();
		JSONArray array = JSONArray.fromObject(list);
		System.out.println(array.toString());
		out.println(array.toString());
		out.flush();
		out.close();
	}
	public String queryAllPost(HttpServletRequest request,HttpServletResponse response){
		String curPage = request.getParameter("curPage");
		System.out.println("curPage======>"+curPage);
		if(curPage == null||curPage==""){
			curPage = "1";
		}
		PageUtil util = service.queryByPage(Integer.parseInt(curPage));
		request.setAttribute("util", util);
		Long l = System.currentTimeMillis();
		request.setAttribute("curPage",curPage);
		request.getSession().setAttribute("check", l+"");
		return "/files/listzhiwu.jsp";
	}
	public String delectSecPost(HttpServletRequest request,HttpServletResponse response){
		String [] array=request.getParameterValues("hello");
		String [] array1=request.getParameterValues("world");
		for(int i=0;i<array.length;i++){
			System.out.println(array[i]+"====="+array1[i]);
			if(array1[i].equals("yes")){
//				System.out.println("id========"+array[i]);
				service.deleteById(Integer.parseInt(array[i]));
			}
		} 
		return queryAllPost(request, response);
	}
	public String insertOne(HttpServletRequest request,HttpServletResponse response){
		String poid = request.getParameter("poid");
		String name = request.getParameter("name");
		String other = request.getParameter("other");
		int k = service.insertOne(Integer.parseInt(poid), name, other);
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(3);
		session.setAttribute("insertpost", k);
		return queryAllPost(request, response);
	}
	public String queryForEdit(HttpServletRequest request,HttpServletResponse response){
		String poid = request.getParameter("poid");
		OaPost post = service.load(Integer.parseInt(poid));
		request.setAttribute("onepost", post);
		return "/files/updatezw.jsp";
	}
	public String updateOnePost(HttpServletRequest request,HttpServletResponse response){
		String poid = request.getParameter("poid");
		String name = request.getParameter("name");
		String other = request.getParameter("other");
		//System.out.println(poid+"---"+name+"---"+other);
		String result = service.updateById(Integer.parseInt(poid), name, other);
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(3);
		session.setAttribute("result", result);
		return queryAllPost(request, response);
	}
	public String queryForSee(HttpServletRequest request,HttpServletResponse response){
		String poid = request.getParameter("poid");
		OaPost post = service.load(Integer.parseInt(poid));
		request.setAttribute("onepost", post);
		return "/files/postinfo.jsp";
	}
	
	
}
