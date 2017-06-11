<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType='text/html;charset=utf-8'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>files/">

		<title>My JSP 'yuangong.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>项目管理系统 by www.eyingda.com</title>
		<link rel="stylesheet" rev="stylesheet"
			href="<%=path %>/css/style.css" type="text/css" media="all" />


		<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>
</head>

	<body class="ContentBody">
	
		<form  method="post" name="form" action="user.do?op=updateAllInfock">
			<div class="MainDiv">
				<table width="99%" border="0" cellpadding="0" cellspacing="0"
					class="CContent">
					<tr>
						<th class="tablestyle_title">
							员工基本信息录入<font size="2px" color="red">（*为必填内容）</font>
						</th>
					</tr>
					<tr>
						<td class="CPanel">
							<table border="0" cellpadding="0" cellspacing="0"
								style="width: 100%">
								<tr>
									<td align="left">
										<br/>
									</td>
								</tr>
								<TR>
									<TD width="100%">
										<fieldset style="height: 100%;">
											<legend>
												员工信息
											</legend>
											<table border="0" cellpadding="2" cellspacing="1"
												style="width: 100%">
												
												<tr>
													<td width="16%" align="right" nowrap="nowrap"> 
														员工编号: 
													</td>
													<td width="34%">
														<input type="hidden" name="pno" value="${userInfo.usid}">
														<input class="text"  style="width: 154px"
															value="${userInfo.usid}"  disabled="disabled"/>
													</td>
													<td width="16%" align="right" nowrap="nowrap">
														密码:
													</td>
													<td width="34%">
														<input type="password" name='ppassword' id="ppassword" style="width: 154px"
															value="${userInfo.upwd}"><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">
														真实姓名:
													</td>
													<td>
													<input type="hidden" name="pname" value="${userInfo.uname}">
														<input class="text" 
															style="width: 154px" value="${userInfo.uname}" disabled="disabled" />
													</td>
													<td align="right">
														性别:
													</td>
													<td>
														<select name="psex" >
															<option selected="selected">
																==请选择==
															</option>
															<option value="男" <c:if test="${userInfo.usex=='男'}">selected="selected"</c:if>>
																男
															</option>
															<option value="女" <c:if test="${userInfo.usex=='女'}">selected="selected"</c:if>>
																女
															</option>
														</select>
													</td>
												</tr>
												<tr>
													<td align="right">年龄:</td>
													<td>
														<input class="text" name='page' id="page"
															style="width: 154px" value="${userInfo.uage}" /><font color="red">*</font>
													</td>
													<td align="right" style="width: 154px">
														职位:
													</td>
													<td id = "d1" >
													<select id = "sess" name = "upost" onmouseover="flupost()">
														<option value = "">==请选择==</option>
													</select>
														<script>
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
															xmlHttp.open("get", "post.do?op=getAllPostName&v=" + Math.random(),
																	true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	var x = document.getElementById("sess");
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
																		if (json[i] == '${userInfo.upost}') {
																			y.selected = "selected";
																		}
																		}
												
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>								
													</td>
												</tr>
												<tr>
													<td align="right">
														出生日期:
													</td>
													<td>
													<input type="hidden" name="pbirthday" value="${userInfo.ubirthdate}">
														<input class="text" 
															style="width: 154px" value="${userInfo.ubirthdate}" disabled="disabled" />
													</td>
													<td align="right">
														身份证号码:
													</td>
													<td>
													<input type="hidden" name="pid" value="${userInfo.uidNum}">
														<input class="text" 
															style="width: 154px" value="${userInfo.uidNum}"  disabled="disabled"/>
													</td>
												</tr>
												<tr>
													<td align="right">
														电子邮箱:
													</td>
													<td>
														<input class="text" name='pemail' id="pemail"
															style="width: 154px" value="${userInfo.uemail}" />
													</td>
													<td align="right">
														电话号码:
													</td>
													<td>
														<input class="text" name='ptelephone' id="ptelephone"
															style="width: 154px" value="${userInfo.utell}" />
													</td>
												</tr>
												<tr>
													<td align="right">
														居住地址:
													</td>
													<td>
														<input class="text" name='paddr' id="paddr" style="width: 154px" value="${userInfo.uadd}" />
													</td>
													<td align="right">
														员工类型:
													</td>
													<td>
														<select name="plei" id="plei">
															<option >
																==请选择==
															</option>
															<option value="实习" <c:if test="${userInfo.ustatus=='实习'}">selected="selected"</c:if>>
																实习
															</option>
															<option value="在职" <c:if test="${userInfo.ustatus=='在职'}">selected="selected"</c:if>>
																在职
															</option>
														</select><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														银行名称:
													</td>
													<td>
														<input class="text" name='pbankName' id="pbankName"
															style="width: 154px" value="${userInfo.ubankName}" />
													</td>
													<td align="right"> 
														角色名称:&nbsp; 
													</td>
													<td id = "hh" >
													<select id = "rolesec" name = "urole" onmouseover="flurole()">
														<option value = "">==请选择==</option>
														</select>
													<script>
														function flurole(){
															
														
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
															xmlHttp.open("get", "role.do?op=queryAllRoleName&v=" + Math.random(),
																	true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4) {
																	var json = eval(xmlHttp.responseText);
																	var x = document.getElementById("rolesec");
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
																		if (json[i] == '${userInfo.urole}') {
																			y.selected = "selected";
																		}
																		}
												
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>			
													<font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														银行账户:
													</td>
													<td>
														<input class="text" name='pbankuser' id="pbankuser"
															style="width: 154px" value="${userInfo.ubankAcc}" />
													</td>
													<td align="right">
														基本工资:
													</td>
													<td>
														<input class="text" name='pfsalary' id="pfsalary"
															style="width: 154px" value="${userInfo.upay}" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														奖金:
													</td>
													<td>
														<input class="text" name='pgsalary' id="pgsalary"
															style="width: 154px" value="${userInfo.ureward}" /><font color="red">*</font>
													</td>
													<td align="right">
														其它补助金:
													</td>
													<td>
														<input class="text" name='posalary' id="posalary"
															style="width: 154px" value="${userInfo.upaje}" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														入职时间:
													</td>
													<td>
													<input type="hidden" name="pbydate" value="${userInfo.uhiredate}">
														<input class="text" 
															style="width: 154px" value="${userInfo.uhiredate}" disabled="disabled" />
													</td>
													
												</tr>
												<tr>
													<td align="right">
														描述:
													</td>
													<td colspan="3">
														<textarea name="pdescription" id="pdescription" cols="100" rows="8">${userInfo.uother}</textarea>
													</td>
												</tr>
											</table>
											<br />
										</fieldset>
									</TD>

								</TR>
							</TABLE>
						</td>
					</tr>
					<TR>
						<TD colspan="2" align="center" height="50px">
							<input type="submit"  value="保存" onclick="" class="button"/>

							<input type="button" name="Submit2" value="返回" class="button"
								onclick="window.history.go(-1);" />
						</TD>
					</TR>
				</TABLE>
			</div>
		</form>
	</body>
</html>
