<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/xiangmu.js"></script>
<script type="text/javascript" src="<%=basePath%>jquery.js"></script>
<script type="text/javascript">
if(${requestScope.result!=null}){
	alert('${requestScope.result}');
}
</script>
<script type="text/javascript">
$(document).ready(function(){
 $("#cha").click(function(){
     	$("#fom").attr("action","<%=basePath%>servlet/listtakexiaoxiServlet?methodName=chashijian&s=2&curPage=1");
     });
	$("#link1").click(function(){
		 var p = $("#textfield3").val();
        
         if(!/^[1-9][0-9]*$/.test(p)){
  				alert("请输入数字！");
  				return false;
  		}
		if(p>${requestScope.util.totalPage}){
			alert("超出范围");
			return false;
		}
		
		if(p<1){
		   alert("超出范围");
		   return false;
		}
		 $("#fom").attr("action","mess.do?op=listSendInfo&curPage="+p);
	});
	
	 $("#quanxuan").click(function (){
		      $(":checkbox").attr("checked","checked");
     });
     
      $("#fanxuan").click(function (){
        var s = $(":checkbox").length;
       	 for(var i=0;i<s;i++){
       	 	if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
       	 		$(":checkbox:eq("+i+")").removeAttr("checked");
       	 		
       	 	}else {
       	 		 $(":checkbox:eq("+i+")").attr("checked","checked");
       	 	}
       	 }
		   
     });
     
     $("#link").click(function(){
        $("#fom").attr("action","files/sendxiaoxi1.jsp");
     });
     
     $("#linkdel").click(function(){
     	var size = $(":checkbox").length;
			var obj1 = document.getElementsByName("world");
			for (var i=0;i<size;i++){	
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					$(".hel:eq("+i+")").attr("value","yes");
				}else{
					$(".hel:eq("+i+")").attr("value","no");
				}
			}
	    	 $("#fom").attr("action","mess.do?op=deleteSecMess&curPage=${requestScope.curPage}");
     });

});




/*
function linkdel(){
	var obj = document.getElementsByName("delid");
	var obj1 = document.getElementsByName("world");
	
	for (var i=0;i<obj.length;i++){
		if (obj[i].checked == true){
			obj1[i].value="yes";
		}else{
			obj1[i].value="no";
		}
	}
	document.getElementById("fom").action="<%=basePath%>servlet/listtakexiaoxiServlet?methodName=alldelete1&s=2&page=${requestScope.curPage}";
	document.getElementById("fom").submit();
}
*/


function on_load(){
	var loadingmsg=document.getElementById("loadingmsg");
	var mainpage=document.getElementById("mainpage");
	loadingmsg.style.display="";
	mainpage.style.display="none";
	
	loadingmsg.style.display="none";
	mainpage.style.display="";
}
</script>

<script type="text/JavaScript">
		var dx,dy;
		var dx=(screen.height/2-105)+"";
	   	var dy=(screen.width/2-200)+"";
	   	$(document).ready(function (){
	   		$("#find").click(function(){
	   			var returnv=window.showModalDialog("<%=basePath%>files/listxiaoxisousuo.jsp","高级查询","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			//var returnv=window.open("<%=basePath%>files/listrenwusousuo.jsp","高级查询","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			
	   			if(returnv != undefined){
	   				$("#fom").attr("action","<%=basePath %>servlet/listtakexiaoxiServlet?methodName=glistallxiaoxi&curPage=1&s=2"+returnv);
	   			}
	   		});
	   	});
</script>


</head>



<body onload="on_load()">
<form name="fom" id="fom" method="post" action="">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="<%=path %>/images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="21"><img src="<%=path %>/images/ico07.gif" width="20" height="18" /></td>
			<td width="550">查看内容：按时间：
			 <input name="t1" type="text" size="12" /><span class="newfont06">至</span>
			 <input name="t2" type="text" size="12" />	
			 <input name="Submit" type="submit" class="right-button02" value="查 询" id='cha' />
			 <span  class="red">格式：(yyy-mm-dd)</span>
			 </td>
			 <td width="132" align="left"><a href="#" onclick="sousuo()">
			   <input name="Submit" type="submit" class="right-button07" value="高级搜索" id='find'/></a></td>	
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
               <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08" id="quanxuan" >全选</a>-<a href="#" class="right-font08" id="fanxuan">反选</a></span>
	              <input name="Submit" type="submit" class="right-button08" value="删除所选信息" id="linkdel"/>
	              <input name="Submit2" type="submit" class="right-button08" value="新建信息" id="link"/></td>
          	 </tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 发送信息列表 &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="14%" align="center" bgcolor="#EEEEEE">选择</td>
                    <td width="19%" height="20" align="center" bgcolor="#EEEEEE">标题</td>
                    <td width="20%" align="center" bgcolor="#EEEEEE">接收人</td>
                    <td width="15%" align="center" bgcolor="#EEEEEE">发信人</td>
                    <td width="21%" align="center" bgcolor="#EEEEEE">发送时间</td>
                    <td width="26%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                   <c:forEach var="a" items="${util.list}" varStatus="index">
                  <tr align="center">
				    <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                    <td height="20" bgcolor="#FFFFFF">${a.head }</td>
                    <td bgcolor="#FFFFFF">${a.taker}</td>
                    <td bgcolor="#FFFFFF">${a.sender}</td>
                    <td bgcolor="#FFFFFF">${a.sendtime }</td>
                    <td bgcolor="#FFFFFF"><a href="mess.do?op=deleteOneMess&mid=${a.mid}">删除</a>|<a href="mess.do?op=messInfo&mid=${a.mid}">查看</a> 
                 <input type='hidden' name='hello' id="hello" value='${a.mid}'> 
                 <input type='hidden' class='hel' name='world' id="world"></td>
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
                
                <td width="50%">第 <span class="right-text09">${requestScope.curPage }</span> 页 | 共 <span class="right-text09">${requestScope.util.totalPage }</span> 页 | <span class="right-text09">${requestScope.util.count }</span>条记录</td>
                <td width="49%" align="right">
                [<a href="mess.do?op=listSendInfo&curPage=1" class="right-font08">首页</a> | <a href="mess.do?op=listSendInfo&curPage=${requestScope.curPage-1>0?requestScope.curPage-1:requestScope.curPage }" class="right-font08">上一页</a> | <a href="mess.do?op=listSendInfo&curPage=${requestScope.curPage<requestScope.util.totalPage?requestScope.curPage+1:requestScope.curPage }" class="right-font08">下一页</a> | <a href="mess.do?op=listSendInfo&curPage=${requestScope.util.totalPage }" class="right-font08">末页</a>] 转至：
                </td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input id="textfield3" name="page" type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" id="link1" value=" "  />
                      
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

<div id="loadingmsg" style="width:100px; height:18px; top:0px; display:none;">
	<img src="<%=path %>/images/loadon.gif" />
</div>

</body>
</html>
