<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
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
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
if(${result!=null}){
	alert('${result}');
}
</script>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<script type="text/javascript" src="<%=path %>/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/files/jquery.js"></script>
<SCRIPT language=JavaScript>

$(document).ready(function (){
	
		//全选
		$("#allselect").click(function(){
		//alert($("#allselect"));
			 $(":checkbox").attr("checked","checked");
		});
		
		//反选
		$("#fanselect").click(function(){
			var size=$(":checkbox").length;
			for(var i=0;i<size;i++){
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					//alert($(":checkbox").attr("checked"));
					$(":checkbox:eq("+i+")").removeAttr("checked");
				}else{
					$(":checkbox:eq("+i+")").attr("checked","checked");
				}
			}
		});
		
		//高级搜索
		 var dx,dy;
		  var dx=(screen.height/2-105)+"";
	   	  var dy=(screen.width/2-200)+"";
	   	$(document).ready(function (){
	   		$("#find").click(function(){
	   			var returnv=window.showModalDialog("<%=basePath%>files/gongnenggaoji.jsp","高级查询","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   		  
	   			if(returnv != undefined){
	   				$("#fom").attr("action","<%=basePath %>servlet/GongnengServlet?methodName=gaojiquery&curPage=1"+returnv);
	   			}else{
	   				return false;
	   			}
	   		});
	   	});
});



function linkdel(){
	var obj = document.getElementsByName("delid");
	var obj1 = document.getElementsByName("world");
	var r=confirm("是否确定删除");
	if(r==true){
	for (var i=0;i<obj.length;i++){
		if (obj[i].checked == true){
			obj1[i].value="yes";
		}else{
			obj1[i].value="no";
		}
	}
	document.getElementById("fom").action="fea.do?op=deleteSecFea";
	document.getElementById("fom").submit();
	}else{
	document.getElementById("fom").action="fea.do?op=queryall&curPage=1";
	document.getElementById("fom").submit();
	}
}
	


</SCRIPT>


<script type="text/javascript">

  	$(document).ready(function (){
  		
  		//分页
  		var t = '${requestScope.util.totalPage}';
   		$("#gog").click(function(){
  			var curPage=$("#ij").val();
  			if(parseInt(curPage)>parseInt(t)){
     			curPage='${requestScope.util.totalPage}';
   			  } 
   			if(parseInt(curPage)<parseInt(t)){
    			curPage=curPage;
  			  }
  			if(parseInt(curPage)<1){
      			curPage='1';
  			  }
  			  if(!/^[0-9]*$/.test(curPage)){
  				alert("请输入数字！");
  				return false;
  			}
  			$("#fom").attr("action","fea.do?op=queryAll&curPage="+curPage);
  		});
  		
  		//添加功能
  		$("#add").click(function(){
  			$("#fom").attr("action","files/addgongneng.jsp");
  			$("#fom").submit();
  		});
  		
  		//范围查询
  		$("#fanwei").click(function(){
  	      
  		    var gname=$("#gname").val();
  		    if(gname==""){
  		    alert("无查询条件");
  		    $("#fom").attr("action","<%=basePath%>servlet/GongnengServlet?methodName=queryall&page=1");
  		    $("#fom").submit();
  		    }else{
  		     $("#fom").attr("action","<%=basePath%>servlet/GongnengServlet?methodName=gaojiquery&curPage=1&gname="+gname+"&createbegin=&createend=&proname=&ntitle=&modname=");
  		    $("#fom").submit();
  		    }
  		});
  	});
  </script>

<body>
<form name="fom" id="fom" method="post" action="<%=basePath%>servlet/GongnengServlet?methodName=gaojiquery1&curPage=1">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="<%=path %>/images/nav04.gif">
            
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21"><img src="<%=path %>/images/ico07.gif" width="20" height="18" /></td>
			  
			  <td width="538">查看内容：
                                                 按功能名称：
                <input type="text"  id="gname" name="gname" />
                <input name="Submit4" type="submit"  class="right-button02" value="查 询" /></td>
               
			     <td width="144" align="left"><a href="#" onclick="sousuo()">
			     <input name="Submit3" type="submit" class="right-button07" id='find' value="高级搜索" />
			   </a></td>
		    </tr>   
		    
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
                 <td height="20"><span class="newfont07">选择：<input type="button" class="right-button02" value="全选" id='allselect'>-<input type="button" class="right-button02"  value="反选" id='fanselect'></span>
	              <input name="Submit" type="button" class="right-button08" value="删除所选功能"  onclick="linkdel();"/>
	              <input name="Submit2" id="add"  type="button" class="right-button08" value="添加功能" /></td>

          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle" >
                    	<td height="22" colspan="8" align="center" style="font-size:16px">功能详细列表</td>
                  </tr>
                  <tr bgcolor="#EEEEEE">
				    <td width="4%" align="center" height="30">选择</td>
                    <td width="10%">功能名称</td>
					<td width="10%">创建时间</td>
                    <td width="10%">所属项目</td>
					<td width="10%">所属需求</td>
					<td width="10%">所属模块</td>
					<td width="5%">优先级</td>
					<td width="12%">操作</td>
                  </tr>
                  
                   <c:forEach items="${requestScope.util.list}" var="list" varStatus="vs" >
                  <tr bgcolor="#FFFFFF">
				    <td height="20"><input type="checkbox" name="delid" value="${list.feid}"/></td>
                    <td><a href="<%=path %>/servlet/GongnengServlet?methodName=queryother&feid=${list.feid}">${list.feName}</a></td>
                    <td bgcolor="#FFFFFF">${list.feCreateTime}</td>
                    <td bgcolor="#FFFFFF">${list.prname}</td>
                    <td bgcolor="#FFFFFF">${list.rname}</td>
                    <td bgcolor="#FFFFFF">${list.moName}</td>
                    <c:if test="${list.feLevel=='暂不'}">
                      <td bgcolor="#FFFFFF">暂不</td>
                    </c:if>
                    <c:if test="${list.feLevel=='一般'}">
                      <td bgcolor="#FFFFFF">一般</td>
                    </c:if>
                      <c:if test="${list.feLevel=='需要'}">
                      <td bgcolor="#FFFFFF">需要</td>
                    </c:if>
                      <c:if test="${list.feLevel=='急'}">
                      <td bgcolor="#FFFFFF">急</td>
                    </c:if>
                      <c:if test="${list.feLevel=='很急'}">
                      <td bgcolor="#FFFFFF">很急</td>
                    </c:if>
                    <td bgcolor="#FFFFFF"><a href="fea.do?op=editForSee&feid=${list.feid}&flag=1">编辑|</a><a href="fea.do?op=editForSee&feid=${list.feid}&flag=3">查看|</a>
						<a href="fea.do?op=editForSee&feid=${list.feid}&flag=2">变更需求</a></td>
                  </tr>
                     <input type="hidden"  name="hello"  value="${list.feid}">
                     <input type="hidden"  name="world" >
                   </c:forEach>
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
                <td width="50%">第 <span class="right-text09">${requestScope.curPage }</span> 页 | 共 <span class="right-text09">${requestScope.util.totalPage }</span> 页 | <span class="right-text09">${requestScope.util.count }</span>条记录</td>
               
                <td width="49%" align="right">
                [<a href="fea.do?op=queryAll&curPage=1" class="right-font08">首页</a> | <a href="fea.do?op=queryAll&curPage=${requestScope.curPage-1>0?requestScope.curPage-1:requestScope.curPage }" class="right-font08">上一页</a> | <a href="fea.do?op=queryAll&curPage=${requestScope.curPage<requestScope.util.totalPage?requestScope.curPage+1:requestScope.curPage }" class="right-font08">下一页</a> | <a href="fea.do?op=queryAll&curPage=${requestScope.util.totalPage}" class="right-font08">末页</a>] 转至：
                </td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input id="ij"  type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="gog" id='gog' type="submit" class="right-button06" value=" " />
                      
                      </td>
                    </tr>
                </table></td>
                 <c:if test="${method=='queryone'}">
                <td width="50%">第 <span class="right-text09">1</span> 页 | 共 <span class="right-text09">1</span> 页 | <span class="right-text09">1</span>条记录</td>
               
            
                </c:if>
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

