<%--
  Created by IntelliJ IDEA.
  User: cier
  Date: 2018/7/26
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>数据表格</title>
    <script type="text/javascript" src="<c:url value="/easyui/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/easyui/jquery.easyui.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/easyui/locale/easyui-lang-zh_CN.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/easyui/themes/default/easyui.css"/>"/>
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
            $("#dg").datagrid({
                onClickRow: function (index, row) {
                    console.log(index);
                    console.log(JSON.stringify(row));
                }
            });

            $("#get").linkbutton({
                onClick: function () {
                    var rows = $("#dg").datagrid("getSelections");
                    console.log(JSON.stringify(rows));
                }
            });
        })
    </script>
</head>
<body>
<table id="dg" class="easyui-datagrid"
       data-options="fit:true,fitColumns:true,autoRowHeight:true,nowrap:false,rownumbers:true,striped:true,toolbar:'#tb',singleSelect:true">
    <thead>
    <tr>
        <th data-options="field:'no',width:5">学号</th>
        <th data-options="field:'name',width:10">姓名</th>
        <th data-options="field:'sex',width:8,formatter:function(value,row,index){
            var boy = '<c:url value='/images/ok.png'/>';
            var girl = '<c:url value='/images/cancel.png'/>';
            if(value == '男'){
                return '<img src='+boy+'>';
            } else{
                return '<img src='+girl+'>';
            }
        }">性别
        </th>
        <th data-options="field:'address',width:25,styler:function(value,row,index){
            if(value.length < 20){
                return 'color:red;font-weight:bold;font-style:italic'
            }
        }">地址
        </th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1001</td>
        <td>张三丰</td>
        <td>男</td>
        <td>湖南株洲湖南工业大学</td>
    </tr>
    <tr>
        <td>1002</td>
        <td>张三丰</td>
        <td>男</td>
        <td>湖南株洲湖南工业大学</td>
    </tr>
    <tr>
        <td>1003</td>
        <td>张三丰</td>
        <td>女</td>
        <td>湖南株洲湖南工业大学湖南株洲湖南工业大学湖南株洲湖南工业大学湖南株洲湖南工业大学</td>
    </tr>
    <tr>
        <td>1004</td>
        <td>张三丰</td>
        <td>女</td>
        <td>湖南株洲湖南工业大学湖南株洲湖南工业大学湖南株洲湖南工业大学湖南株洲湖南工业大学</td>
    </tr>
    </tbody>
</table>
<div id="tb">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-help'">帮助</a>
    <input class="easyui-searchbox" data-options="label:'搜索',width:200,labelWidth:35"/>
    <a id="get" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">获取选择的行</a>
</div>
</body>
</html>
