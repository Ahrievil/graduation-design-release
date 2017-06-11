<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

		<title>My JSP 'zhiwu.jsp' starting page</title>

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
		<link rel="stylesheet" rev="stylesheet" href="<%=path %>/css/style.css"
			type="text/css" media="all" />


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
function baocun(){
	var poid=$("#poid").val();
	var name=$("#name").val();
	var other=$("#other").val();
	if(poid==""){
		alert("职位编号不能为空！");
	}else if(poid.length>20){
		alert("职位编号长度过长！");
	}else if(!/^[1-9][0-9]*$/.test(poid)==true){
		alert("必须为数字！");
	}else if(name==""){
		alert("职位名不能为空！");
	}else if(name.length>20){
		alert("职位名长度过长！");
	}else if(other.length>300){
		alert("描述长度过长");
	}else{
		$("#fom").attr("action","post.do?op=insertOne");
		$("#fom").submit();
	}
}
</script>
	</head>

	<body class="ContentBody">
		<form  method="post" name="fom" id="fom">
			<div class="MainDiv">
				<table width="99%" border="0" cellpadding="0" cellspacing="0"
					class="CContent">
					<tr>
						<th class="tablestyle_title">
							职位基本信息录入
						</th>
					</tr>
					<tr>
						<td class="CPanel">
							<table border="0" cellpadding="0" cellspacing="0"
								style="width: 100%">
								<TR>
									<TD width="100%">
										<fieldset style="height: 100%;">
											<legend>
												职位信息
											</legend>
											<table border="0" cellpadding="2" cellspacing="1"
												style="width: 100%">
												
												  <tr>
													<td nowrap align="right" width="11%">
														职位编号:
													</td>
													<td width="27%">
														<input name='poid' type="text" id="poid" style="width: 154px" onblur="poid(this);" value="" />
														<font id="poiddiv"  color="red">*</font>
													</td>
													<td align="right" width="25%">
														&nbsp;
													</td>
													<td width="37%">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td nowrap align="right" width="11%">
														职位名:
													</td>
													<td width="27%">
														<input name='name' type="text" class="text" id="name"
															style="width: 154px" value="" />
														<span class="red">*</span>
													</td>

													<td align="right" width="25%">
														&nbsp;
													</td>
													<td width="37%">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td width="11%" nowrap align="right">
														备注:
													</td>
													<td colspan="3">
														<textarea name="other" id="other" cols="100" rows="20"></textarea>
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
						
							<input type="button"  value="保存" class="button"
								onclick="baocun();" />

							<input type="button" name="Submit2" value="返回" class="button"
								onclick="window.history.go(-1);" />
						</TD>
					</TR>
				</TABLE>
			</div>
		</form>
	</body>
</html>
