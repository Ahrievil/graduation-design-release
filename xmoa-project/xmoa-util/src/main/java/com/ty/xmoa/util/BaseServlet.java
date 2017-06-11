package com.ty.xmoa.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private static Map<String, String> map = new HashMap<String, String>();
	public static String contextPath = "";
	public static ServletConfig servletConfig;
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		servletConfig = config;
		Properties properties = new Properties();
		ServletContext application = config.getServletContext();
		String path = application.getRealPath("/");
		contextPath = path;
		String realpath = application.getRealPath("properties/web.properties");
		File file = new File(realpath);
		FileInputStream is = null;
		try {
			is = new FileInputStream(file);
			properties.load(is);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Set<Object> keySet = properties.keySet();
		for(Object obj:keySet){
			map.put((String)obj, properties.getProperty((String)obj));
		}
		try {
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String op = request.getParameter("op");
//		Properties properties = new Properties();
//		ServletContext application = request.getSession().getServletContext();
//		String realpath = application.getRealPath("/WEB-INF/classes/web.properties");
//		File file = new File(realpath);
//		properties.load(new FileInputStream(file));
		String uri = request.getRequestURI();
		uri = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
//		String cla = properties.getProperty(uri);
		String cla = map.get(uri);
		try {
			Class<?> clazz = Class.forName(cla);
			Method me = clazz.getMethod(op,HttpServletRequest.class,HttpServletResponse.class);
			Object obj = clazz.newInstance();
			String result = (String)me.invoke(obj, request,response);
			if(result != null){
				if (result.contains("redirect:")) {
					response.sendRedirect(result.replace("redirect:", ""));
				} else {
					request.getRequestDispatcher(result).forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
