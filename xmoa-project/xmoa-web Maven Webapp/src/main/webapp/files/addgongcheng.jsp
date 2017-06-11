<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editxiangmu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" type="text/javascript">

 	
</script>
<script language="JavaScript" type="text/javascript">
 //验证
 function save1(){
 			var proname=$("#proname").val();
 			var clientno=$("#clientno").val();
 			var promoney=$("#promoney").val();
 			var pronum=$("#pronum").val();
 			var proManager=$("#proManager").val();
 			var proidcomplete=$("#proidcomplete").val();
 			var prozmoney=$("#prozmoney").val();
 			var probeginDate=$("#probeginDate").val();
 			var proendDate=$("#proendDate").val();
 			var promission=$("#promission").val();
 			var probeizhu=$("#probeizhu").val();
 			
 		if(proname.length>10){
 				alert("项目名称不能大于10个字节！");
 				$("#proname").attr("value",'');
 			}else if(proname==''){
 				alert("项目名字不能为空！");
 			}else if(clientno==''){
 				alert("所属单位必须选择！");
 			}else if(!/^[0-9]*$/.test(promoney)){
 				alert("项目金额必需为数字！");
 				$("#promoney").attr("value",'');
 			}else if(promoney.length>9){ 
 				alert("项目金额数目过大，请核对！");
 				$("#promoney").attr("value",'');
 			}else 
 			//if(promoney==''){
 			//	alert("项目金额不能为空！");
 			//}else 
 			 if(!/^[0-9]*$/.test(pronum)){
 				alert("人数必需为数字！");
 				$("#pronum").attr("value",'');
 			}else if(pronum.length>4){
 				alert("输入的人数过大，请核对！");
 				$("#pronum").attr("value",'');
 			}else 
 			//if(pronum==''){
 			//	alert("项目开发人数不能为空！");
 			//}else
 			 if(proManager==''){
 				alert("项目经理必须选择！");
 			}else if(proidcomplete==''){
 				alert("项目完成状态必须选择！");
 			}else if(!/^[0-9]*$/.test(prozmoney)){
	 				alert("项目总成本必需为数字！");
	 				$("#prozmoney").attr("value",'');
	 		}else if(prozmoney.length>9){
	 				alert("输入的项目总成本过大，请选择！");
	  				$("#prozmoney").attr("value",'');
	 		}else if(prozmoney==''){
 					alert("项目总成本不能为空！");
 			}else
 			
 			//var probeginDate=$("#probeginDate").val();
  			 if(probeginDate==''){
 					alert("项目计划开始时间不能为空！");
 			}else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(probeginDate)){
					alert("格式不正确，应为yyyy-mm-dd");
					$("#probeginDate").attr("value",'');
			}else
			
 			//var proendDate=$("#proendDate").val();
  			if(proendDate==''){
 					alert("项目计划开始时间不能为空！");
 			}else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(proendDate)){
					alert("格式不正确，应为yyyy-mm-dd");
					$("#proendDate").attr("value",'');
			}else if(promission==''){
 				alert("项目优先级必须选择！");
 			}else if(probeizhu.length>300){
 				alert("项目备注不能大于300个字节！");
 				$("#probeizhu").attr("value",'');
 			}else{
 				form1.action="pro.do?op=addPro";
 				form1.method="post";
	  			form1.submit();
 			}
 }

</script>

</head>

<body class="ContentBody">
  <form action="" method="post" name="form1"  >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >项目添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		<!--  
		<input type="button" name="save"  id='save' value="保存" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
		-->
		</td></tr>
		<tr align="center">
          <td class="TablePanel">${pro.prname }</td>
		  </tr>
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>项目信息</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td nowrap align="right" width="15%">项目名称:</td>
					    <td width="35%"><input name='proname' id='proname' type="text" class="text" style="width:154px;" onblur="yanzheng('1');" />
					   	<font color="red" id="d1">*</font></td>
				        	
					    <td nowrap align="right" width="18%">所属单位:</td>
						<td width="35%">
						<select id="clientno" name="clientno" style="width:154px" onblur='yanzheng("2");' onmouseover="flucus()">
								<option value='abc' >请选择单位</option>
<!-- 								<c:forEach items="${client}"  var="cl"> -->
<!-- 									<option value="${cl.clientno}" > ${cl.clientname} </option> -->
<!-- 								</c:forEach> -->
									<script>
														function flucus(){
															
														
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
															xmlHttp.open("post", "cus.do?op=getAllInfo&v=" + Math.random(),
																	true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	var x = document.getElementById("clientno");
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
								</select>
							<font color="red" id="d2">*</font></td>
					    </tr>
						
						<tr>
					    <td nowrap align="right" width="15%">项目金额:</td>
					    <td width="35%"><input name='promoney' id='promoney' type="text" class="text" style="width:154px" onblur='yanzheng("3");' /><font color="red" id="d3"></font>				        </td>
				         <td nowrap align="right" width="18%">开发人数:</td>
					    <td width="35%"><input name='pronum' type="text" id='pronum' class="text" style="width:154px" onblur='yanzheng("4");' /><font color="red" id="d4"></font>				        </td>	
						</tr>
						<tr>	
							<td nowrap align="right" width="15%">项目经理:</td>
							<td width="35%">
								<select id="proManager" name="proManager" style="width:154px" onmouseover="fluper()" onblur='yanzheng("5");'>
								<option selected="selected" >请选择项目经理</option>
								<script>
														function fluper(){
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
															xmlHttp.open("post", "user.do?op=loadAllMgr&v=" + Math.random(),true);
															xmlHttp.onreadystatechange = function() {
																if (xmlHttp.readyState == 4 && xmlHttp.status==200) {
																	var json = eval("("+xmlHttp.responseText+")");
																	var x = document.getElementById("proManager");
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
								</select>							
							<font color="red" id="d5"></font></td>
							
							<td nowrap align="right" width="18%">完成状态:</td>
							<td width="35%">
							<select id="proidcomplete" name="proidcomplete" style="width:154px" onblur='yanzheng("6");'>
								<option selected="selected" >请选择完成状态</option>
								<option value="未开始" >未开始</option>
								<!-- 
								<option value="1" >进行中</option>
								<option value="2" >已完成</option>
								 -->
							</select>							
							<font color="red" id="d6"></font></td>
				        </tr>
						<tr>
						  <td nowrap="nowrap" align="right">预算总成本:</td>
						  <td><input id='prozmoney' name='prozmoney' type="text" class="text" style="width:154px" onblur='yanzheng("7");' /><font color="red" id="d7"></font>                         </td>	
							<td nowrap="nowrap" align="right">计划开发日期:</td>
							<td><input name='probeginDate' id='probeginDate' type="text" class="text" style="width:154px" onblur='yanzheng("8");'/><font color="red" id="d8"></font>                           </td>
						</tr>
						<tr>
						  <td nowrap="nowrap" align="right">计划完成日期:</td>
						  <td><input name='proendDate' id='proendDate' type="text" class="text" style="width:154px" onblur='yanzheng("9");'/><font color="red" id="d9"></font></td>
						  <td  align="right" >优先级:</td>
						  <td ><select name="promission" id='promission' style="width:154px" >
						  		<option selected="selected" >请选择优先级</option>
                              <option value="暂不">暂不</option>
                              <option value="一般">一般</option>
                              <option value="需要">需要</option>
                              <option value="急">急</option>
                              <option value="很急">很急</option>
                          </select><font color="red" id="d10"></font></td>
						</tr>
					  <tr>
					    <td  width="15%" nowrap align="right">备注:</td>
					    <td colspan="3"><textarea id='probeizhu' name="probeizhu" cols="100" rows="10" style="" onblur='yanzheng("11");'></textarea><font color="red" id="d11"></font></td>
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
			<input type="hidden" name="prono" value="${pro.prid }">
			<input type="hidden" name="refresh" value="${sessionScope.check }"> 
			<input type="button" name="save"  id='saved' onclick="save1();" value="保存" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
			</TD>
		</TR>
		</TABLE>
	
	


</div>
</form>
</body>
</html>
