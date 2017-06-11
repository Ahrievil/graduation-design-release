package com.ty.xmoa.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class jdbcTemplete {

	private Connection conn;
	private PreparedStatement pstamt;
	private ResultSet rs;

	public int update(String sql, Object... args) {
		conn = Pools.getConnWithWait();
		int k = 0;
		try {
			pstamt = conn.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				pstamt.setObject(i + 1, args[i]);
			}
			k = pstamt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstamt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return k;
	}

	public int queryCount(String sql) {
		conn = Pools.getConnWithWait();
		int count = 0;
		try {
			pstamt = conn.prepareStatement(sql);
			rs = pstamt.executeQuery();
			while (rs.next()) {
				count = rs.getInt("cou");
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
				pstamt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	public List<Object> findObject(String sql, Class<?> clazz, Object... args) {
		System.out.println(sql);
		for (int i = 0; i < args.length; i++) {
			System.out.println(args[i]);
		}
		List<Object> list = new ArrayList<Object>();
		conn = Pools.getConnWithWait();
		try {
			pstamt = conn.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				pstamt.setObject(i + 1, args[i]);
			}
			rs = pstamt.executeQuery();
			while (rs.next()) {
				Object obj = clazz.newInstance();
				Field[] fs = clazz.getDeclaredFields();
				for (Field f : fs) {
					String sset = "set" + Character.toUpperCase(f.getName().charAt(0)) + f.getName().substring(1);
					if (f.getType().getName().equals("int")) {
						Method method = clazz.getDeclaredMethod(sset, int.class);
						method.invoke(obj, rs.getInt(f.getName()));
					} else if (f.getType().getName().equals("java.lang.String")) {
						Method method = clazz.getDeclaredMethod(sset, java.lang.String.class);
						method.invoke(obj, rs.getString(f.getName()));
					} else if (f.getType().getName().equals("java.sql.Date")) {
						Method method = clazz.getDeclaredMethod(sset, Date.class);
						method.invoke(obj, rs.getDate(f.getName()));
					} else if (f.getType().getName().equals("double")) {
						Method method = clazz.getDeclaredMethod(sset, double.class);
						method.invoke(obj, rs.getDouble(f.getName()));
					} else if (f.getType().getName().equals("long")) {
						Method method = clazz.getDeclaredMethod(sset, long.class);
						method.invoke(obj, rs.getLong(f.getName()));
					} else if (f.getType().getName().equals("float")) {
						Method method = clazz.getDeclaredMethod(sset, float.class);
						method.invoke(obj, rs.getFloat(f.getName()));
					}
				}
				list.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstamt.close();
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
