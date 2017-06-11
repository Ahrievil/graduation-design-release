<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mokuaixuqiu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">


 function save(){
 	var r=confirm("确认保存？");
	if (r==true)
  	{
  		form1.action="mod.do?op=changeMoOther";
  		form1.submit();
  	}
	else
 	 {
  		return;
 	 }
 	}
</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody">
  <form action="" method="post"  name="form1"  >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >变更需求</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		<input type="button" name="Submit" value="保存" class="button" onclick="save();"/>
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		</td></tr>

		
		
		<tr align="center">
          <td class="TablePanel">${mk.moName }</td>
		  </tr>
		<tr>
			<td width="100%">
				<fieldset style="height:100%;">
				<legend>添加需求</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td width="15%" align="right">需求描述:</td>
					    <td width="85%"><textarea name="modneedDescription" cols="100" rows="20" style="color:gray">${mk.moOther}</textarea></td>
					    </tr>
					  </table>
			  <br />
				</fieldset>			</td>
		</tr>
		</table>
	
	
	 </td>
  </tr>
  

		
		
		
		
		<tr>
			<td colspan="2" align="center" height="50px">
			<input type="hidden" name="moid" value="${mk.moid}">
			
			<input type="button" name="Submit" value="保存" class="button" onclick="save();"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></td>
		</tr>
		</table>
	


</div>
</form>
</body>
</html>
