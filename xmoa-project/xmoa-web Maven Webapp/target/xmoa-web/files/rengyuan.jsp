<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>项目管理系统 by www.eyingda.com</title>
		<link rel="stylesheet" rev="stylesheet"
			href="<%=path %>/css/style.css" type="text/css" media="all" />


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
		<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>
<script type="text/javascript" src="<%=path %>/jquery.js"></script>
<script type="text/javascript">
	function pnoo(obj){
		var a=obj.value;
		//alert(a);
		if(a.length==0){
			document.getElementById("pnodiv").innerHTML="<font color='red'>员工编号不能为空！</font>";
		}else if(a.length<5){
			document.getElementById("pnodiv").innerHTML="<font color='red'>员工编号长度过短！</font>";
		}else if(a.length>10){
			document.getElementById("pnodiv").innerHTML="<font color='red'>员工编号长度过长！</font>";
		}else{
			var activeX = false;
			activeX = new ActiveXObject("Microsoft.XMLHTTP");
			activeX.open("post","<%=basePath %>servlet/PersonInfoServlet?methodName=isperson&pnoo="+a,true);
	 		//回调函数
			activeX.onreadystatechange=function (){
				if (activeX.readyState == 4){
					var zx=activeX.responseText;
						if(zx=='false'){
							document.getElementById("pnodiv").innerHTML="<font color='green'>可以使用这个员工编号</font>";
						}else{
							document.getElementById("pnodiv").innerHTML="<font color='red'>此员工编号已存在</font>";
						}
					}
			}
			activeX.send();
	}
}
function zx(){
	var s=document.getElementById("pdescription").value;
	var i=300-s.length;
	if(s.length<=300){
		$("#sy").attr("color","blue");
		document.getElementById("sy").innerHTML="剩余("+i+")字";
	}else{
		$("#sy").attr("color","red");
		document.getElementById("sy").innerHTML="字数超出限制";
	}
}
function baocun(){
	var pno=$("#pno").val();
	var password=$("#password").val();
	var pname=$("#pname").val();
	var psex=$("#psex").val();
	var page=$("#page").val();
	var upost=$("#upost").val();
	var pbirthday=$("#pbirthday").val();
	var a=pbirthday.split("-");
	var pid=$("#pid").val();
	var plei=$("#plei").val();
	var urole=$("#urole").val();
	var pfsalary=$("#pfsalary").val();
	var pgsalary=$("#pgsalary").val();
	var posalary=$("#posalary").val();
	var pbydate=$("#pbydate").val();
	var b=pbydate.split("-");
	var pemail=$("#pemail").val();
	var ptelephone=$("#ptelephone").val();
	var paddr=$("#paddr").val();
	var pbankName=$("#pbankName").val();
	var pbankuser=$("#pbankuser").val();
	var pdescription=$("#pdescription").val();
	if(password==""){
		alert("密码不能为空！");
	}else if(password.length<5||password.length>10){
		alert("密码长度不符合要求（应为5-10位）");
	}else if(pname==""){
		alert("真实姓名不能为空！");
	}else if(!/^[1-9][0-9]*$/.test(pname)==false){
		alert("真实姓名格式不能为数字！");
	}else if(pname.length>10){
		alert("真实姓名长度过长！");
	}else if(psex=="2"){
		alert("性别不能为空！");
	}else if(page==""){
		alert("年龄不能为空！");
	}else if(!/^[1-9][0-9]*$/.test(page)==true){
		alert("年龄位置请输入数字！");
	}else if(page.length>3){
		alert("年龄长度过长！");
	}else if(upost==""){
		alert("职务不能为空");
	}else if(pbirthday==""){
		alert("出生日期不能为空");
	}else if(a.length!=3||a[0].length!=4||a[1].length!=2||a[2].length!=2){
		alert("日期格式不对，应为yyyy-mm-dd");
	}else if(pbirthday.length>10){
		alert("出生日期长度过长！");
	}else if(pid==""){
		alert("身份证号码不能为空");
	}else if(pid.length>20){
		alert("身份证号码长度过长");
	}else if(plei=="2"){
		alert("员工类型不能为空");
	}else if(urole==""){
		alert("角色名称不能为空");
	}else if(pfsalary==""){
		alert("基本工资不能为空");
	}else if(!/^[1-9][0-9]*$/.test(pfsalary)==true){
		alert("基本工资位置请输入数字！");
	}else if(pfsalary.length>10){
		alert("基本工资长度过长！");
	}else if(pgsalary==""){
		alert("奖金不能为空");
	}else if(!/^[1-9][0-9]*$/.test(pgsalary)==true){
		alert("奖金位置请输入数字！");
	}else if(pgsalary.length>10){
		alert("奖金长度过长！");
	}else if(posalary==""){
		alert("其他补助金不能为空");
	}else if(!/^[1-9][0-9]*$/.test(posalary)==true){
		alert("其他补助金位置请输入数字！");
	}else if(posalary.length>10){
		alert("其他补助金长度过长！");
	}else if(pbydate==""){
		alert("出生日期不能为空");
	}else if(b.length!=3||b[0].length!=4||a[1].length!=2||b[2].length!=2){
		alert("日期格式不对，应为yyyy-mm-dd");
	}else if(pemail.length>30){
		alert("电子邮箱长度过长！");
	}else if(ptelephone.length>15){
		alert("电话号码长度过长！");
	}else if(paddr.length>30){
		alert("居住地址长度过长！");
	}else if(pbankName.length>20){
		alert("银行名称长度过长！");
	}else if(pbankuser.length>30){
		alert("银行账户长度过长！");
	}else if(pdescription.length>300){
		alert("描述长度过长！");
	}else{
		var path="user.do?op=addPersonInfo";
		$("#form").attr("action",path);
		$("#form").submit();
	}
}
	
</script>
</head>

	<body class="ContentBody">

		<form  method="post" name="form"  id="form">
		<input type="hidden" value="${sessionScope.token}" name="token">
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
										 		style=" width:100%">
												<tr>
													<td width="16%" align="right" nowrap="nowrap"> 
														员工编号: 
													</td>
													<td width="34%">
														<input type="text" id="pno" name="pno" disabled="disabled" style="width: 154px" value="">
													</td>
													<td width="16%" align="right" nowrap="nowrap">
														密码:
													</td>
													<td width="34%">
														<input type="password" id="password" name='ppassword' style="width: 154px"
															value=""><font color="red">*(5-10位)</font>
													</td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">
														真实姓名:
													</td>
													<td>
														<input class="text" name='pname' id="pname"
															style="width: 154px" value="" /><font color="red">*</font>
													</td>
													<td align="right">
														性别:
													</td>
													<td>
														<select name="psex" id="psex">
														<option value="">==请选择==</option>
															<option value="男">
																男
															</option>
															<option value="女">
																女
															</option>
														</select><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">年龄:</td>
													<td>
														<input class="text" name='page' id="page"
															style="width: 154px" value="" /><font color="red">*（必须为数字）</font>
													</td>
													<td align="right">
														职位:
													</td>
													
													<td>
														<select id = "sess" name = "upost" onclick="flupost()">
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
																if (xmlHttp.readyState == 4) {
																	var json = eval(xmlHttp.responseText);
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
														<font color="red">*</font>
													</td>
													
												</tr>
												<tr>
													<td align="right">
														出生日期:
													</td>
													<td>
														<input class="text" name='pbirthday' id="pbirthday"
															style="width: 154px" value="" /><font color="red">*（格式：yyyy-mm-dd）</font>
													</td>
													<td align="right">
														身份证号码:
													</td>
													<td>
														<input class="text" name='pid' id="pid"
															style="width: 154px" value="" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														电子邮箱:
													</td>
													<td>
														<input class="text" name='pemail' id="pemail"
															style="width: 154px" value="" />
													</td>
													<td align="right">
														电话号码:
													</td>
													<td>
														<input class="text" name='ptelephone' id="ptelephone"
															style="width: 154px" value="" />
													</td>
												</tr>
												<tr>
													<td align="right">
														居住地址:
													</td>
													<td>
														<input class="text" name='paddr' style="width: 154px" id="paddr" value="" />
													</td>
													<td align="right">
														员工类型:
													</td>
													<td>
														<select name="plei" id="plei">
															<option value="" >
																==请选择==
															</option>
															<option value="实习">
																实习
															</option>
															<option value="在职">
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
															style="width: 154px" value="" />
													</td>
													<td align="right"> 
														角色名称:&nbsp; 
													</td>
													<td>
														<select id = "rolesec" name = "urole" onclick="flurole()">
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
														<input class="text" name='pbankuser'  id="pbankuser"
															style="width: 154px" value="" />
													</td>
													<td align="right">
														基本工资:
													</td>
													<td>
														<input class="text" name='pfsalary' id="pfsalary" 
															style="width: 154px" value="" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														奖金:
													</td>
													<td>
														<input class="text" name='pgsalary' id="pgsalary" 
															style="width: 154px" value="" /><font color="red">*</font>
													</td>
													<td align="right">
														其它补助金:
													</td>
													<td>
														<input class="text" name='posalary' id="posalary"
															style="width: 154px" value="" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														入职时间:
													</td>
													<td>
														<input class="text" name='pbydate' id="pbydate"
															style="width: 154px" value="" /><font color="red">*（格式：yyyy-mm-dd）</font>
													</td>
													
												</tr>
												<tr>
													<td align="right">
														描述:
													</td>
													<td colspan="3">
														<textarea name="pdescription" cols="100" rows="8" id="pdescription" onkeyup="zx();"></textarea><font size="2px" id="sy" color="blue">剩余(300)字</font>
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
						
							<input type="button"  value="保存" onclick="baocun();" class="button"/>

							<input type="button" name="Submit2" value="返回" class="button"
								onclick="window.history.go(-1);" />
						</TD>
					</TR>
				</TABLE>
			</div>
		</form>
	</body>
</html>
