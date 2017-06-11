<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  contentType='text/html;charset=utf-8'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>客户系统</title>
    
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

<link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
</head>
<script type="text/javascript">
if(${result != null}){
alert('${requestScope.result}');
}
</script>
<script>
	$(document).ready(function(){
		$("#allselect").click(function(){
			 $(":checkbox").attr("checked","checked");
		});
		$("#fanselect").click(function(){
			var size=$(":checkbox").length;
			for(var i=0;i<size;i++){
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					$(":checkbox:eq("+i+")").removeAttr("checked");
				}else{
					$(":checkbox:eq("+i+")").attr("checked","checked");
				}
			}
		});
		$("#linkdel").click(function(){
			var size = $(":checkbox").length;
			var obj1 = document.getElementsByName("world");
			var r=confirm("如果删除客户将会删除该客户所属的任何信息，是否确定删除？");
			if(r==true){
			for (var i=0;i<size;i++){	
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					$(".world:eq("+i+")").attr("value","yes");
				}else{
					$(".world:eq("+i+")").attr("value","no");
				}
			}
			$("#fom").attr("action","cus.do?op=deleteSecCus");
		}
		});
		$("#lik").click(function(){
			var curPage=$("#page").val();
  			if(!/^[1-9][0-9]*$/.test(curPage)){
  				alert("请输入数字！");
  				return  false;
  			}
			if(curPage <1 || curPage > ${requestScope.util.totalPage}){
				alert("输出数字不正确！");
				return false;
			}   
			if(curPage==""){
				alert("请输入！");
				return false;
			}
			$("#fom").attr("action","cus.do?op=queryAllCustomer&curPage="+curPage);
		});
		$("#chaxun").click(function(){
	        var cha=$("#clientname").val();
	        if(cha==""){
	       		  alert("请输入客户公司名称！");
	       		  $("#fom").attr("action","<%=path%>/servlet/clientServlet?methodName=queryall&page=1");
	       		 }else{
	       		 $("#fom").attr("action","<%=path%>/servlet/clientServlet?methodName=queryClNa&page=1");
	       		 };
		});
		$("#tian").click(function (){
			$("#fom").attr("action","<%=path%>/files/kehu.jsp");
		});
	});
	
</script>
<body>
<form  name="fom" id="fom" method="post" action=''>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30">      
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="<%=path%>/images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
		    
			  <td width="24"><img src="<%=path%>/images/ico07.gif" width="20" height="18" /></td>
			  <td width="519"><label>公司名称:
			      <input name="clientname" type="text" id="clientname" />
			  </label>
			    <input name="Submit" type="submit" id='chaxun' class="right-button02" value="查 询" /></td>
			   <td width="679" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>	
		    </tr>
          </table>

          </td>
        </tr>
    </table>
   </td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08" id='allselect'>全选</a>-<a href="#" class="right-font08" id='fanselect'>反选</a></span>
		           <input name="Submit" type="submit" class="right-button08" value="删除所选人员信息" id='linkdel' /> <input name="Submit" id='tian' type="submit" class="right-button08" value="添加客户信息" />
		           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	              </td>
          </tr>
              <tr>
                <td height="40" class="font42">
                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
					                  <tr>
                    <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户详细列表 &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="8%" align="center" bgcolor="#EEEEEE">选择</td>
					<td width="12%" height="20" align="center" bgcolor="#EEEEEE">公司名称</td>
                    <td width="7%" align="center" bgcolor="#EEEEEE">联系人</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">联系电话</td>
                    <td width="14%" align="center" bgcolor="#EEEEEE">联系地址</td>
					<td width="28%" align="center" bgcolor="#EEEEEE">公司背景</td>
					<td width="10%" align="center" bgcolor="#EEEEEE">添加时间</td>
                    <td width="11%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>

          <c:forEach items="${requestScope.util.list}" var="cl" varStatus="vs">

          <c:choose>
           <c:when test="${fn:length(cl.cuname) > 8}">
             <c:set var="title" value="${fn:substring(cl.cuname,0,8)}..."></c:set>
           </c:when>
           <c:otherwise>
             <c:set var="title" value="${cl.cuname}"></c:set>
           </c:otherwise>
         </c:choose>
                 <tr>
				    <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
					<td height="20" bgcolor="#FFFFFF"><a href="<%=path%>/servlet/clientServlet?methodName=queryOne&title2=${cl.cuid}">${title }</a></td>
                    <td bgcolor="#FFFFFF">${cl.cuper}</td>
                    <td height="20" bgcolor="#FFFFFF">${cl.cutell}</td>
                    <td bgcolor="#FFFFFF">${cl.cuadd}</td>
                    <td bgcolor="#FFFFFF">${cl.cubg}</td>
                    <td bgcolor="#FFFFFF">${cl.cudate}</td>
					<td bgcolor="#FFFFFF"><a href="cus.do?op=queryInfo&cuid=${cl.cuid}">编辑</a>&nbsp;|&nbsp;<a href="cus.do?op=queryForSee&cuid=${cl.cuid}">查看<input type="hidden"  name="hello"  value="${cl.cuid}"><input type="hidden"  class='world' name="world"  id='world'></a></td>
                    </tr>
                   </c:forEach>     
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="<%=path%>/images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">共 <span class="right-text09">${requestScope.util.totalPage }</span> 页 | 第 <span class="right-text09">${ requestScope.curPage}</span> 页</td>
                <td width="49%" align="right">[<a href="cus.do?op=queryAllCustomer&curPage=${1}" class="right-font08">首页</a>
                 | <a href="cus.do?op=queryAllCustomer&curPage=${requestScope.curPage-1>0?requestScope.curPage-1 :'1'}" class="right-font08">上一页</a> 
                 | <a href="cus.do?op=queryAllCustomer&curPage=${requestScope.curPage<requestScope.util.totalPage?requestScope.curPage+1:requestScope.util.totalPage }" class="right-font08">下一页</a> 
                 | <a href="cus.do?op=queryAllCustomer&curPage=${requestScope.util.totalPage}" class="right-font08">末页</a>] 转至：</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input id="page" name="page" type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" value="" id='lik'  />
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
