package com.ty.xmoa.util;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class Pools {

	private static List<T5CConnection> list = new ArrayList<T5CConnection>();

	static {
		for (int i = 0; i < 5; i++) {
			T5CConnection conn = new T5CConnection();
			list.add(conn);
		}
	}

	private static synchronized Connection getConn() {
		T5CConnection conn = null;
		for (T5CConnection pl : list) {
			if (!pl.isIsused()) {
				conn = pl;
				conn.setIsused(true);
				break;
			}
		}
		return conn;
	}

	public static Connection getConnWithWait() {
		Connection conn = Pools.getConn();
		int count = 0;
		while (conn == null) {
			conn = Pools.getConn();
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			count++;
			if (count >= 60) {
				throw new MyException("连接超时");
			}
		}

		return conn;
	}
}
