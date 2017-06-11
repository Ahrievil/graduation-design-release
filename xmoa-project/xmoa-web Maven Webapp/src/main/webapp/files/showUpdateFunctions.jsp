<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 
 
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加修改信息</title>
   <link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path %>/css/style_main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path %>/themes/base/jquery.ui.all.css"/>
<link rel="StyleSheet" href="dtree.css" type="text/css" />
<script src="<%=path %>/dtree.js" type="text/javascript" ></script>
 
 
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
</head>
<body>
<form  id="form1"  name="f1" action="role.do?op=updateFunctions" method="post">
<input type="hidden" value="${param.roid }" name="roid"/>
<div style="clear:both; height:15px; line-height:15px;"></div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="main_table03">
  <tr>
    <td width="570" align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50%"><table width="167" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" class="back_main04"><span class="font_bold">角色管理编辑窗口</span></td>
          </tr>
        </table></td>
        <td width="50%" align="right"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="back_main05">
          <tr>
            <td align="center"><a class="link_white" href="role!queryAllRole.action?curPage=1">+ 返回列表</a></td>
          </tr>
        </table></td>
      </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="10" bgcolor="#FFFFFF" class="border03">
          <tr>
            <td align="left">角色名称：
            <input disabled="disabled" type="text" name="roleName" value="${param.roname }" id="textfield2" class="input" /></td>
          </tr>
          <tr>
            <td align="left">
              <c:forEach items = "${requestScope.list }" var = "fun1">
                <script>
				  check = true;
				</script>
              		
              	  <script>
					powerId.add(${fun1.fid},${fun1.pid},'${fun1.fname}',check,${fun1.fid},'fuids');
				  </script>
              </c:forEach>
              <script type = "text/javascript">
              	document.write(powerId);
              	powerId.openAll();
              </script>
            </td>
          </tr>
        </table>
    </td>
    <td width="140" align="right"><table width="100%" border="0" cellspacing="15" cellpadding="0">
 
        <tr>
          <td align="center"><input type="image" src="images/main_btn4.gif"/></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="15" cellpadding="0">
        <tr>
          <td align="center"><img src="images/main_btn8.gif" width="104" height="34" /></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="40" align="center" valign="bottom">&nbsp;</td>
    <td align="right" valign="top">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>