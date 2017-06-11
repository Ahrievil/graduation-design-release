<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>项目管理系统 by www.eyingda.com</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tabfont01 {	
	font-family: "宋体";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}
.font051 {font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}
html { overflow-x: ; overflow-y: ; border:0;} 
</style>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">

</script>
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path %>/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#queren").click(function(){
		$("#fom").attr("action","role.do?op=deleteSecRole");
	});
});
$(document).ready(function(){
	$("#fanhui").click(function(){
		$("#fom").attr("action","fun.do?op=queryAllFunName");
	});
});
</script>
</head>
<body >
<form  name="fom" id="fom" method="post"  action="">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- borderColor="black" -->
<table border="1" align="center"  width="80%" cellspacing="0" cellpadding="0" >
  <tr>
    <td class="tablestyle_title" ></td>
     <td  class="tablestyle_title" colspan="2" >请选择要删除的角色
	</td>
  </tr>
  <c:forEach items="${requestScope.list}" var="i">
	<tr>
    	<td bgcolor="#EEEEEE" align="center"><input type="checkbox" name="roid" value = "${i.roid }" id="qx1" /></td>
    	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;${i.roname}</td>
    	<td bgcolor="#FFFFFF"> 备注：&nbsp;&nbsp;${i.other}</td>
  	</tr> 
	 </c:forEach>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit"  class="right-button08" id="queren"  value="确认" />
	<input type="submit" class="right-button08" id="fanhui"  value="返回">
    <input type="reset" class="right-button08"   value="重置" />
</form>
</body>
</html>
