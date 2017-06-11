package com.ty.xmoa.api.controller;

import java.io.*;

import javax.servlet.*;

import javax.servlet.http.*;

import java.awt.*;

import java.awt.image.*;

import javax.imageio.ImageIO;

public class CheckCodeServlet extends HttpServlet

{
	private static int WIDTH = 109;
	private static int HEIGHT = 40;

	public void doGet(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException

	{
		HttpSession session = request.getSession();
		response.setContentType("image/jpeg");// 响应头
		ServletOutputStream sos = response.getOutputStream();
		System.out.println("--------------->");
		// 设置浏览器不要缓存此图片
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		// 创建内存图象并获得其图形上下文
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();

		// 产生随机的认证码
		char[] rands = generateCheckCode();

		// 产生图像
		drawBackground(g);
		drawRands(g, rands);

		// 结束图像的绘制过程，完成图像
		g.dispose();

		// 将图像输出到客户端
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ImageIO.write(image, "JPEG", bos);
		byte[] buf = bos.toByteArray();
		response.setContentLength(buf.length);

		// 下面的语句也可写成：bos.writeTo(sos);
		sos.write(buf);
		bos.close();
		sos.close();

		// 将当前验证码存入到Session中
		session.setAttribute("check_code", new String(rands));

		// 直接使用下面的代码将有问题，Session对象必须在提交响应前获得

		// request.getSession().setAttribute("check_code",new String(rands));

	}

	private char[] generateCheckCode()

	{

		// 定义验证码的字符表
		String chars = "0123456789abcdefghijklmnopqrstuvwxyz";
		char[] rands = new char[4];
		for (int i = 0; i < 4; i++) {
			int rand = (int) (Math.random() * 36);
			rands[i] = chars.charAt(rand);
		}
		return rands;
	}

	private void drawRands(Graphics g, char[] rands) {
		g.setColor(Color.BLACK);
		g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 30));
		// 在不同的高度上输出验证码的每个字符
		g.drawString("" + rands[0], 11, 27);
		g.drawString("" + rands[1], 36, 25);
		g.drawString("" + rands[2], 61, 28);
		g.drawString("" + rands[3], 86, 26);
		System.out.println(rands);
	}

	private void drawBackground(Graphics g) {
		// 画背景
		g.setColor(new Color(0xDCDCDC));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		// 随机产生120个干扰点
		for (int i = 0; i < 120; i++) {
			int x = (int) (Math.random() * WIDTH);
			int y = (int) (Math.random() * HEIGHT);
			int red = (int) (Math.random() * 255);
			int green = (int) (Math.random() * 255);
			int blue = (int) (Math.random() * 255);
			g.setColor(new Color(red, green, blue));
			g.drawOval(x, y, 1, 0);
		}
	}
}
