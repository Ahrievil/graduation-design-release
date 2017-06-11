package com.ty.xmoa.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcTemplate {

	private Connection conn;
	private PreparedStatement stemt;
	private ResultSet rs;

	public void update(String sql, Object[] values) {
		try {
			conn = Pools.getConnWithWait();
			stemt = conn.prepareStatement(sql);
			for (int i = 1; i <= values.length; i++) {
				stemt.setObject(i, values[i - 1]);
			}
			stemt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stemt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 查询单条
	public Object queryone(String sql, Object[] values, Mapper mapper) {
		Object object = null;
		try {
			conn = Pools.getConnWithWait();
			stemt = conn.prepareStatement(sql);
			for (int i = 0; i < values.length; i++) {
				stemt.setObject(i + 1, values[i]);
			}
			rs = stemt.executeQuery();
			if (rs.next()) {
				object = mapper.map(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stemt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return object;
	}

	// 查询全部
	public List<Object> queryAll(String sql, Object[] values, Mapper mapper) {
		List<Object> list = new ArrayList<Object>();
		try {
			conn = Pools.getConnWithWait();
			stemt = conn.prepareStatement(sql);
			for (int i = 0; i < values.length; i++) {
				stemt.setObject(i + 1, values[i]);
			}
			rs = stemt.executeQuery();
			while (rs.next()) {
				Object obj = mapper.map(rs);
				list.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stemt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
