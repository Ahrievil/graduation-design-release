package com.ty.xmoa.service;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.dao.PostDao;
import com.ty.xmoa.model.OaPost;
import com.ty.xmoa.util.PageUtil;

public class PostService {

	private PageUtil pu = new PageUtil();
	private PostDao pd = new PostDao();

	public List<String> queryAllName() {
		List<OaPost> post = pd.loadAll();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < post.size(); i++) {
			list.add(post.get(i).getName());
		}
		return list;
	}

	// public List<OaPost> loadAll(){
	// return pd.loadAll();
	// }
	public PageUtil queryByPage(int page) {
		return pu.queryByPage(page, pd);
	}

	public void deleteById(int poid) {
		int k = pd.deleteById(poid);
		System.out.println("删除一条post+" + k);
	}

	public int insertOne(int poid, String name, String other) {
		int k = pd.insertOne(poid, name, other);
		System.out.println("插入post数据更新+" + k);
		return k;
	}

	public OaPost load(int poid) {
		return pd.load(poid);
	}

	public String updateById(int poid, String name, String other) {
		int k = pd.updateById(poid, name, other);
		String result = "更新数据失败，请更换职务名称";
		if (k == 1) {
			result = "更新了" + k + "条数据";
		}
		return result;
	}
}
