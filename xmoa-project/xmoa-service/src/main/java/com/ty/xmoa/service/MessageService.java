package com.ty.xmoa.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.ty.xmoa.dao.MessageDao;
import com.ty.xmoa.model.OaMessage;
import com.ty.xmoa.util.PageUtil;

public class MessageService {

	public MessageDao md = new MessageDao();
	private PageUtil pu = new PageUtil();
	public PageUtil queryByPage(int page){
		return pu.queryByPage(page, md);
	}
	public int insert(OaMessage mess){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String sendTime = sdf.format(date);
		mess.setSendtime(sendTime);
		return md.insert(mess);
	}
	public int deleteById(int mid){
		return md.deleteById(mid);
	}
	public OaMessage load(int mid){
		OaMessage message = md.load(mid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String taketime = sdf.format(date);
		message.setTaketime(taketime);
		md.updatetaketime(message);
		return message;
	}
	
}
