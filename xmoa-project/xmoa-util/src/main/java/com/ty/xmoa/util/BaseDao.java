package com.ty.xmoa.util;

import java.util.List;

public abstract class BaseDao {

	public jdbcTemplete jt = new jdbcTemplete();

	public abstract List<Object> queryAllByPage(int beginIndex, int endIndex);

	// String sql = "select * from (select rownum as num,z.* from (select * from
	// "+tableName+" order by "+zhujian+" desc) z) where num between ? and ?";
	public abstract int queryCount();
}
