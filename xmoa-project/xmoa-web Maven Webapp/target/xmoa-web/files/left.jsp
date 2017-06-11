<%@ page language="java" import="java.util.*,com.ty.xmoa.model.OaUser"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(<%=path%>/images/left.gif);
}
-->
</style>
<link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/dtree.css" rel="stylesheet" />
<script type="text/javascript" src="<%=path%>/js/dtree.js"></script>
<script>
	var powerId = new dTree('powerId');
	powerId.add(0, -1, '管理权限', '');
</script>
</head>

<body>
	<table width="198" border="0" cellpadding="0" cellspacing="0"
		class="left-table01">
		<tr>
			<TD>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="207" height="55"
							background="<%=path%>/images/nav01.gif">
							<table width="90%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="25%" rowspan="2"><img
										src="<%=path%>/images/ico02.gif" width="35" height="35" /></td>
									<td width="75%" height="22" class="left-font01">您好，<span
										class="left-font02">${sessionScope.currentuser.uname }</span></td>
								</tr>
								<tr>
									<td height="22" class="left-font01">[&nbsp;<a
										href="<%=basePath%>servlet/user.do?op=exit" target="_top"
										class="left-font01">退出</a>&nbsp;]
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<table>
					<tr>
						<td><c:forEach var="fun" items="${funlist}">
								<script>
									powerId.add(${fun.fid}, ${fun.pid},
											"${fun.fname}", "", "", "", "",
											"${fun.fhref}", "${fun.fname}",
											"mainFrame");
								</script>
							</c:forEach> <script>
								document.write(powerId);
							</script></td>
					</tr>
				</table>

			</TD>
		</tr>
	</table>
</body>
</html>
