package com.ty.xmoa.dao;

import java.util.List;

import com.ty.xmoa.model.OaFile;
import com.ty.xmoa.util.BaseDao;
import com.ty.xmoa.util.jdbcTemplete;

public class FileDao extends BaseDao {

	private jdbcTemplete jt = new jdbcTemplete();

	@Override
	public List<Object> queryAllByPage(int beginIndex, int endIndex) {
		String sql = "select * from (select rownum as num,z.* from (select * from oa_file order by flid desc) z) where num between ? and ?";
		List<Object> list = jt.findObject(sql, OaFile.class, beginIndex, endIndex);
		return list;
	}

	@Override
	public int queryCount() {
		String sql = "select nvl(count(flid),0) as cou from oa_file";
		return jt.queryCount(sql);
	}

	public OaFile load(int flid) {
		String sql = "select * from oa_file where flid = ?";
		List<Object> list = jt.findObject(sql, OaFile.class, flid);
		return list.size() == 1 ? (OaFile) list.get(0) : null;
	}

	public int insert(OaFile file) {
		String sql = "insert into oa_file(flid,flName,flSize,flType,prName,flupdate,fluper) values((select nvl(max(flid),0)+1 from oa_file),?,?,?,?,to_date(?,'yyyy-MM-dd'),?)";
		return jt.update(sql, file.getFlName(), file.getFlSize(), file.getFlType(), file.getPrName(),
				file.getFlupdate(), file.getFluper());
	}

	public int delete(int id) {
		String sql = "delete from oa_file where flid = ?";
		return jt.update(sql, id);
	}
}
