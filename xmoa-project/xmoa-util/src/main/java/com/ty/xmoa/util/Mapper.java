package com.ty.xmoa.util;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface Mapper {

	Object map(ResultSet rs) throws SQLException;
}
