<%--
  Created by IntelliJ IDEA.
  User: cier
  Date: 2018/7/27
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form id="f" method="post" action="dept_save">
    <div class="line">
        <input name="deptno" class="easyui-textbox"
               data-options="required:true, label:'部门编号', width:250, labelWidth:100">
    </div>
    <div class="line">
        <input name="dname" class="easyui-textbox"
               data-options="required:true, label:'部门名称', width:250, labelWidth:100">
    </div>
    <div class="line">
        <input name="loc" class="easyui-textbox" data-options="required:true, label:'地址', width:450, labelWidth:100,
				multiline:true">
    </div>
</form>
</body>
</html>
