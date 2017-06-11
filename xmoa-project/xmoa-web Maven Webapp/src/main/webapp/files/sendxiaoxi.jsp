<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by www.eyingda.com</title>
<link rel="stylesheet" rev="stylesheet" href="<%=path%>/css/style.css" type="text/css" media="all" />


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
  <form action="mess.do?op=sendMessForReturn" method="post"  name="form" id='form'>
  <input type="hidden" value="${sessionScope.check}" name="token">
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
									    
									    <input type='text' name='name3' id='name3' class='text' style="width:154px;height:20px;left=150" value = "${requestScope.taker }" disabled='disabled'>
									    <input type='hidden' name='taker' id='namesb' value = "${requestScope.taker }" class='text' style="width:154px;height:20px;left=150" >
									    <input type='hidden' name='sender' id='namesb' value = "${requestScope.sender }" class='text' style="width:154px;height:20px;left=150" >
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
					    <td colspan="3"><textarea name="textarea" cols="100" rows="20" id='textarea'></textarea>
					    <span  class="red"> *</span>
					    <div style="position:absolute;color:red" id='xid'></div>
					    </td>
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
