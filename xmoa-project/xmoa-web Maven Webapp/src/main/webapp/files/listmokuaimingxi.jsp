<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listmokuaimingxi.jsp' starting page</title>
    
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
    document.getElementById("fom").action="xuqiumingxi.html";
   document.getElementById("fom").submit();
}
</SCRIPT>

<body>
<form name="fom" id="fom" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="images/nav04.gif">
            
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
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="3" align="center" bgcolor="#EEEEEE"class="tablestyle_title">
							<div align="center" style="font-size:16px">模块明细列表</div></td>
                    </tr>
                  <tr>
				    <td width="16%" height="20" align="right" bgcolor="#FFFFFF">模块名称:</td>
                    <td width="84%" colspan="2" bgcolor="#FFFFFF">${mk.moName }</td>
                  </tr>
				  <tr>
				    <td width="16%" height="20" align="right" bgcolor="#FFFFFF">模块标识:</td>
                    <td width="84%" colspan="2" bgcolor="#FFFFFF">${mk.moMark}</td>
                  </tr>
				  
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">所属项目:</td>
				    <td colspan="2" bgcolor="#FFFFFF">${mk.prname }</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">所属需求:</td>
				    <td colspan="2" bgcolor="#FFFFFF">${mk.rname }</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">优先级:</td>
				    
				    <c:if test="${mk.reLevel=='暂不'}">
                      <td bgcolor="#FFFFFF">暂不</td>
                    </c:if>
                    <c:if test="${mk.reLevel=='一般'}">
                      <td bgcolor="#FFFFFF">一般</td>
                    </c:if>
                      <c:if test="${mk.reLevel=='需要'}">
                      <td bgcolor="#FFFFFF">需要</td>
                    </c:if>
                      <c:if test="${mk.reLevel=='急'}">
                      <td bgcolor="#FFFFFF">急</td>
                    </c:if>
                      <c:if test="${mk.reLevel=='很急'}">
                      <td bgcolor="#FFFFFF">很急</td>
                    </c:if>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">创建时间:</td>
				    <td colspan="2" bgcolor="#FFFFFF">${mk.moCreateTime }</td>
                    </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="#FFFFFF">更新时间:</td>
                    <td colspan="2" bgcolor="#FFFFFF">${mk.moChangTime }</td>
                  </tr>
                  <tr>
				    <td height="80" align="right" bgcolor="#FFFFFF">模块描述:</td>
				    <td colspan="2" bgcolor="#FFFFFF">${mk.moOther }</td>
                    </tr>
					<tr>
				    <td height="80" align="right" bgcolor="#FFFFFF">需求描述:</td>
				    <td colspan="2" bgcolor="#FFFFFF">${mk.reOther }</td>
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
          <TD height="33">
		  
		  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%" align="right" >共 <span class="right-text09">1</span> 页 | 第 <span class="right-text09">1</span> 页</td>
                    <tr>
                    </tr>
                </table>
			</TD>
              </tr>
          </table></td>
        </tr>
</body>
</html>
