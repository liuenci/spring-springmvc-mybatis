<%--
  Created by IntelliJ IDEA.
  User: cier
  Date: 2018/7/27
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="<c:url value="/easyui/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/easyui/jquery.easyui.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/easyui/locale/easyui-lang-zh_CN.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/easyui/themes/material/easyui.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/easyui/themes/icon.css"/>"/>
    <style type="text/css">
        .by {
            padding: 10px;
        }

        .line {
            margin-top: 10px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#btn-add").linkbutton({
                onClick:function(){
                    $("#win-emp-add").dialog("open");
                }
            });
            $("#btn-edit").linkbutton({
                onClick:function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        var empno = row.empno;
                        $("#win-emp-edit").dialog("open");
                        $.post("update",function (v) {
                            $('#win-emp-edit').dialog("close");
                        });
                    }else{
                        $.messager.alert("提示","请先选中要删除的行")
                    }
                }
            });

            $("#btn-remove").linkbutton({
                onClick:function () {
                    $.messager.confirm("询问","确定要删除吗?",function (v) {
                        if(v){
                            var row = $("#dg").datagrid("getSelected");
                            if (row) {
                                $.post("remove-emp",{
                                    empno:row.empno
                                },function (r) {
                                    if(r.status == 0){
                                        $("#dg").datagrid("reload")
                                    }else{
                                        $.messager.alert("提示",r.msg);
                                    }
                                })
                            }else{
                                $.messager.alert("提示","请先选中要删除的行")
                            }
                        }
                    })
                }
            });
            $("#btn-list").linkbutton({
                onClick:function(){
                    $('#dg').datagrid({
                        url:'get_emp_list',
                        method:'get'
                    });
                    $('#dg').datagrid('reload');
                }
            })
        })
    </script>
    <title>datagrid</title>
</head>
<body>
<table id="dg" class="easyui-datagrid"
       data-options="fit:true,fitColumns:true,autoRowHeight:true,nowrap:false,rownumbers:true,striped:true,toolbar:'#tb',singleSelect:true,pagination:true,pageList:[5,10,15,20],pageSize:5,url:'get_emp_list',method:'get'">
    <thead>
    <tr>
        <th data-options="field:'empno',width:5">员工编号</th>
        <th data-options="field:'ename',width:5">员工姓名</th>
        <th data-options="field:'job',width:5">职位</th>
        <th data-options="field:'hiredate',width:5">入职日期</th>
        <th data-options="field:'sal',width:5">薪水</th>
        <th data-options="field:'comm',width:5">补贴</th>
        <th data-options="field:'dname',width:5">部门名称</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>
<div id="tb">
    <a id="btn-add" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增员工</a>
    <a id="btn-edit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a>
    <a id="btn-remove" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    <a id="btn-list" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">显示所有</a>
    <input class="easyui-searchbox" data-options="label:'搜索',width:200,labelWidth:35,searcher:function(value,name){
        $('#dg').datagrid({
            url:'get_emp_list_by_page',
            queryParams:{ename:value},
            method:'get'
        });
        $('#dg').datagrid('reload');
    }">
</div>
<div class="easyui-dialog" id="win-emp-add" data-options="title:'添加员工',width:500,closed:true,href:'emp_add_win',bodyCls:'by',buttons:[{
    text:'保存',
    iconCls:'icon-ok',
    handler:function(){
        // 提交表单
        $('#f').form({
            onSubmit: function(params){
                // 进行验证
                return $(this).form('validate');
            },
            success:function(v){
                $('#win-emp-add').window('close');
                $('#dg').datagrid('reload');
                $('#f').form('reset');
            }
        }).submit();
    }
},{
    text:'关闭',
    iconCls:'icon-cancel',
    handler:function(){
        $('#win-emp-add').window('close');
    }
}]"></div>
<div class="easyui-dialog" id="win-emp-edit" data-options="title:'编辑员工',width:500,closed:true,href:'win_emp_edit',bodyCls:'by',buttons:[{
    text:'修改',
    iconCls:'icon-ok',
    handler:function(){
        // 提交表单
        $('#f').form({
            onSubmit: function(params){
                // 进行验证
                return $(this).form('validate');
            },
            success:function(v){
                $('#win_emp_edit').window('close');
                $('#dg').datagrid('reload');
                $('#f').form('reset');
            }
        }).submit();
    }
},{
    text:'关闭',
    iconCls:'icon-cancel',
    handler:function(){
        $('#win_emp_edit').window('close');
    }
}]"></div>
</body>
</html>
