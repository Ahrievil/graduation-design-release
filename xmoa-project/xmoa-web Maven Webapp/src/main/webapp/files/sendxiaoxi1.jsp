<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by www.eyingda.com</title>
<link rel="stylesheet" rev="stylesheet" href="<%=path %>/css/style.css" type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">
function tishi()
{
  var a=confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
  if(a!=true)return false;
  window.open("冲突页.htm","","depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}

function check()
{
document.getElementById("aa").style.display="";
}

</script>
<script type="text/javascript" src="<%=basePath%>jquery.js"></script>
	
<script type="text/javascript">
	function xuan(){
		$(document).ready(function (){
			//如果点击与上一次相同的人，则取消
				$("#name3").val($("#name1").val());
				$("#namesb").val($("#name1").val());
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
<script language="JavaScript" type="text/javascript">
  var s = '${requestScope.s}';
  if(s !=""){
  	 var s = '${requestScope.s}';
     alert(s);
  }
 
</script>
  
  <form action="mess.do?op=sendMess" method="post"  name="form" id='form'>
  <input type="hidden" value="${sessionScope.check}" name="refresh">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >新建信息</th>
  </tr>
  <tr>
    
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>新建信息</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					    
					    
					  <tr>
					    <td nowrap align="right" width="11%">消息标题:</td>
					    <td width="27%"><input name='biaoti' type="text" class="text" style="width:154px" value="" id='divid'/>
					     <span class="red"> *</span>
					    <div style="position:absolute;color:red" id='bid'></div>
					    </td>
				        	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>
					  <tr>
                               <td width="11%" align="right" nowrap>接收者:</td>
									    <td colspan="3">
									    
									    <input type='text' name='name3' id='name3' class='text' style="width:154px;height:20px;left=150" disabled='disabled'>
									    <input type='hidden' name='namesb' id='namesb' class='text' style="width:154px;height:20px;left=150" >
										<span class="red"> *</span>
									    <div style="position:absolute;color:red" id='nid'></div>
									          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										      </td>
					   </tr>	
					  
					  <tr>
					    <td  width="11%" nowrap align="right">信息内容:</td>
					    <td colspan="2"><textarea name="textarea" cols="100" rows="20" id='textarea'></textarea>
					    	
					    </td>
					    <td><table>
					    		<tr>
					    			<td>请选择接收者：</td>
					    		</tr>
					    			<tr>
					    				<td>
					    					<select multiple="multiple"
					    						size="18" name="name1" id='name1' onmouseover="flupost()"
					    						onchange='xuan()' style='width:174px;left:0px'>
					    					</select>
					    				</td>
					    				<script type="text/javascript">
														function flupost(){
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
															xmlHttp.open("get", "user.do?op=queryUserInfoauto&v=" + Math.random(),
																	true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4) {
																	var json = eval(xmlHttp.responseText);
																	var x = document.getElementById("name1");
																	for (var i = 0; i < json.length; i++) {
																		if(x.length<json.length){
																		var y=document.createElement('option');
												  						for(var key in json[i]){
													  						if(key=='uname'){
																				if (json[i] == '${currentuser.uname}') {
																					y.selected = "selected";
																				}else{
																					y.text=json[i][key];
																				}
													  							
													  						}
												  						}
																		try{
																	    	x.add(y,null); // standards compliant
																	    }catch(ex){
																	    	x.add(y); // IE only
																	    }
																		}
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>
										
					    		</tr></table></td>
					    
									   
					    </tr>
					  </table>
			  <br />
				</fieldset>			</TD>
		</TR>
		</TABLE>
	<table>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="submit" value="发送" class="button" id='fid1'/>　
			 
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</table>

</div>
</form>
</body>
</html>
