<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
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
	var index=0;
	$(document).ready(function (){
		$("#save").click(function(){
		    var  r=confirm("是否确认保存");
		    var title=$("#title").val();
		    var proname=$("#proname").val();
		    var ms=$("#ms");
		    if(r==true){
		    	if(index==0&&proname!='0'&&ms!=""){
		    		
// 			 	 	alert("进来了");
		    		 $("#fom").attr("action","req.do?op=addReq&flag=showxuqiu");
	                 $("#fom").submit();
		    	}else{
		    		alert("数据信息不完整，请修改！");
		    	}
			 	
			}else{
			 return false;
			}
		});
		
	});
	
	function panduan(num){
		$(document).ready(function(){
			 var title=$("#title").val();
		     var proname=$("#proname").val();
		     var ms=$("#ms");
			if(num=='1'){
				if(title.length>10){
					if($("#name").html()!=""){
						index++;
					}
					$("#name").html(" 标题名称最长为10，请重新输入！");
				}else if(title.length==""){
					if($("#name").html()!=""){
						index++;
					}
					$("#name").html("标题不能为空 ");
				}else{
					if(index>0&&$("#name").html()!=""){
 							index--;
 					}
 					$("#name").html("");
				}
			}else if(num=='2'){
				if(ms.length>300){
					if($("#nr").html()!=""){
						index++;
					}
					$("#nr").html("内容过长 ");
				}else{
					if(index>0&&$("#nr").html()!=""){
 							index--;
 					}
 					$("#nr").html("");
				}
			}else if(num=='3'){
				if(proname=='0'){
					if($("#pname").html()!=""){
						index++;
					}
					 $("#pname").html("项目名称不能为空");
				}else{
					if(index>0&&$("#pname").html()!=""){
 							index--;
 					}
 					$("#pname").html("");
				}
			}
		});
	}
</script>



<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody">
  <form  method="post" id="fom" name="fom" action="" target="mainFrame" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >添加需求<font color="red" size="2px">*为必填项</font></th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
			<input type="hidden" value="${sessionScope.check}" name="token">
		</td></tr>
       
		<tr align="center">
          <td class="TablePanel"><select id="proname" name="proname" onmouseover="flupro()" onchange="panduan('3')">
           <option value="0">==请选择==</option>
           <script>
														function flupro(){
															
														
															var xmlHttp;
															try {
																// Firefox, Opera 8.0+, Safari
																xmlHttp = new XMLHttpRequest();
															} catch (e) {
																// Internet Explorer
																try {
																	xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
																} catch (e) {
																	try {
																		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
																	} catch (e) {
																		alert("您的浏览器不支持AJAX！");
																	}
																}
															}
															xmlHttp.open("get", "pro.do?op=loadAllName&v=" + Math.random(),
																	true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	var x = document.getElementById("proname");
																	for (var i = 0; i < json.length; i++) {
																		if(x.length<json.length+1){
																		var y=document.createElement('option');
												  						y.text=json[i];
																		try
																	    {
																	    x.add(y,null); // standards compliant
																	    }
																	  catch(ex)
																	    {
																	    x.add(y); // IE only
																	    }
																		}
												
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>					
          </select>
          <font color="red">*</font><div ><font id="pname" color="red"></font></div></td>
		  </tr>
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加需求</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
						  <tr>
						    <td width="15%" align="right">需求标题:</td>
						    <td width="35%"><input type="text" id="title" name="title" onchange="panduan('1')"/><span class="red">*</span><div><font id="name" color="red">&nbsp;</font></div></td>
						    <td width="35%"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
						  </tr>
						  <tr>
						    <td align="right">需求描述:</td>
						    <td colspan="3"><font color="gray">最多可输入300字符</font><br><textarea name="ms" id="ms" cols="100" rows="20" onchange="panduan('2')"></textarea><div><font id="nr" color="red">&nbsp;&nbsp;&nbsp;</font></div></td>
						    <td></td>
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
			<input type="button" name="Submit" value="保存" class="button" id="save"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		
		</TABLE>
	

</div>
</form>
</body>
</html>

