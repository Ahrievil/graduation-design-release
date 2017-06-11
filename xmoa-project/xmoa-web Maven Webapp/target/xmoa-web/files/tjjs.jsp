<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
<link rel="StyleSheet" href="<%=path%>/css/dtree.css" type="text/css" />
<script src="<%=path %>/js/dtree.js" type="text/javascript"></script>
<script type="text/JavaScript">

</script>

<script type="text/javascript"> 
var powerId = new dTree('powerId');
var root = 0;
var powerCode = false;
var check = false;
powerId.add(root,-1,'管理权限','');
function checkNode(nodeId){
	powerId.checkNode(nodeId);
}
</script>
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path %>/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#allselect").click(function(){
			 $(":checkbox").attr("checked","checked");
		});
		$("#fanselect").click(function(){
			var size=$(":checkbox").length;
			for(var i=0;i<size;i++){
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					$(":checkbox:eq("+i+")").removeAttr("checked");
				}else{
					$(":checkbox:eq("+i+")").attr("checked","checked");
				}
			}
		});
});
$(document).ready(function(){
	$("#fanhui").click(function(){
		$("#fom").attr("action","<%=basePath%>servlet/quanxianServlet?methodName=shouye");
	});
});
function queren11(){
	var juename=$("#juename").val();
	var juebeizhu=$("#juebeizhu").val();
	if(juename.length==0){
		alert("角色名称不能为空！");
	}else if(juename.length>20){
		alert("角色名称长度过长！");
	}else if(juebeizhu.length>300){
		alert("备注长度过长！");
	}else{
		$("#fom").attr("action","fun.do?op=insertFun");
		$("#fom").submit();
	}
}
function zx(){
	var s=document.getElementById("juebeizhu").value;
	var i=300-s.length;
	if(s.length<=300){
		$("#sy").attr("color","black");
		document.getElementById("sy").innerHTML="剩余("+i+")字";
	}else{
		$("#sy").attr("color","red");
		document.getElementById("sy").innerHTML="字数超出限制";
	}
}
</script>
</head>
<body >
<form  name="fom" id="fom" method="post" >
<input type="hidden" value="${sessionScope.check}" name="refresh">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- borderColor="black" -->
<table border="1" align="center"  width="90%" cellspacing="0" cellpadding="0" >
  <tr>
    <td class="tablestyle_title" width="10%" ><a href="#"
	class="right-font08" id="allselect"><font color="white">全选</font></a>-<a
	href="#" class="right-font08" id="fanselect"><font color="white">反选</font></a></td>
     <td  class="tablestyle_title">请输入角色名称并添加权限：
   		<input type="text" name="juename" id="juename">
   		备注：<input type="text" name="juebeizhu" id="juebeizhu" value="" onkeyup="zx();">
   		<font size="2px" id="sy" color="black">剩余(300)字</font>
	</td>
  </tr>
  	<tr>
			<td colspan="2" align="left" >
			<c:forEach items = "${requestScope.list }" var = "fun1">
                <script>
				  check = true;
					powerId.add('${fun1.fid}',${fun1.pid},'${fun1.fname}',check,'${fun1.fid}','fids');
				  </script>
              </c:forEach>
              <script type = "text/javascript">
              	document.write(powerId);
              	powerId.openAll();
              </script>
              </td>
              </tr>
	
</table>
<div align="center">
	<input type="button"  class="right-button08" id="queren"  value="确认" onclick="queren11();" />
	<input type="submit" class="right-button08" id="" onclick="window.history.go(-1);" value="返回">
    <input type="reset" class="right-button08"   value="重置" /></div>
</form>
</body>
</html>
