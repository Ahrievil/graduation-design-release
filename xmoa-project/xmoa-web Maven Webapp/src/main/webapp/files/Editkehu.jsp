<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>files/">
    
    <title>My JSP 'kehu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>项目管理系统 by www.eyingda.com</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<script>
	$(document).ready(function (){
		$("#save").click(function(){
		    var  r=confirm("是否确认保存");
		    if(r==true){
				var clientname=$("#clientname").val();
				var ctel=$("#ctel").val();
				var cper=$("#cper").val();
				var caddr=$("#caddr").val();
				var cbackground=$().val("#cbackground");
				if(clientname==""){
			     	 $("#name").html("公司名称不能为空");
					  return false;
		 		 }
		 		 if(clientname.length>10){
		 	  	 	   $("#name").html("公司名称最长为10");
		 	     	 return false;
		 		 }
		 		if(cper.length>10){
		 	 		   $("#per").html("联系人名称最长为10");
		 	 		   return false;
		 		 }
		 		 if(caddr.length>30){
		 		 		$("#addr").html("联系地址最长为30");
		 		 		return false;
		 		 }
		 		 if(!/^\d*[\d,-]\d*$/.test(ctel)){
				     	if(ctel!=""){
				     		$("#tel").html("电话输入错误");
				     		return  false;
				     	}
				     }
		 		 if(ctel.length>20){
		 		 		$("#tel").html("电话长度最多为20");
		 		 		return  false;
		 		 }
		 	 $("#fom").attr("action","cus.do?op=updateCus&cuid=${customer.cuid}");
			}else{
				return false;
			}
		});
		
	});
</script>
</head>
	
<body class="ContentBody" >
 
 <form action="" method="post" id="fom" target="mainFrame" >
  <input type="hidden" name="methodName" value="update">
  
<div class="MainDiv">

<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >客户基本信息录入</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
				<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>客户信息</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
	 
					 
					  <tr>
					    <td nowrap align="right" width="15%">公司名称:</td>
					    <td width="35%"><input name="clientname" id='clientname' class="text" style="width:154px" value="${customer.cuname }"  />
				        <span class="red">*</span> <div id="name"></div></td>
				       
					    <td width="16%" align="right" nowrap="nowrap">联系人:</td>
 				        <td width="34%"><input class="text" name="cper" id="cper"  style="width:154px" value="${customer.cuper }"/><div id="per"></div></td>
					  </tr>
					    
					    
					  <tr>
					    <td nowrap="nowrap" align="right">联系电话:</td>
					    <td><input class="text" name="ctel" id="ctel"  style="width:154px" value="${customer.cutell }"/><div id="tel"></div></td>
					    <td align="right">联系地址:</td>
					    <td><input class="text" name="caddr" id="caddr" style="width:154px" value="${customer.cuadd }"/><div id="addr"></div></td>
					  </tr>
					 
					  <tr>
					    <td align="right">公司背景:</td>
					    <td colspan="3"><textarea name="cbackground" cols="100"  rows="8">${customer.cubg}</textarea></td>
					    </tr>
					    
					  </table>
			  <br />
				</fieldset>	</TD>
			
		</TR>
		</TABLE>
	 </td>
  </tr>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="submit" name="Submit" value="保存" id='save' class="button" />　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</TABLE>

</div>
</form>
</body>
</html>
