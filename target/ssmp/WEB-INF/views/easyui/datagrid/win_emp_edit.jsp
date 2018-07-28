<%--
  Created by IntelliJ IDEA.
  User: cier
  Date: 2018/7/27
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="<c:url value="/easyui/jquery.min.js"/>"></script>
    <title></title>
</head>
<body>
<form id="f" method="post" action="emp_save">
    <div class="line">
        <input name="ename" class="easyui-textbox"
               data-options="required:true, label:'员工姓名', width:250, labelWidth:100">
    </div>
    <div class="line">
        <input name="job" class="easyui-textbox" data-options="required:true, label:'职位', width:250, labelWidth:100">
    </div>
    <div class="line">
        <input name="hiredate" class="easyui-textbox" data-options="required:true, label:'入职日期', width:250, labelWidth:100">
    </div>
    <div class="line">
        <input name="sal" class="easyui-textbox" data-options="required:true, label:'薪水', width:250, labelWidth:100">
    </div>
    <div class="line">
        <input name="comm" class="easyui-textbox" data-options="required:true, label:'补贴', width:250, labelWidth:100">
    </div>
    <div class="line">
        <input id="cc" name="dname" data-options="required:true, label:'部门名称', width:250, labelWidth:100">
    </div>
    <script type="text/javascript">
        $('#cc').combobox({
            url:'get_dept_list_no_page',
            valueField:'deptno',
            textField:'dname'
        });
    </script>
</form>
</body>
</html>
