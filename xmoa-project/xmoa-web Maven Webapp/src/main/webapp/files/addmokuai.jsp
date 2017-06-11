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
    
    <title>My JSP 'addmokuai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />

<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<script language="JavaScript" type="text/javascript">
 	
 //保存
 $(document).ready(function (){
 	 $("#save").click(function (){
	 	var r=confirm("确认保存？");
		if (r==true)
	  	{
	  		fom.action="mod.do?op=insertMod";
	  		fom.submit();
	  	}else{
	  		return;
	 	 }
	 })
 })

 	
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
																	var x = document.getElementById("prono1");
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
															
															var pn = document.getElementById("prono1").value;
															var x = document.getElementById("xuqiu");
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
													
<script language="JavaScript" type="text/javascript">
 	
  //验证
 	
 
 //获取需求


//添加模块
var rid=2;
function tianjia(){
//alert("---");
	document.getElementById('t1').insertRow(rid+2);
	var x=document.getElementById('t1').rows[rid+2];
	x.insertCell(0);
	var x1=document.getElementById('t1').rows[rid+2].cells;
	x1[0].innerHTML="<fieldset style='height:100%;'><legend>模块"
					+rid+"</legend><table border='0' cellpadding='2' cellspacing='1'style='width:100%'>"
					    +"<tr>"
					       +"<td nowrap align='right' width='13%'>模块名字:</td>"
					       +"<td width='46%'><input name='moname' id='moname' class='text' onblur='yanzheng("+1+");' style='width:154px' type='text' size='40' />"
				           +"<span class='red'> *</span></td>"
					       +"<td align='right' width='9%'></td>"
					       +"<td width='32%'>&nbsp;</td>"
					    + "</tr>"
					    
					    +"<tr>"
					       +"<td nowrap align='right'>模块标识:</td>"
					       +"<td><input name='mobiaozhi' id='mobiaozhi' onblur='yanzheng("+2+");' class='text' style='width:154px'/></td>"
					       +"<td align='right' >优先级:</td>"
						   +" <td>"
 							+"<select name='modmission' id='modmission' onblur='yanzheng("+3+");' style='width:154px' >"
								 +"<option >请选择优先级</option>"
	                             +"<option  value='0'>暂不</option>"
	                             +"<option  value='1'>一般</option>"
	                             +"<option  value='2'>需要</option>"
	                             +"<option  value='3'>急</option>"
	                             +"<option  value='4'>很急</option>"
							+"</select>"
                           +"</td>"
					     +"</tr>"
					     
					     +"<tr>"
					   	 	+" <td align='right'>所属项目:</td>"
					   	 	+"<td><select name='prono' id='prono"+rid+"' onblur='yanzheng("+4+");' onchange='huoquxuqiu("+rid+");' style='width:154px'>"
                         		 +"<option  selected='selected'>请选择项目</option>"
                        		 //+"<option >请选择项目</option>"
					    	+"<c:forEach items='${requestScope.listpro}'  var='pro'>"
                          		 +" <option value='${pro.prono }'>${pro.proname }</option>"
                            +" </c:forEach>"
                       			 +"</select>"
                       	    +"</td>"
					   		
					   	    +"<td nowrap align='right'>所属需求:</td>"
					        +"<td><div id='nno"+rid+"'class='sss'><select style='width:154px'>"
                            +"  <option  selected='selected'>请先选择项目</option>"
                            +"</select></div>"
                            +"</td>"
					 	 +"</tr>"
					 	 
						 +" <tr>"
					  		+" <td nowrap align='right' height='120px'>模块描述:</td>"
					  		+" <td colspan='3'><textarea id='moddescription' name='moddescription' onblur='yanzheng("+5+");' rows='5' cols='80'></textarea></td>"
					   	 +"</tr>"
					   	 
					  	 +" <tr>"
					        +"<td nowrap align='right' height='120px'>需求描述:</td>"
					        +"<td colspan='3'>"
					        +"<textarea id='modneedDescription' name='modneedDescription' onblur='yanzheng("+6+");' rows='5' cols='80'></textarea></td>"
					    +"</tr>"
					 +"</table>"
			 		+"<br/>"
				+"</fieldset>	";
				rid++;
	//alert("添加模块");
}

$(document).ready(function(){
	$("#del").click(function(){
		if(rid==1){
			alert("没有可删除的模块！！！");
		}else{
			var v=confirm("确认删除模块"+(rid-1)+"!");
			if(v==true){
				rid++;
				document.getElementById('t1').deleteRow();
			}
		}
	});
});	


</script>

<style type="text/css">
	<!--
	.atten {font-size:12px;font-weight:normal;color:#F00;}
	-->
</style>
</head>

<body class="ContentBody">
  <form action="" method="post" name="fom" id="fom"  >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >项目模块添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0"  id='t1' cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		<!--  
		<input type="button" name="save"  id='save' value="保存" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
		-->
		</td></tr>

		
		
		<tr align="center">
         <td class="TablePanel" >
         		项目模块添加页面
		  	  </td>
		  </tr>
		  <tr align="center">
		 	<td>
		  		<input type="button" value="添加模块"  onclick="tianjia();" class="right-button07">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="删除模块" id='del' onclick="shanchu();" class="right-button07">
			</td>
		</tr>
		<TR id="model">
			<TD width="100%">
			<div class="MainDiv" id='hello1'>
				<fieldset style="height:100%;">
				<legend class='model'>模块一</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="13%">模块名字:</td>
					    <td width="46%"><input name="moname"  id="moname" onblur='yanzheng("1");' class="text" style="width:154px" type="text" size="40" />
				        <span class="red"> *</span></td>
					    <td align="right" width="9%">&nbsp;</td>
					    <td width="32%">&nbsp;</td>
					    </tr>
					  <tr>
					    <td nowrap align="right">模块标识:</td>
					    <td><input name="mobiaozhi" id="mobiaozhi" onblur='yanzheng("2");' class="text" style="width:154px" /></td>
					    <td  align="right" >优先级:</td>
						  <td >
 							<select name="modmission" id='modmission' onblur='yanzheng("3");' style="width:154px" >
							 <option >请选择优先级</option>
                             <option id="xxx" value="暂不">暂不</option>
                             <option id="xxx"  value="一般">一般</option>
                             <option id="xxx" value="需要">需要</option>
                             <option id="xxx"  value="急">急</option>
                             <option id="xxx" value="很急">很急</option>
							</select>
                          </td>
					  </tr>
					   <tr>
					    <td align="right">所属项目:</td>
					    <td><select id="prono1" name="prono" onmouseover="flupro()" style="width:154px" onchange="flureq()">
					    	 <option >请选择项目</option>
                          </select>                        </td>
					     <td nowrap="nowrap" align="right">所属需求:</td>
					    <td id="xmxuqiu">
					    	<div id="nno1" >
					      		<select  style="width:154px" id = "xuqiu" name = "xuqiu"> 
					       			 <option selected="selected">请先选择项目</option>
					      		</select>
					    	</div> 
					  	 </td>
					   
					  </tr>
					  <tr>
					    <td nowrap align="right" height="120px">模块描述:</td>
					    <td colspan="3"><textarea id="moddescription" name="moddescription" onblur='yanzheng("5");' rows="5" cols="80"></textarea></td>
					    </tr>
						<tr>
					    <td nowrap align="right" height="120px">需求描述:</td>
					    <td colspan="3">
							<textarea id="modneedDescription" name="modneedDescription" onblur='yanzheng("6");' rows="5" cols="80"></textarea>						</td>
					    </tr>
					  </table>
			 <br />
				</fieldset>	
				<div class='hello' id='hell'></div>	</div>
					
			</TD>
		</TR>
		<TR  id="newmodel">
			
		</TABLE>
		<input type="hidden" name="refresh" value="${sessionScope.check }"> 
		<input type='hidden' value='' name='moname1' id='moname1'>
		<input type='hidden' value='' name='mobiaozhi1' id='mobiaozhi1'>
		<input type='hidden' value='' name='modmission1' id='modmission1'>
		<input type='hidden' value='' name='nno1' id='nno1'>
		<input type='hidden' value='' name='moddescription1' id='moddescription1'>
		<input type='hidden' value='' name='modneedDescription1' id='modneedDescription1'>
	
	 </td>
  </tr>
  

		
		
		
		
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="hidden" name="refresh" value="${sessionScope.check }">
			<input type="button" name="save"  id='save' value="保存" class="button" />　			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
			</TD>
		</TR>
		</TABLE>
	
	


</div>
</form>
</body>
</html>
