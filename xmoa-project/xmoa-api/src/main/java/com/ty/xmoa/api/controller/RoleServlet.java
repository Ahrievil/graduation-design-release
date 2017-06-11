package com.ty.xmoa.api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.xmoa.model.OaRole;
import com.ty.xmoa.service.RoleService;
import com.ty.xmoa.util.BaseServlet;

import net.sf.json.JSONArray;

public class RoleServlet extends BaseServlet {

	private RoleService service = new RoleService();

	public void queryAllRoleName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<String> list = service.queryAllName();
		JSONArray array1 = JSONArray.fromObject(list);
		System.out.println(array1.toString());
		out.println(array1.toString());
		out.flush();
		out.close();
	}

	public String deleteRole(HttpServletRequest request, HttpServletResponse response) {
		List<OaRole> list = service.loadAll();
		request.setAttribute("list", list);
		return "/files/scjs.jsp";
	}

	public String deleteSecRole(HttpServletRequest request, HttpServletResponse response) throws IOException {
		FuncServlet ser = new FuncServlet();
		String[] roid = request.getParameterValues("roid");
		for (int i = 0; i < roid.length; i++) {
			if (service.countUser(Integer.parseInt(roid[i])) == 0) {// 判断是否有用户在使用该角色
				service.deleteFunByRoid(Integer.parseInt(roid[i]));// 伤处中间表role_fun中的数据
			}

		}
		String unable = " ";
		int k = 0;
		for (int i = 0; i < roid.length; i++) {
			int flag = service.deleteById(Integer.parseInt(roid[i]));
			if (flag != 0) {
				k++;
			} else {
				String name = service.queryNameById(Integer.parseInt(roid[i]));
				unable = unable + " " + name;
			}
		}
		request.setAttribute("result", "成功更新" + k + "条角色信息，其中" + unable + "如果删除失败，可能有用户正在使用该角色，请核实没有用户使用该角色后删除！");
		return ser.queryAllFunName(request, response);
	}
}
