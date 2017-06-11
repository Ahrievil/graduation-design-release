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
    
    <title>My JSP 'editjihua.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" type="text/javascript">
 	
</script>
<script language="JavaScript" type="text/javascript">
 //验证

function panduan(){
 var iscomplete=$("#iscomplete").val();	
		if(iscomplete=='0'){
			document.getElementById("jrenddate").readOnly="readOnly";
		}else if(iscomplete=='1'){
			document.getElementById("jrenddate").readOnly=false;
		}

 	}
 
function save1(){

	fom.action="plan.do?op=update";
	fom.submit();
 		}
</script>

<script>
														function fluheadplan(){
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
																		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
																	} catch (e) {
																		alert("您的浏览器不支持AJAX！");
																	}
																}
															}
															xmlHttp.open("get", "plan.do?op=getAllName&v=" + Math.random(),true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	var x = document.getElementById("plHeadPlan");
																	for (var i = 0; i < json.length; i++) {
																		if(x.length<json.length+1){
																		var y=document.createElement('option');
												  						y.text=json[i];
																		try
																	    {
																	    x.add(y,null); // standards compliant
																	    }
																	  catch(ex)
																	    {
																	    x.add(y); // IE only
																	    }
																	    if(json[i]=='${jh.plHeadPlan}'){
																	    	y.selected = "selected";
																	    }
																		}
												
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>
						
														<script>
														function flureq(){
															
															var x = document.getElementById("nno");
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
																		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
																	} catch (e) {
																		alert("您的浏览器不支持AJAX！");
																	}
																}
															}
															xmlHttp.open("get", "req.do?op=loadAllName&prname=${jh.prname}&v=" + Math.random(),
																	true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	for (var i = 0; i < json.length; i++) {
																		if(x.length<json.length+1){
																		var y=document.createElement('option');
												  						y.text=json[i];
												  						y.value = json[i];
																		try
																	    {
																	    x.add(y,null); // standards compliant
																	    }
																	  catch(ex)
																	    {
																	    x.add(y); // IE only
																	    }
																	    if(json[i] == '${jh.rname}'){
																	    	y.selected = "selected";
																	    }
																		}
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>		
															
															<script>
														function flumod(){
															
															var pn = document.getElementById("nno").value;
															var x = document.getElementById("modu");
															if(pn!=null){
																x.length = 0;
// 															alert("hehe");
																var fu=document.createElement('option');
																fu.text = "==请选择需求==";
																try
																	    {
																	    x.add(fu,null); // standards compliant
																	    }
																	  catch(ex)
																	    {
																	    x.add(fu); // IE only
																	    }
															}
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
																		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
																	} catch (e) {
																		alert("您的浏览器不支持AJAX！");
																	}
																}
															}
															xmlHttp.open("get", "mod.do?op=loadAllName&rname="+pn+"&v=" + Math.random(),
																	true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	for (var i = 0; i < json.length; i++) {
																		if(x.length<json.length+1){
																		var y=document.createElement('option');
												  						y.text=json[i];
												  						y.value = json[i];
																		try
																	    {
																	    x.add(y,null); // standards compliant
																	    }
																	  catch(ex)
																	    {
																	    x.add(y); // IE only
																	    }
																	    if(json[i] == '${jh.moname}'){
																	    	y.selected = "selected";
																	    }
																		}
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>	
													
														<script>
														function flufea(){
															
															var pn = document.getElementById("modu").value;
															var x = document.getElementById("gno");
															if(pn!=null){
																x.length = 0;
// 															alert("hehe");
																var fu=document.createElement('option');
																fu.text = "==请选择需求==";
																try
																	    {
																	    x.add(fu,null); // standards compliant
																	    }
																	  catch(ex)
																	    {
																	    x.add(fu); // IE only
																	    }
															}
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
																		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
																	} catch (e) {
																		alert("您的浏览器不支持AJAX！");
																	}
																}
															}
															xmlHttp.open("get", "fea.do?op=loadAllName&moname="+pn+"&v=" + Math.random(),
																	true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	for (var i = 0; i < json.length; i++) {
																		if(x.length<json.length+1){
																		var y=document.createElement('option');
												  						y.text=json[i];
												  						y.value = json[i];
																		try
																	    {
																	    x.add(y,null); // standards compliant
																	    }
																	  catch(ex)
																	    {
																	    x.add(y); // IE only
																	    }
																	    if(json[i]=='${jh.fename}'){
																	    	y.selected = "selected";
																	    }
																		}
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>	
													
													<script>
														function fluworker(){
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
																		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
																	} catch (e) {
																		alert("您的浏览器不支持AJAX！");
																	}
																}
															}
															xmlHttp.open("get", "user.do?op=loadAllWorker&v=" + Math.random(),true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	var x = document.getElementById("jbyper");
																	for (var i = 0; i < json.length; i++) {
																		if(x.length<json.length+1){
																		var y=document.createElement('option');
												  						y.text=json[i];
																		try
																	    {
																	    x.add(y,null); // standards compliant
																	    }
																	  catch(ex)
																	    {
																	    x.add(y); // IE only
																	    }
																	    if(json[i]=='${jh.plWorker}'){
																	    	y.selected = "selected";
																	    }
																		}
												
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>			
<style type="text/css">
	<!--
	.atten {font-size:12px;font-weight:normal;color:#F00;}
	-->
</style>
</head>

<body class="ContentBody">
  <form action="" method="post"  name="fom" id="fom" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >项目计划编辑页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr>
			<td align="left">
		<!--  
		<input type="button" name="save"  id='save' value="保存" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
		-->
		</td>
		</tr>
		<tr align="center">
			<td class="TablePanel" id = "hehehe"><input type="hidden" name="prono" value="${jh.prname }" />${jh.prname }</td>
		</tr>
			<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>修改计划</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="15%">计划标题:</td>
					    <td width="35%"><input name='jtitle' id='jtitle' onblur='yanzheng("1");' type="text" class="text" style="width:154px" value="${jh.plName }" />
				        <span class="red">*</span></td>
					    <td width="16%" align="right" nowrap="nowrap">前置任务计划:</td>
					    <td width="34%">
							
							<div id='jihua'>
					         <select style="width:154px" id = "plHeadPlan" name = "plHeadPlan" onfocus="fluheadplan()">
					    		<option >前置计划为空</option>
							</select>
						  </div>
					     </td>
					  </tr>
					    
					    
					  <tr>
					    <td nowrap="nowrap" align="right">计划创建时间:</td>
					    <td><input class="text" name='jrbegindate' id='jrbegindate' onblur='yanzheng("2");' style="width:154px" value="${jh.plCreateDate }"/></td>
					    <td align="right">实际结束时间:</td>
					    <td><input class="text" name='jrenddate'id='jrenddate' readOnly="readOnly" style="width:154px"  /><font color='red'>*状态为已完成才可填写!</font></td>
					  </tr>
					  <tr>
					    <td align="right">任务执行人:</td>
					    <td>
							<select name="jbyper" id='jbyper' onblur='yanzheng("4");' style="width:154px" class="text" onfocus="fluworker()">
							 	<option  >==请选择任务执行人==</option>
							</select>
						</td>
					    <td align="right">优先级:</td>
					    <td>
							<select name="jmission" id='jmission' onblur='yanzheng("5");' style="width:154px">
							 <option id="xxx" <c:if test="${jh.plLevel =='暂不' }">selected="selected"</c:if> value="暂不">暂不</option>
                             <option id="xxx" <c:if test="${jh.plLevel =='一般' }">selected="selected"</c:if>value="一般">一般</option>
                             <option id="xxx" <c:if test="${jh.plLevel=='需要'}">selected="selected"</c:if>value="需要">需要</option>
                             <option id="xxx" <c:if test="${jh.plLevel=='急' }">selected="selected"</c:if>value="急">急</option>
                             <option id="xxx" <c:if test="${jh.plLevel=='很急'}">selected="selected"</c:if>value="很急">很急</option>
							</select>
						</td>
					  </tr>
					  <tr>
					    <td align="right">任务类型:</td>
						<td>
							<select name="jleixing" id='jleixing' onblur='yanzheng("6");' style="width:154px">
								<option <c:if test="${jh.plType=='测试类型0' }">selected="selected"</c:if> value="测试类型0">测试类型0</option>
								<option <c:if test="${jh.plType=='测试类型1' }">selected="selected"</c:if> value="测试类型1">测试类型1</option>
								<option <c:if test="${jh.plType=='测试类型2' }">selected="selected"</c:if> value="测试类型2">测试类型2</option>
								<option <c:if test="${jh.plType=='测试类型3'}">selected="selected"</c:if> value="测试类型3">测试类型3</option>
							</select>
						</td>
					    <td align="right">状态:</td>
					    <td>
								<select name="iscomplete" id='iscomplete' onchange="panduan()" style="width:154px">
								   <option <c:if test="${jh.flag==0 }"> selected="selected"</c:if>  value="0">未完成</option>
								  <option <c:if test="${jh.flag==1 }">selected="selected"</c:if>   value="1">已完成</option>
								</select>
						</td>
					  </tr>
					  <tr>
					  	 
                         <td align="right">项目需求:</td>
					     <td >
					    	<select style="width:154px" id="nno" name="nno" onfocus="flureq()">
					    	<option>==请选择需求==</option>
					    	</select>
						 </td>
						 
                        <td align="right">项目模块:</td>
					    <td id="xmmokuai"><div id="mokuai" >
							<select  style="width:154px" class="text" id = "modu" name = "modu" onfocus="flumod()">
							<option >==请先选择需求==</option>
							</select>
							</div>
							
						</td>
						<tr>
						<td align="right">项目功能:</td>
					    <td><div id="gongneng" >
							<select style="width:154px" id = "gno" name='gno' onfocus="flufea()">
								<option >==请先选择模块==</option>
							</select>
							</div>
						</td>
						 <td align="right">是否审核:</td>
					     <td><select style="width:154px" name="isok" id='isok' onblur='yanzheng("10");'>
					     	<c:choose>
					     		<c:when test="${jh.isok=='0'}">
					     			<option  value="0">否</option>
								    <option  value="1">是</option>
					     		</c:when>
					     		<c:otherwise>
					     			<option  value="1">是</option>
								    <option  value="0">否</option>
					     		</c:otherwise>
					     	</c:choose>
								 
							</select>
					     </td>
					    <td align="right"></td>
					    <td></td>
					    </tr>
					 
					  <tr>
					    <td align="right">计划备注:</td>
					    <td colspan="3"><textarea name="jbeizhu" id='jbeizhu' onblur='yanzheng("8");' cols="100" rows="8" style="color:gray" >${jh.plOther}</textarea></td>
					    </tr>
					  </table>
			  <br />
				</fieldset>			</TD>
		</TR>
		</TABLE>
	
	
	 </td>
  </tr>
  
  
		
		
		
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="hidden" name="jnoo" value="${jh.plid }">
		<input type="button" name="save"  id='save' value="保存" onclick="save1();" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>		
				</TD>
		</TR>
		</TABLE>
	
	


</div>
</form>
</body>
</html>
