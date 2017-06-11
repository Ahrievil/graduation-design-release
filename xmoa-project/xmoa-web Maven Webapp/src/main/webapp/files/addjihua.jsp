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

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<script language="JavaScript" type="text/javascript">
 	
</script>
<script language="JavaScript" type="text/javascript">
 
  //验证
function save1(){
 			//alert("1111");
 			var jtitle=$("#jtitle").val();
 			var jrbegindate=$("#jrbegindate").val();
 			var jrenddate=$("#jrenddate").val();
 			var jbyper=$("#jbyper").val();	
 			var jmission=$("#jmission").val();	
 			var jleixing=$("#jleixing").val();	
 			var iscomplete=$("#iscomplete").val();	
 			var jbeizhu=$("#jbeizhu").val();
 			var nno=$("#nno").val();
 			var prono=$("#prono").val();
 			var nno=$("#nno").val();
 			var modno=$("#modno").val();
 			var gno=$("#gno").val();
 			var jno=$("#jno").val();
 			
 			if(jtitle.length>10){
 				alert("计划标题不能大于10个字节！");
 				$("#jtitle").attr("value",'');
 				//$("#save").attr("disabled","disabled");
 			}else if(jtitle==''){
 				alert("计划标题不能为空！");
 				//$("#save").attr("disabled","disabled");
 			}else
 		
 			//jrbegindate
 			
  			 if(jrbegindate==''){
 					alert("项目计划开始时间不能为空！");
 				}else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(jrbegindate)){
					alert("格式不正确，应为yyyy-mm-dd");
					$("#jrbegindate").attr("value",'');
				}else
 		
 		
 			//jrenddate
 		
  			 if(jrenddate==''){
 					alert("项目计划结束时间不能为空！");
 				}else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(jrenddate)){
					alert("格式不正确，应为yyyy-mm-dd");
					$("#jrenddate").attr("value",'');
				}else
 		
 			//jbyper
 			
 			if(jbyper==''){
 				alert(jbyper);
 			}else
 	
 			//jmission
 			
 			if(jmission==''){
 				alert(jmission);
 			}else
 
 			//jleixing
 			
 			if(jleixing==''){
 				alert(jleixing);
 			}else

 			//iscomplete
 			
 			if(iscomplete==''){
 				alert(iscomplete);
 			}else
 			
 			
 			//项目，需求，模块，功能，前置计划
 			if(prono==''){
 				alert(prono);
 			}else 
 
 			//jbeizhu
 			
 			if(jbeizhu.length>300){
 				alert("项目备注不能大于300个字节！");
 				$("#jbeizhu").attr("value",'');
 			}else{
 				fom.action="plan.do?op=insert";
	  			fom.submit();
 			}
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
																		}
												
																	}
																}
															};
																	xmlHttp.send();
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
																		}
												
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>
													
													<script>
														function flupro(){
															
														
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
															xmlHttp.open("get", "pro.do?op=loadAllName&v=" + Math.random(),
																	true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	var x = document.getElementById("prono");
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
																		}
// 																	    if(x.length>0){
// 																	    	var tt = document.getElementById("xuqiu");
// 																	    }
												
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>	
													
													 <script>
														function flureq(){
															var pn = document.getElementById("prono").value;
															var x = document.getElementById("xuqiu1");
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
															xmlHttp.open("get", "req.do?op=loadAllName&prname="+pn+"&v=" + Math.random(),
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
																		}
																	}
																}
															};
																	xmlHttp.send();
																	}
													</script>		
														
														<script>
														function flumod(){
															
															var pn = document.getElementById("xuqiu1").value;
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
															var x = document.getElementById("feature");
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
  <form action="" method="post"  name="fom"  id="fom" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >项目计划添加页面</th>
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
		<td class="TablePanel"><select name="prono" id="prono" onchange="flureq()" onmouseover="flupro()">
		  	  <option  selected="selected">请选择项目</option>
            </select></td>
			<td class="TablePanel">&quot;</td>
		</tr>
			<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加计划</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="15%">计划标题:</td>
					    <td width="35%"><input name='jtitle' id='jtitle' onblur='yanzheng("1");' type="text" class="text" style="width:154px"  />
				        <span class="red">*</span></td>
					    <td width="16%" align="right" nowrap="nowrap">前置任务计划:</td>
					    <td width="34%">
					     <div id='jihua'>
					         <select style="width:154px" id = 'plHeadPlan' name = "plHeadPlan" onmouseover="fluheadplan()">
					    		<option >请先选择功能</option>
							</select>
						  </div>
						</td>
					  </tr>
					    
					    
					  <tr>
					    <td nowrap="nowrap" align="right">计划开始时间:</td>
					    <td><input class="text" name='jrbegindate' id='jrbegindate' onblur='yanzheng("2");' style="width:154px" /></td>
					    <td align="right">计划结束时间:</td>
					    <td><input class="text" name='jrenddate' id='jrenddate' onblur='yanzheng("3");' style="width:154px"  /></td>
					  </tr>
					  <tr>
					    <td align="right">任务执行人:</td>
					    <td>
							<select name="jbyper" id='jbyper' onblur='yanzheng("4");' onmouseover="fluworker()" style="width:154px" class="text">
							 	<option selected="selected">请选择任务执行人</option>
							</select>
						</td>
					    <td align="right">优先级:</td>
					    <td>
							<select name="jmission" id='jmission' onblur='yanzheng("5");' style="width:154px">
							<option >请选择优先级</option>
							  <option value="暂不">暂不</option>
                              <option value="一般">一般</option>
                              <option value="需要">需要</option>
                              <option value="急">急</option>
                              <option value="很急">很急</option>
							</select>
						</td>
					  </tr>
					  <tr>
					    <td align="right">任务类型:</td>
						<td>
							<select id='jleixing' name="jleixing" onblur='yanzheng("6");' style="width:154px" class="text" >
								 <option selected="selected">请选择任务类型</option>
								<option value="测试类型0">测试类型0</option>
								<option value="测试类型1">测试类型1</option>
								<option value="测试类型2">测试类型2</option>
								<option value="测试类型3">测试类型3</option>
							</select>
						</td>
					    <td align="right">状态:</td>
					    <td>
								<select id='iscomplete'  name="iscomplete" onblur='yanzheng("7");' style="width:154px" class="text">
								  <option selected="selected">请选择完成状态</option>
								  <option value="0" >未开始</option>
								<!--  
								  <option value="1" >进行中</option>
								  <option value="2" >已完成</option>
								   -->
								</select>
						</td>
					  </tr>
					  <tr>
					   <td align="right">项目需求:</td>
					    <td>
						    <div id="xuqiu">
						    	<select style="width:154px" id = "xuqiu1" name = "xuqiu1" onchange="flumod()" >
						    	<option selected="selected">请先选择项目</option>
						    	</select>
						    </div>
						</td>
						 
                        <td align="right">项目模块:</td>
					    <td>
						    <div id="mokuai" >
								<select  style="width:154px" class="text" id = "modu" name = "modu" onchange="flufea()" >
								<option selected="selected">请先选择需求</option>
								</select>
							</div>
							
						</td>
					    </tr>
					 <tr>
					 <td align="right">项目功能:</td>
					    <td><div id="gongneng" >
							<select style="width:154px" id = "feature" name = "feature">
								<option selected="selected">请先选择模块</option>
							</select>
							</div>
						</td>
					 </tr>
					  <tr>
					    <td align="right">计划备注:</td>
					    <td colspan="3"><textarea id='jbeizhu' name="jbeizhu" onblur='yanzheng("8");' cols="100" rows="8" ></textarea></td>
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
			<input type="button" name="save" id='save' value="保存" onclick="save1();"  class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
		</TR>
		</TABLE>
	
	


</div>
</form>
</body>
</html>
