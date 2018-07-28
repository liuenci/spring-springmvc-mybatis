<%--
  Created by IntelliJ IDEA.
  User: cier
  Date: 2018/7/27
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript"
            src="<c:url value="/easyui/jquery.min.js"/>"></script>
    <script type="text/javascript"
            src="<c:url value="/easyui/jquery.easyui.min.js"/>"></script>
    <script type="text/javascript"
            src="<c:url value="/easyui/locale/easyui-lang-zh_CN.js"/>"></script>
    <link id="skin" rel="stylesheet" type="text/css"
          href="<c:url value="/easyui/themes/default/easyui.css"/>"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/easyui/themes/icon.css"/>"/>
    <style type="text/css">
        ul, li {
            margin: 0px;
            padding: 0px;
        }

        #home-tabs-tools {
            border-left: none;
            border-top: none;
            border-right: none;
        }

        .by {
            padding: 10px;
        }

        .line {
            margin-top: 10px;
        }
    </style>
    <title>Title</title>
    <script type="text/javascript">
        $(function () {
            $("#close-cur").linkbutton({
                onClick: function () {
                    var tab = $("#home-tabs").tabs("getSelected");
                    var index = $("#home-tabs").tabs("getTabIndex", tab);
                    if (index != 0)
                        $("#home-tabs").tabs("close", index);
                }
            });

            $("#close-all").linkbutton({
                onClick: function () {
                    var tabs = $("#home-tabs").tabs("tabs");
                    for (var i = tabs.length - 1; i >= 1; i--) {
                        $("#home-tabs").tabs("close", i);
                    }
                }
            });

            $(".c").linkbutton({
                onClick: function () {
                    var opt = $(this).linkbutton("options");
                    var text = opt.text;
                    var link = opt.link;
                    console.log(text);
                    console.log(link);

                    addTab(text, link);
                }
            });

            var addTab = function (text, link) {
                if ($("#home-tabs").tabs("exists", text)) {
                    $("#home-tabs").tabs("select", text);
                } else {
                    $("#home-tabs").tabs("add", {
                        title: text,
                        href: link,
                        closable: true
                    });
                }
            }
        });
    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'west', title:'功能导航',split:true"
     style="width: 200px;">
    <div id="aa" class="easyui-accordion"
         data-options="fit:true, border:false">
        <div title="部门管理" data-options="iconCls:'icon-save'"
             style="overflow: auto; padding: 10px;">

            <ul>
                <li><a class="easyui-linkbutton c"
                       data-options="iconCls:'icon-search', plain:true, link:'demo1'">部门列表</a></li>
                <li><a class="easyui-linkbutton c"
                       data-options="iconCls:'icon-search', plain:true, link:'demo1'">人员分配</a></li>
                <li><a class="easyui-linkbutton c"
                       data-options="iconCls:'icon-search', plain:true, link:'demo1'">调岗</a></li>
                <li><a class="easyui-linkbutton c"
                       data-options="iconCls:'icon-search', plain:true, link:'demo1'">部门业绩考核</a></li>
            </ul>

        </div>
        <div title="皮肤" data-options="iconCls:'icon-reload'"
             style="padding: 10px;">
            <ul>
                <li><a class="easyui-linkbutton d"
                       data-options="iconCls:'icon-search', plain:true">black</a></li>
                <li><a class="easyui-linkbutton d"
                       data-options="iconCls:'icon-search', plain:true">bootstrap</a></li>
                <li><a class="easyui-linkbutton d"
                       data-options="iconCls:'icon-search', plain:true">default</a></li>
                <li><a class="easyui-linkbutton d"
                       data-options="iconCls:'icon-search', plain:true">gray</a></li>
                <li><a class="easyui-linkbutton d"
                       data-options="iconCls:'icon-search', plain:true">material</a></li>
                <li><a class="easyui-linkbutton d"
                       data-options="iconCls:'icon-search', plain:true">metro</a></li>
            </ul>
        </div>
        <div title="权限管理">权限</div>
    </div>

</div>
<div data-options="region:'center'">

    <div id="home-tabs" class="easyui-tabs" data-options="fit:true, border:false,tools:'#home-tabs-tools'">
        <div title="首页" style="padding: 20px; display: none;">tab1</div>
    </div>
    <div id="home-tabs-tools">
        <a id="close-cur" href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove"></a>
        <a id="close-all" href="#" class="easyui-linkbutton" plain="true" iconCls="icon-clear"></a>
    </div>
</div>
</body>
</html>
