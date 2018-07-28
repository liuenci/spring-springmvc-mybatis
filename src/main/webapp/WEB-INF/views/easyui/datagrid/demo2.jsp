<%--
  Created by IntelliJ IDEA.
  User: cier
  Date: 2018/7/26
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>数据表格&&ajax</title>
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
        $(function(){
            $("#add-dept").linkbutton({
                onClick:function(){
                    $("#win-dept-add").dialog("open")
                }
            });

            $("#remove-dept").linkbutton({
                onClick:function () {
                    $.messager.confirm("询问","确定要删除吗?",function(v){
                        if(v){
                            var row = $("#dg").datagrid("getSelected");
                            if (row) {
                                $.post("dept_remove",{
                                    deptno:row.deptno
                                },function (r) {
                                    if (r.status == 0){
                                        $("#dg").datagrid("reload");
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

            $("#dept-list").linkbutton({
                onClick:function () {
                    $('#dg').datagrid({
                        url:'get_dept_list',
                        method:'get'
                    });
                    $('#dg').datagrid('reload');

                }
            })
        })
    </script>
</head>
<body>
<table id="dg" class="easyui-datagrid"
       data-options="fit:true,fitColumns:true,autoRowHeight:true,nowrap:false,rownumbers:true,striped:true,toolbar:'#tb',singleSelect:true,pagination:true,pageList:[5,10,15,20],pageSize:5,url:'get_dept_list',method:'get'">
    <thead>
    <tr>
        <th data-options="field:'deptno',width:5">部门编号</th>
        <th data-options="field:'dname',width:5">部门名称</th>
        <th data-options="field:'loc',width:5">部门地址</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>
<div id="tb">
    <a id="add-dept" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
    <a id="remove-dept" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    <a id="dept-list" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询所有</a>
    <input class="easyui-searchbox" data-options="label:'搜索',width:200,labelWidth:35,searcher:function(value,name){
        $('#dg').datagrid({
            url:'select_depts_by_name',
            queryParams:{dname:value},
            method:'get'
        });
        $('#dg').datagrid('reload');
    }">
</div>
<div class="easyui-dialog" id="win-dept-add" data-options="title:'添加部门',width:500,height:260,closed:true,href:'dept_add_win',bodyCls:'by',buttons:[{
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
                $('#win-dept-add').window('close');
                $('#dg').datagrid('reload');
                $('#f').form('reset');
            }
        }).submit();
    }
},{
    text:'关闭',
    iconCls:'icon-cancel',
    handler:function(){
        $('#win-dept-add').window('close');
    }
}]"></div>
</body>
</html>
