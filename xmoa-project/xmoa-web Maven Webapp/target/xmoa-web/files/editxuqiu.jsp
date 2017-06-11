<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by www.eyingda.com</title>
<link rel="stylesheet" rev="stylesheet" href="<%=path %>/css/style.css" type="text/css" media="all" />

<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<script language="JavaScript" type="text/javascript">

	$(document).ready(function (){
		$("#save").click(function(){
		    var  r=confirm("是否确认保存");
		    var title=$("#title").val();
		    //alert(r);
		    if(r==true){
				if(title==""){
				      $("#name").html("标题不能为空");
					  return false;
			 	 }
			 	 if(title.length>10){
			 	      $("#name").html("标题名称最长为10，请重新输入！");
			 	      return false;
			 	 }
			 	 $("#fom").attr("action","req.do?op=updateReq&reid=${req.reid}");
	             $("#fom").submit();
// 			 	 alert("进来了");
				}else{
					 return false;
					 
			}
		});
		
	});
</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody">
  <form  method="post" id="fom"  name="fom" action="">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >需求变更</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		</td></tr>

		
		
		<tr align="center">
          <td class="TablePanel">所属项目：${req.prname}</td>
		  </tr>
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>需求变更</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td width="15%" align="right" valign=''>需求标题:</td>
					    <td width="35%"><input type="text" name="title" id="title" value="${req.rname}"/><span class="red">*</span><br><div><font  id="name" color='red'>&nbsp;</font></div></td>
					    <td width="15%" align="right">&nbsp;</td>
					    <td width="35%">&nbsp;</td>
					  </tr>
					  <tr>
					    <td align="right">需求内容:</td>
					    <td colspan="3"><textarea name="neirong" cols="100" rows="20" >${req.reOther}</textarea></td>
					    </tr>
					  </table>
			  <br />
				</fieldset>			</TD>
		</TR>
		</TABLE>
	
	
	 </td>
  </tr>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="button" name="Submit" value="保存" class="button" id="save"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</TABLE>
	
	

</div>
</form>
</body>
</html>
