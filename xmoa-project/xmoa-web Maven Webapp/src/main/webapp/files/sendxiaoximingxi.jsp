<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by www.eyingda.com</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tabfont01 {	
	font-family: "宋体";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}
.font051 {font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}
html { overflow-x: auto; overflow-y: auto; border:0;} 
-->
</style>

<link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	   $("#hid").click(function(){
// 	  alert(123);
	   		$("#fom").attr("action","mess.do?op=returnMess&sender=${onemess.taker}&taker=${onemess.sender}");
	   });
		
	});

</script>

</head>


<body>
<form name="fom" id="fom" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="<%=path%>/images/nav04.gif">
            
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21">&nbsp;</td>
			  </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
         
              <tr>
                <TD height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                  <tr>
                    <td height="20" colspan="2" bgcolor="#EEEEEE"class="tablestyle_title"><div align="center" style="font-size:16px">消息明细列表</div></td>
                  </tr>
                  <tr bgcolor="#FFFFFF" height="20">
                    <td width="16%" align="right">消息标题:</td>
                    <td width="84%">${requestScope.onemess.head}</td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right">发件人:</td>
                    <td>${requestScope.onemess.sender}</td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right">接收人:</td>
                    <td>${requestScope.onemess.taker }</td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right">发送时间:</td>
                    <td>${requestScope.onemess.sendtime }</td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right" height="80">消息内容:</td>
                    <td>${requestScope.onemess.text }</td>
                  </tr>
                </table></TD>
           
			<tr height="10px" >
			<c:if test="${sessionScope.currentuser.uname==requestScope.onemess.taker}">
				<td align="center" height="10px" width='10px'>
		    		<input type="submit" name="Submit" value="回复" class="button" id='hid'/></td>
			</c:if>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="<%=path%>/images/spacer.gif" width="1" height="1" /></td>
        </tr>
          </table></td>
        </tr>
     </table>
</form>
</body>
</html>
