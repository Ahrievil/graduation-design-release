package com.ty.xmoa.api.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ty.xmoa.model.OaFile;
import com.ty.xmoa.model.OaUser;
import com.ty.xmoa.service.FileService;
import com.ty.xmoa.util.BaseServlet;
import com.ty.xmoa.util.PageUtil;

public class FileServlet extends BaseServlet {

	private FileService service = new FileService();

	public String queryAll(HttpServletRequest request, HttpServletResponse response) {
		String curPage = request.getParameter("curPage");
		System.out.println("curPage======>" + curPage);
		if (curPage == null || curPage == "") {
			curPage = "1";
		}
		PageUtil util = service.queryByPage(Integer.parseInt(curPage));
		request.setAttribute("util", util);
		request.setAttribute("curPage", curPage);
		return "/files/listshangchuan.jsp";
	}

	public void upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		// 1、创建一个DiskFileItemFactory工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 2、创建一个文件上传解析器
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 解决上传文件名的中文乱码
		upload.setHeaderEncoding("UTF-8");
		factory.setSizeThreshold(1024 * 500);// 设置内存的临界值为500K
		String path = contextPath;
		String midFile = "upload/";
		String filePath = path + midFile;
		System.out.println("filePath--> " + filePath);
		File linshi = new File(filePath);// 当超过500K的时候，存到一个临时文件夹中
		if (!linshi.exists()) {
			linshi.mkdir();
		}
		factory.setRepository(linshi);
		upload.setSizeMax(1024 * 1024 * 5);// 设置上传的文件总的大小不能超过5M
		try {
			// 1. 得到 FileItem 的集合 items
			List<FileItem> /* FileItem */ items = upload.parseRequest(request);
			String prName = null;
			// 2. 遍历 items:
			for (FileItem item : items) {
				// 若是一个一般的表单域, 打印信息
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString("utf-8");
					System.out.println(name + ": " + value);
					if ("pro".equals(name)) {
						prName = value;
					}
				}
				// 若是文件域则把文件保存到项目目录upload文件下.
				else {
					String fileName = item.getName();
					long sizeInBytes = item.getSize();
					System.out.println(fileName);
					System.out.println(sizeInBytes);
					// 取得不代后缀的文件
					String suffix = fileName.substring(0, fileName.lastIndexOf('.'));
					// 取得后缀名
					String ext = fileName.substring(fileName.lastIndexOf('.') + 1);
					InputStream in = item.getInputStream();
					byte[] buffer = new byte[1024];
					int len = 0;

					fileName = filePath + fileName;// 文件最终上传的位置
					System.out.println(fileName);
					OutputStream out = new FileOutputStream(fileName);

					while ((len = in.read(buffer)) != -1) {
						out.write(buffer, 0, len);
					}
					out.close();
					in.close();
					OaUser f = (OaUser) request.getSession().getAttribute("currentuser");
					String uper = f.getUname();
					OaFile file = new OaFile();
					file.setFlName(suffix);
					file.setFlType(ext);
					file.setFluper(uper);
					file.setPrName(prName);
					file.setFlSize(sizeInBytes);
					service.insert(file);
					System.out.println(file);
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/files/simple1.jsp?flag=1").forward(request, response);
	}

	public String delete(HttpServletRequest request, HttpServletResponse response) {
		String[] array = request.getParameterValues("hello");
		String[] array1 = request.getParameterValues("world");
		int k = 0;
		for (int i = 0; i < array.length; i++) {
			if (array1[i].equals("yes")) {
				k += service.delete(Integer.parseInt(array[i]));
			}
		}
		request.setAttribute("result", "成功删除" + k + "条记录！");
		return this.queryAll(request, response);
	}

	public void downLoad(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String flid = request.getParameter("flid");
		String is = request.getParameter("isOnline");
		boolean isOnline = Boolean.parseBoolean(is);
		System.out.println(isOnline);
		int id = Integer.parseInt(flid);
		System.out.println("flid" + flid);
		OaFile oaFile = service.load(id);
		System.out.println("oaFile" + oaFile.toString());
		String fileName = oaFile.getFlName();
		String suff = oaFile.getFlType();
		String path = contextPath;
		String midFile = "upload/";
		System.out.println("path" + path);
		String filePath = path + midFile + fileName + "." + suff;
		File f = new File(filePath);
		System.out.println("filePath" + filePath);
		if (!f.exists()) {
			response.sendError(404, "File not found!");
			return;
		}
		BufferedInputStream br = new BufferedInputStream(new FileInputStream(f));
		byte[] buf = new byte[1024];
		int len = 0;
		System.out.println("f.getName()" + f.getName());
		String name = new String(f.getName().getBytes("utf-8"), "ISO-8859-1");
		response.reset(); // 非常重要
		if (isOnline) { // 在线打开方式
			URL u = new URL("file:///" + filePath);
			response.setContentType(u.openConnection().getContentType());
			response.setHeader("Content-Disposition", "inline; filename=" + name);
			// 文件名应该编码成UTF-8
		} else { // 纯下载方式
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + name);
		}
		OutputStream out = response.getOutputStream();
		while ((len = br.read(buf)) > 0)
			out.write(buf, 0, len);
		br.close();
		out.close();
	}
}
