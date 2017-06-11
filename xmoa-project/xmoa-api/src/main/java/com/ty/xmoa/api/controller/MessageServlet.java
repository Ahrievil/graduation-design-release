package com.ty.xmoa.api.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.xmoa.model.OaMessage;
import com.ty.xmoa.model.OaUser;
import com.ty.xmoa.service.MessageService;
import com.ty.xmoa.util.BaseServlet;
import com.ty.xmoa.util.PageUtil;

public class MessageServlet extends BaseServlet{

	private MessageService service = new MessageService();
	
	public String sendMess(HttpServletRequest request,HttpServletResponse response){
		String check = (String)request.getSession().getAttribute("check");
		String refresh = request.getParameter("refresh");
		System.out.println(check+"----"+refresh);
		int k = 0;
		if(check == null||refresh==null||refresh.equals(check)){
			System.out.println("进来了");
			String head = request.getParameter("biaoti");
			String taker = request.getParameter("namesb");
			String text = request.getParameter("textarea");
			System.out.println("名字组是））））"+taker);
			//当前登录用户就是发件人
			OaUser user = (OaUser)request.getSession().getAttribute("currentuser");
			String sender = user.getUname();
			String[] nameArr=taker.split(",");
			for(int i = 0;i < nameArr.length;i ++){
				System.out.println(nameArr[i]);
				OaMessage mess = new OaMessage();
				mess.setSender(sender);
				mess.setTaker(nameArr[i]);
				mess.setHead(head);
				mess.setText(text);
				k+=service.insert(mess);
			}
		}
		request.setAttribute("result", "共发送了"+k+"条消息");
		
		return listSendInfo(request, response);
	}
	public String listSendInfo(HttpServletRequest request,HttpServletResponse response){
		String curPage = request.getParameter("curPage");
		System.out.println("curPage======>" + curPage);
		if (curPage == null || curPage == "") {
			curPage = "1";
		}
		OaUser user = (OaUser)request.getSession().getAttribute("currentuser");
		service.md.sender = user.getUname();
		PageUtil util = service.queryByPage(Integer.parseInt(curPage));
		service.md.sender = null;
		request.setAttribute("util", util);
		request.setAttribute("curPage", curPage);
		Long l = System.currentTimeMillis();
		request.getSession().setAttribute("check", l+"");
		return "/files/listsendxiaoxi.jsp";
	}
	public String deleteSecMess(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String [] array=request.getParameterValues("hello");
		String [] array1=request.getParameterValues("world");
		int k = 0;
		for (int i = 0; i < array.length; i++) {
			if(array1[i].equals("yes")){
//				System.out.println("id-----"+array[i]);
//				System.out.println(array[i]+"--"+array1[i]);
			//array[i]表示mid
				if ("yes".equals(array1[i])) {
					k+=service.deleteById(Integer.parseInt(array[i]));
				}
			}
		}
		request.setAttribute("result", "成功删除"+k+"条消息！");
		return listSendInfo(request, response);
	}
	public String messInfo(HttpServletRequest request,HttpServletResponse response){
		String mid = request.getParameter("mid");
		OaMessage mess = service.load(Integer.parseInt(mid));
		request.setAttribute("onemess", mess);
		return "/files/sendxiaoximingxi.jsp";
	}
	public String returnMess(HttpServletRequest request,HttpServletResponse response){
		String sender = request.getParameter("sender");
		String taker = request.getParameter("taker");
		request.setAttribute("sender", sender);
		request.setAttribute("taker", taker);
		return "/files/sendxiaoxi.jsp";
	}
	public String deleteOneMess(HttpServletRequest request,HttpServletResponse response){
		String mid = request.getParameter("mid");
		int k = service.deleteById(Integer.parseInt(mid));
		request.setAttribute("result", "成功删除"+k+"条信息");
		return listSendInfo(request, response);
	}
	public String listTakeInfo(HttpServletRequest request,HttpServletResponse response){
		String curPage = request.getParameter("curPage");
		System.out.println("curPage======>" + curPage);
		if (curPage == null || curPage == "") {
			curPage = "1";
		}
		OaUser user = (OaUser)request.getSession().getAttribute("currentuser");
		service.md.taker = user.getUname();
		PageUtil util = service.queryByPage(Integer.parseInt(curPage));
		service.md.taker = null;
		request.setAttribute("util", util);
		request.setAttribute("curPage", curPage);
		Long l = System.currentTimeMillis();
		request.getSession().setAttribute("check", l+"");
		return "/files/listtakexiaoxi.jsp";
	}
	public String sendMessForReturn(HttpServletRequest request,HttpServletResponse response){
		String head = request.getParameter("biaoti");
		String sender = request.getParameter("sender");
		String taker = request.getParameter("taker");
		String text = request.getParameter("textarea");
		OaMessage mess = new OaMessage();
		mess.setHead(head);
		mess.setSender(sender);
		mess.setTaker(taker);
		mess.setText(text);
		service.insert(mess);
		return listSendInfo(request, response);
	}
	public String listAllMess(HttpServletRequest request,HttpServletResponse response){
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
		return "/files/listxiaoxi.jsp";
	}
}
