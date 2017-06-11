package com.ty.xmoa.dao;

import java.util.ArrayList;
import java.util.List;

import com.ty.xmoa.model.OaCustomer;
import com.ty.xmoa.util.BaseDao;
import com.ty.xmoa.util.jdbcTemplete;

public class CustomerDao extends BaseDao {

	private jdbcTemplete jt = new jdbcTemplete();

	public List<OaCustomer> loadAll() {
		String sql = "select cu.* from oa_customer cu order by cuid asc";
		List<OaCustomer> list = new ArrayList(jt.findObject(sql, OaCustomer.class));
		return list;
	}

	@Override
	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = "select * from (select rownum as num,z.* from (select * from oa_customer order by cuid desc) z) where num between ? and ?";
		return jt.findObject(sql, OaCustomer.class, beginIndex, endIndex);
	}

	@Override
	public int queryCount() {
		String sql = "select nvl(count(*),0) as cou from oa_customer";
		return jt.queryCount(sql);
	}

	public int delectOneCus(int cuid) {
		String sql = "delete from oa_customer where cuid = ?";
		return jt.update(sql, cuid);
	}

	public int insertOne(OaCustomer customer) {
		String sql = "insert into oa_customer values(?,?,?,?,?,?,? )";
		int max = this.queryMax();
		return jt.update(sql, max + 1, customer.getCuname(), customer.getCutell(), customer.getCuadd(),
				customer.getCudate(), customer.getCubg(), customer.getCuper());
	}

	public int queryMax() {
		String sql = "select nvl(max(cuid),0) as cou from oa_customer";
		return jt.queryCount(sql);
	}

	public OaCustomer load(int cuid) {
		String sql = "select * from oa_customer where cuid = ?";
		List<Object> list = jt.findObject(sql, OaCustomer.class, cuid);
		return list.size() == 1 ? (OaCustomer) list.get(0) : null;
	}

	public int update(OaCustomer customer) {
		String sql = "update oa_customer set cuname=?,cutell=?,cuadd=?,cudate = ?,cubg=?,cuper=? where cuid=?";
		return jt.update(sql, customer.getCuname(), customer.getCutell(), customer.getCuadd(), customer.getCudate(),
				customer.getCubg(), customer.getCuper(), customer.getCuid());
	}

	// public static void main(String[] args) {
	// CustomerDao cd = new CustomerDao();
	// int i = cd.queryMax();
	// System.out.println(i);
	// }
}
