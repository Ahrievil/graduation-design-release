<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listxiangmumingxi.jsp' starting page</title>
    
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

<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">

</script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
function sousuo(){
	window.open("gaojisousuo.htm","","depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}
function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}

function link(){
    document.getElementById("fom").action="xiangmu.htm";
   document.getElementById("fom").submit();
}

</SCRIPT>

<body>

<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="679" align="left"><a href="#" onclick="sousuo()"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a></td>	
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
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 项目细列表 &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">项目名称:</td>
                    <td width="85%" align="left" bgcolor="#FFFFFF">${pro.prName}</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">客户名称:</td>
                    <td bgcolor="#FFFFFF">${pro.prClient }</td>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">项目经理:</td>
                    <td bgcolor="#FFFFFF">${pro.prMgr }</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">项目金额:</td>
                    <td bgcolor="#FFFFFF">${pro.prMoney }</td>
                    </tr>
                  <tr>
				   <td height="20" align="right" bgcolor="#FFFFFF">开发人数:</td>
                    <td bgcolor="#FFFFFF">${pro.prNum }</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">计划启动日期:</td>
                    <td bgcolor="#FFFFFF">${pro.prStartTime }</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">计划完成日期:</td>
                    <td bgcolor="#FFFFFF">${pro.prEndTime }</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">实际启动日期:</td>
                    <td bgcolor="#FFFFFF">${pro.prStart }</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">实际完成日期:</td>
                    <td bgcolor="#FFFFFF">${pro.prEnd }</td>
                    </tr>
				<tr>
				    <td align="right" bgcolor="#FFFFFF">立项日期:</td>
                    <td bgcolor="#FFFFFF">${pro.prSetup }</td>
                    </tr>
				<tr>
				    <td align="right" bgcolor="#FFFFFF">更新日期:</td>
                    <td bgcolor="#FFFFFF">${pro.prChangTime }</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">任务优先级:</td>
                    <c:if test="${pro.prLevel=='暂不'}">
                      <td bgcolor="#FFFFFF">暂不</td>
                    </c:if>
                    <c:if test="${pro.prLevel=='一般'}">
                      <td bgcolor="#FFFFFF">一般</td>
                    </c:if>
                      <c:if test="${pro.prLevel=='需要'}">
                      <td bgcolor="#FFFFFF">需要</td>
                    </c:if>
                      <c:if test="${pro.prLevel=='急'}">
                      <td bgcolor="#FFFFFF">急</td>
                    </c:if>
                      <c:if test="${pro.prLevel=='很急'}">
                      <td bgcolor="#FFFFFF">很急</td>
                    </c:if>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">是否超期:</td>
                    <td bgcolor="#FFFFFF">${pro.prExceed=="否"?"否":"是" }</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">超期天数:</td>
                    <td bgcolor="#FFFFFF"> ${pro.prExceedTime } 天</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">完成状态:</td>
                   <c:if test="${pro.prStatus=='未开始'}">
                      <td bgcolor="#FFFFFF">未开始</td>
                    </c:if>
                    <c:if test="${pro.prStatus=='进行中'}">
                      <td bgcolor="#FFFFFF">进行中</td>
                    </c:if>
                      <c:if test="${pro.prStatus=='已完成'}">
                      <td bgcolor="#FFFFFF">已完成</td>
                    </c:if>
                    </tr>
					<tr height='80'>
				    <td align="right" bgcolor="#FFFFFF">项目备注:</td>
                    <td bgcolor="#FFFFFF"  rowspan="3" >${pro.prOther }</td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%" align="right">共 <span class="right-text09">1</span> 页 | 第 <span class="right-text09">1</span> 页</td>
                    <tr>
                     
                </table></td>
              </tr>
          </table></td>
        </tr>
</body>
</html>
