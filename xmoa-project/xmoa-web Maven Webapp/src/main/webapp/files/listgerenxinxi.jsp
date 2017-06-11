<%@ page language="java" import="java.util.*,com.ty.xmoa.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb18030" />
<title>项目管理系统 </title>
<link rel="stylesheet" rev="stylesheet" href="<%=path %>/css/style.css" type="text/css" media="all" />
  <script type="text/javascript" src="<%=basePath %>jquery.js"></script>


<script>
	var index=0;
	function yanzheng(n){
 			//alert("dsf");
 			
 			$(document).ready(function (){
 			
 				if(n=='1'){
 					var pas=$("#ppassword").val();
 					//alert(pas.length);
 					if(pas.length>10){
 						if($("#d1").html()==""){
 							index++;
 						}
 						$("#d1").html("<font color='red'>密码长度最多为10位！</font>");
 						
 					}else if(pas.length==0){
 						if($("#d1").html()==""){
 							index++;
 						}
 						$("#d1").html("<font color='red'>密码不能为空！</font>");
 					}else{
 						if(index>0&&$("#d1").html()!=""){
 							index--;
 						}
 						$("#d1").html("<font color='#07925E'>密码可用！</font>");
 						
 					}
 				}else if(n=='2'){
 					var emai=$("#pemail").val();
 					//alert(emai.length);
 					if(emai.length>30){
 						if($("#d2").html()==""){
 							index++;
 						}
 						$("#d2").html("<font color='red'>邮箱地址最多30位！</font>");
 						
 					}else{
 						if(index>0&&$("#d2").html()!=""){
 							index--;
 						}
 						$("#d2").html("");
 						
 					}
 				}else if(n=='3'){
 					var tel=$("#ptelephone").val();
 					if(tel.length>15){
 						if($("#d3").html()==""){
 							index++;
 						}
 						$("#d3").html("<font color='red'>联系电话最多15位！</font>");
 					}else if(!/^[0-9]*$/.test(tel)){
 						if($("#d3").html()==""){
 							index++;
 						}
 						$("#d3").html("<font color='red'>联系电话必须为纯数字！</font>");
 					}else{
 						if(index>0&&$("#d3").html()!=""){
 							index--;
 						}
 						$("#d3").html("");
 						
 					}
 				}else if(n=='4'){
 					var add=$("#paddr").val();
 					if(add.length>15){
 						if($("#d4").html()==""){
 							index++;
 						}
 						$("#d4").html("<font color='red'>居住地址最多15位！</font>");
 					}else{
 						if(index>0&&$("#d4").html()!=""){
 							index--;
 						}
 						$("#d4").html("");
 					}
 				}else if(n=='5'){
 					var pb=$("#pbankName").val();
 					if(pb.length>10){
 						if($("#d5").html()==""){
 							index++;
 						}
 						$("#d5").html("<font color='red'>银行名称最多10位！</font>");
 					}else{
 						if(index>0&&$("#d5").html()!=""){
 							index--;
 						}
 						$("#d5").html("");
 					}
 				}else if(n=='6'){
 					var pbu=$("#pbankuser").val();
 					//alert(pbu);
 					if(pbu.length>30){
 						if($("#d6").html()==""){
 							index++;
 						}
 						$("#d6").html("<font color='red'>银行账户最多10位！</font>");
 					}else if(!/^[0-9]*$/.test(pbu)){
 						if($("#d6").html()==""){
 							index++;
 						}
 						if(pbu.length!=0){
 							$("#d6").html("<font color='red'>银行账户必须为纯数字！</font>");
 						}
 					}else{
 						if(index>0&&$("#d6").html()!=""){
 							index--;
 						}
 						$("#d6").html("");
 					}
 				}else if(n=='7'){
 					var pde=$("#pdescription").text();
 					if(pde.length>150){
 						if($("#d7").html()==""){
 							index++;
 						}
 						$("#d7").html("<font color='red'>个人描述最多150字！</font>");
 					}else{
 						if(index>0&&$("#d7").html()!=""){
 							index--;
 						}
 						$("#d7").html("");
 						
 					}
 				}
				//alert(index);
 			});
 		}
</script>
</head>

<body class="ContentBody">

  <script type="text/javascript">
  	
  	$(document).ready(function (){
  		
  		$("#saveb").click(function(){
  			//alert(index);
  			if(index==0){
  				$("#fom").attr("action","user.do?op=savePersonInfo");
  			}else{
  				alert("资料填写不正确，请修改！");
  			}
  			
  		});
  	});
  
  </script>
  <form action="user.do?op=savePersonInfo" method="post"  name="form1" id='fom'>
		<div class="MainDiv">
			<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  				<tr>
      				<th class="tablestyle_title" >员工基本信息查询</th>
  				</tr>
 				 <tr>
   					 <td class="CPanel">
					 <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
						<tr>
							<td align="left"><br /></td>
						</tr>
				 		<tr>
							<td width="100%">
							<fieldset style="height:100%;">
							<legend>员工信息</legend>
					  		<table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  		<tr>
					    		<td align="right" width="15%">员工唯一编号:</td>
					    		<td width="35%"><input name='pno1' type="text" class="text" style="width:154px" disabled='disabled' value="${sessionScope.currentuser.usid}" />
				        					<input name='pno' type="hidden" class="text" style="width:154px"  value="${sessionScope.currentuser.usid}" />
				        		<span class="red">*</span></td>
					   		    <td width="16%" align="right" nowrap="nowrap">密码:</td>
					   		    <td width="17%"><input type='password' class="text" id='ppassword' name='ppassword' onblur='yanzheng("1")' style="width:154px" value="${sessionScope.currentuser.upwd}"/></td><td width='17%'><div id='d1'></div></td>
					 	    </tr>
					    
					    
						  <tr>
						    <td nowrap="nowrap" align="right">真实姓名:</td>
						    <td><input class="text" name='pname1' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.uname}"/>
						    <input class="text" type='hidden' name='pname' style="width:154px"  value="${sessionScope.currentuser.uname}"/></td>
						    <td align="right">性别:</td>
						    <td><input class="text" name='psex1' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.usex}"/>
						    	<input class="text" type='hidden' name='psex' type='hidden' value="${sessionScope.currentuser.usex}"/></td>
						  </tr>
					  
						  
						  <tr>
						    <td align="right">出生日期:</td>
						    <td><input class="text" name='pbirthday1' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.ubirthdate}"/>
						    <input class="text" name='pbirthday'  type='hidden' style="width:154px" value="${sessionScope.currentuser.ubirthdate}"/></td>
						    <td align="right">身份证号码:</td>
						    <td><input class="text" name='pid1' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.uidNum}"/>
						    <input class="text" name='pid' type='hidden' style="width:154px"  value="${sessionScope.currentuser.uidNum}"/></td>
						  </tr>
						  <tr>
						    <td align="right">电子邮箱:</td>
						    <td><table><tr><td><input class="text" name='pemail' id='pemail' style="width:154px" onblur='yanzheng("2")' value="${sessionScope.currentuser.uemail}"/></td><td><div id='d2'></div></td></tr></table></td>
						    <td align="right">电话号码:</td>
						    <td><input class="text" name='ptelephone' id='ptelephone' onblur='yanzheng("3")' style="width:154px" value="${sessionScope.currentuser.utell}"/></td><td><div id='d3'></div></td>
						  </tr>
						  <tr>
						    <td align="right">居住地址:</td>
						    <td><table><tr><td><input name="paddr" id='paddr'  onblur='yanzheng("4")' type="text" size="30" value='${sessionScope.currentuser.uadd}'/></td><td><div id='d4'></div></td></tr></table></td>
						    <td align="right">职位:</td>
						    <td><input class="text" name='zwname' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.upost}"/>
						        <input type='hidden' name='zwno' value="${sessionScope.currentuser.upost}"/></td>
						  </tr>
						  <tr>
						    <td align="right">员工类型:</td>
						    <td><input class="text" name='plei1' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.ustatus}"/>
						    	<input class="text" name='plei' type='hidden' value="${sessionScope.currentuser.ustatus}"/></td>
						    <td align="right">银行名称:</td>
						    <td><input class="text" name='pbankName' id='pbankName' onblur='yanzheng("5")' style="width:154px" value="${sessionScope.currentuser.ubankName}"/>
						    </td><td><div id='d5'></div></td>
						  </tr>
						  <tr>
						    <td align="right">银行账户:</td>
						    <td><table><tr><td><input class="text" name='pbankuser' id='pbankuser' onblur='yanzheng("6")' style="width:154px" value="${sessionScope.currentuser.ubankAcc}"/></td><td><div id='d6'></div></td></tr></table></td>
						    <td align="right">基本工资:</td>
						    <td><input class="text" name='pfsalary' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.upay}"/>
						    <input class="text" name='pfsalary' type='hidden' style="width:154px"  value="${sessionScope.currentuser.upay}"/></td>
						  </tr>
						  <tr>
						    <td align="right">奖金:</td>
						    <td><input class="text" name='pgsalary1' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.ureward}"/>
						    <input class="text" name='pgsalary' type='hidden' style="width:154px"  value="${sessionScope.currentuser.ureward}"/></td>
						    <td align="right">其它补助金:</td>
						    <td><input class="text" name='posalary' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.upaje}"/>
						    <input class="text" name='posalary' type='hidden' style="width:154px"  value="${sessionScope.currentuser.upaje}"/></td>
						  </tr>
						  <tr>
						    <td align="right">入职时间:</td>
						    <td><input class="text" name='pbydate' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.uhiredate}"/>
						    <input class="text" name='pbydate' type='hidden' style="width:154px" value="${sessionScope.currentuser.uhiredate}"/></td>
						     <td align="right">当前角色:</td>
						    <td><input class="text" name='juename' style="width:154px" disabled='disabled' value="${sessionScope.currentuser.urole}"/>
						         <input class="text" type='hidden' name='jueno' value="${sessionScope.currentuser.urole}"/></td>
						  
						    </tr>
						 
					  	  <tr>
						    <td align="right">描述:</td>
						    <td colspan="3"><textarea name="pdescription" id='pdescription' onblur='yanzheng("7")'  cols="100" rows="8">${sessionScope.currentuser.uother}</textarea></td><td><div id='d7'></div></td>
					     </tr>
					  </table>
			 				 <br />
				</fieldset>			
				</td>
			
			</tr>
		</table>
		 </td>
 		 </tr>
		<tr>
			<td colspan="2" align="center" height="50px">
			<input type="submit" id='saveb' value="保存" class="button"/>　
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></td>
		</tr>
	</table>
</div>
</form>
</body>
</html>

