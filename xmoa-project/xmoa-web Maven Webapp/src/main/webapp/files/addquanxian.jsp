<%@ page language="java" import="java.util.*,com.ty.xmoa.model.*" pageEncoding="utf-8"%>
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

.font051 {
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}

.font201 {
	font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}

html {
	overflow-x:;
	overflow-y:;
	border: 0;
}
</style>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=path %>/jquery.js"></script>
<link rel="StyleSheet" href="<%=path%>/css/dtree.css" type="text/css" />
<script src="<%=path %>/js/dtree.js" type="text/javascript"></script>
<script type="text/javascript">
if(${requestScope.result!=null}){
	alert('${requestScope.result}');
}
</script>

<script type="text/javascript"> 
var powerId = new dTree('powerId');
var root = 0;
var powerCode = false;
var check = false;
powerId.add(root,-1,'管理权限','');
function checkNode(nodeId){
	powerId.checkNode(nodeId);
}
</script>
<script type="text/javascript">
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
	$("#tj").click(function(){
		$("#fom").attr("action","fun.do?op=queryAllFunNameForSee");
	});
	$("#sc").click(function(){
		$("#fom").attr("action","role.do?op=deleteRole");
	});
	//目的是把角色No带入到跳转地址中，以方便servlet获取
	$("#xiugai").click(function(){
		var s=$(":selected").val();
		$("#fom").attr("action","fun.do?op=updateFun");
	});
});
//ajax------jquery.js方式 
function xuanze(){ 
	var value=$(":selected").val();
	var s=$(":selected").text();
	//alert(s);
	var path="<%=basePath%>servlet/quanxianServlet?methodName=jsxianshi&js="+value;
  	$.post(path,{js:value},function(v){
  		var zx=v.split("-");
  		//alert(zx);
  		for(var i=1;i<20;i++){
  		var z=zx[i-1].split(",");
  			if(z[0]=="false"){
  				$("#qx"+i).attr("checked",false);
  			}else{
  				$("#qx"+i).attr("checked",true);
  			}
  		}
  	});
}
//ajax原理，返回值为true，应用回调函数，接受由servlet写入的值activeX.responseText方法，用拆分后的字符串比较来判断所对应的checked的值；
//	var activeX = false;
//	activeX = new ActiveXObject("Microsoft.XMLHTTP");
//	var s = document.getElementById("js");
//	var index = document.getElementById("js").selectedIndex;
//	activeX.open("post","<%=basePath%>servlet/quanxianServlet?methodName=jsxianshi&js="+s[index].value,true);
 		//回调函数
//		activeX.onreadystatechange=function (){
//		if (activeX.readyState == 4){
//		var zx=activeX.responseText.split("-");
//		for(var i=1;i<zx.length;i++){
//			if(activeX.responseText.split("-")[i-1]=='false'){
//				document.getElementById("qx"+i).checked =false;//			}else{
//				document.getElementById("qx"+i).checked =true;
//			}
//		}
//			}
//		}
//	activeX.send();

//目的是把角色No带入到跳转地址中，以方便servlet获取
//function tiaozhuan(){
//	var s = document.getElementById("js");
//  	var index = document.getElementById("js").selectedIndex;
//	fom.action="<%=basePath%>
	// 	servlet/quanxianServlet?methodName=jsxiugai&js="+s[index].value;
	//	fom.submit();
	//}
</script>

<script>
					function flurole() {

						var xmlHttp;
						try {
							// Firefox, Opera 8.0+, Safari
							xmlHttp = new XMLHttpRequest();
						} catch (e) {
							// Internet Explorer
							try {
								xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
							} catch (e) {
								try {
									xmlHttp = new ActiveXObject(
											"Microsoft.XMLHTTP");
								} catch (e) {
									alert("您的浏览器不支持AJAX！");
								}
							}
						}
						xmlHttp.open("get", "role.do?op=queryAllRoleName&v="
								+ Math.random(), true);
						xmlHttp.onreadystatechange = function() {
							if (xmlHttp.readyState == 4) {
								var json = eval(xmlHttp.responseText);
								var x = document.getElementById("js");
								for (var i = 0; i < json.length; i++) {
									if (x.length < json.length + 1) {
										var y = document.createElement('option');
										y.text = json[i];
										y.value = json[i];
										y.name = json[i];
										try {
											x.add(y, null); // standards compliant
										} catch (ex) {
											x.add(y); // IE only
										}
									}
									
								}
							}
						};
						xmlHttp.send();
					}
				</script>
				
				<script>
					function flushfun() {

						var xmlHttp;
						try {
							// Firefox, Opera 8.0+, Safari
							xmlHttp = new XMLHttpRequest();
						} catch (e) {
							// Internet Explorer
							try {
								xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
							} catch (e) {
								try {
									xmlHttp = new ActiveXObject(
											"Microsoft.XMLHTTP");
								} catch (e) {
									alert("您的浏览器不支持AJAX！");
								}
							}
						}
						var x = document.getElementById("js");
						var el = document.getElementsByTagName('input'); 
						for(var i=0; i<el.length; i++) { 
							if((el[i].type=="checkbox")) { 
								el[i].checked = false; 
							} 
						} 
						xmlHttp.open("get", "fun.do?op=queryAllFunByRoname&roname="+x.value+"&v="
								+ Math.random(), true);
						xmlHttp.onreadystatechange = function() {
							if (xmlHttp.readyState == 4) {
								var json = eval(xmlHttp.responseText);
								for (var i = 0; i < json.length; i++) {
									for(var key in json[i]){
										//alert(json[i][key]);
										if(key == 'fid'){
											//alert(json[i][key]);
											var chcck = document.getElementById("cpowerId"+json[i][key]);
											chcck.checked="checked";
										}
									}

								}
							}
						};
						xmlHttp.send();
					}
				</script>
</head>
<body>
	<script type="text/javascript">
		var ss = '${requestScope.ss}';
		if (ss != "") {
			alert(ss);
		}
		var ss = '${requestScope.a}';
		if (ss != "") {
			alert(ss);
		}
		var ss = '${requestScope.b}';
		if (ss != "") {
			alert(ss);
		}
	</script>
	<form name="fom" id="fom" method="post">
		&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;<input type="submit" value="添加角色"
			class="right-button08" id="tj"> <input type="submit"
			value="删除角色" class="right-button08" id="sc">
		<table border="1" align="center" width="90%" cellspacing="0"
			cellpadding="0">
			<tr>
				<td class="tablestyle_title" width="10%"><a href="#"
					class="right-font08" id="allselect"><font color="white">全选</font></a>-<a
					href="#" class="right-font08" id="fanselect"><font
						color="white">反选</font></a></td>
				<td class="tablestyle_title">角色名称 
				<select name="mccc" id="js"
					onchange="flushfun();" onmouseover="flurole()">
						<option value="0">=请选择=</option>
				</select> 
				
				</td>
			</tr>
			<tr>
			<td colspan="2" align="left" >
			<c:forEach items = "${requestScope.list }" var = "fun1">
                <script>
				  check = true;
					powerId.add('${fun1.fid}',${fun1.pid},'${fun1.fname}',check,'${fun1.fid}','fids');
				  </script>
              </c:forEach>
              <script type = "text/javascript">
              	document.write(powerId);
              	powerId.openAll();
              </script>
              </td>
              </tr>
		</table>
		<div align="center">
			<input type="submit" class="right-button08" id="xiugai" value="确认修改" />
			<input type="reset" class="right-button08" value="还原" />
		</div>
	</form>
</body>
</html>
