<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'listzhiwu.jsp' starting page</title>
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
<script type="text/JavaScript">
if(!${sessionScope.result}==''){
alert("更新了${sessionScope.result}条数据");
}
</script>
<script type="text/javascript">
if(!${sessionScope.insertpost} ==''){
alert("更新了${sessionScope.insertpost}条数据");
}
</script>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
function sousuo(){
	window.open("gaojisousuo.jsp","","depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
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
    document.getElementById("fom").action="<%=path %>/files/zhiwu.jsp";
   document.getElementById("fom").submit();
}
//
function link1(){
   var p = document.getElementById("textfield3").value;
   var t = '${requestScope.util.totalPage}';
   if(p>t){
   	 alert("没有此页");
     document.getElementById("textfield3").value='1';
   } 
   if(p<t){
     document.getElementById("textfield3").value=p;
   }
   if(p<1){
      document.getElementById("textfield3").value='1';
   }
   if(p==""){
   	  alert("请输入");
   }
    fom.action="post.do?op=queryAllPost&curPage="+p;
}

function on_load(){
	var loadingmsg=document.getElementById("loadingmsg");
	var mainpage=document.getElementById("mainpage");
	loadingmsg.style.display="";
	mainpage.style.display="none";
	loadingmsg.style.display="none";
	mainpage.style.display="";
}

//删除一条
function deleteOne(){
	var obj = document.getElementsByName("delid");
	var obj1 = document.getElementsByName("world");
	for (var i=0;i<obj.length;i++){
		if (obj[i].checked == true){
			obj1[i].value="yes";
		}else{
			obj1[i].value="no";
		}
	}
	document.getElementById("fom").action="post.do?op=delectSecPost";
	document.getElementById("fom").submit();
}

</SCRIPT>
  
 <body>

<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30">      
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="<%=path %>/images/nav04.gif">
            
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="24">&nbsp;</td>
			  <td width="519">&nbsp;</td>
			  <td width="679" align="left"><a href="#" onclick="sousuo()"></a></td>	
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <td height="20"><span class="newfont07">选择：
               <a href="#" class="right-font08" onclick="selectAll();">全选</a>-
               <a href="#" class="right-font08" onclick="unselectAll();">反选</a></span>
	              <input name="Submit" type="button" class="right-button08" value="删除所选职位信息" onclick="deleteOne();"/>
	              <input name="Submit2" type="button" class="right-button08" value="添加职位" onclick="link();"/></td>
          	 </tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="4" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 职位列表 &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="5%" align="center" bgcolor="#EEEEEE">选择</td>
                    <td width="21%" height="20" align="center" bgcolor="#EEEEEE">职位名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">备注</td>
                    <td width="6%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <c:forEach items = "${requestScope.util.list }" var = "post">


                  <tr>
				    <td bgcolor="#FFFFFF">
				    <input type="checkbox" name="delid" value="${post.poid }" />
					<input type="hidden"  name="hello"  value="${post.poid }">
                 	<input type="hidden"  name="world" ></td>
                    <td height="20" bgcolor="#FFFFFF">${post.name }</td>
                    <td bgcolor="#FFFFFF">${post.other }</td>
                    <td bgcolor="#FFFFFF"><a href="post.do?op=queryForEdit&poid=${post.poid }">编辑</a>丨<a href="post.do?op=queryForSee&poid=${post.poid }">查看</a>
                    </td>
                  </tr>
                  </c:forEach>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="<%=path %>/images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">第 <span class="right-text09">${requestScope.curPage }</span> 页 |
                	 共<span class="right-text09">${requestScope.util.totalPage }</span> 页| 
                <span class="right-text09">${requestScope.util.count }</span>条记录</td>
                <td width="49%" align="right">
                <a href="post.do?op=queryAllPost&curPage=1" class="right-font08">首页</a> | 
                <a href="post.do?op=queryAllPost&curPage=${requestScope.curPage-1>0?requestScope.curPage-1:requestScope.curPage }" class="right-font08">上一页</a> | 
                <a href="post.do?op=queryAllPost&curPage=${requestScope.curPage<requestScope.util.totalPage?requestScope.curPage+1:requestScope.curPage }" class="right-font08">下一页</a> | 
                <a href="post.do?op=queryAllPost&curPage=${requestScope.util.totalPage }" class="right-font08">末页</a>] 转至：</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input id="textfield3" name="page" type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" value="" onclick="link1();"/>
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
