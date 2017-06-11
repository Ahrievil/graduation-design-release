<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by 田宇</title>
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

<link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />

<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="<%=path %>/images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="679" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>	
		  </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
	         
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 任务细列表 </td>
                    </tr>
                  <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">任务标题:</td>
                    <td width="85%" align="left" bgcolor="#FFFFFF">${requestScope.jh.plName }</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">客户名称:</td>
                    <td bgcolor="#FFFFFF">${requestScope.post }</td>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">项目经理:</td>
                    <td bgcolor="#FFFFFF">${requestScope.jh.plMgr }</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">任务发送人:</td>
                    <td bgcolor="#FFFFFF">${requestScope.jh.plMgr }</td>
                    </tr>
                  <tr>
				   <td height="20" align="right" bgcolor="#FFFFFF">任务执行人:</td>
                    <td bgcolor="#FFFFFF">${requestScope.jh.plWorker }</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">计划开始日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.jh.plCreateTime}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">计划完成日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.jh.plEndTime}</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">实际开始日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.jh.plStartTime}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">实际完成日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.jh.plEndDate}</td>
                    </tr>
				<tr>
				    <td align="right" bgcolor="#FFFFFF">优先级:</td>
                    <td bgcolor="#FFFFFF">${requestScope.jh.plLevel}</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF" height="80">任务说明:</td>
                    <td bgcolor="#FFFFFF">${requestScope.jh.plOther}</td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>
