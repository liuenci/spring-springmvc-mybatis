<%--
  Created by IntelliJ IDEA.
  User: cier
  Date: 2018/7/25
  Time: 21:57
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
    <script type="text/javascript"
            src="<c:url value="/js/common.js"/>"></script>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/easyui/themes/default/easyui.css"/>"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/easyui/themes/icon.css"/>"/>
    <script type="text/javascript">
        $(function () {
            $("#btn-city").linkbutton({
                onClick: function () {
                    getCity(function (o) {
                        $("#txt-city").val(o.n);
                    });
                }
            });
            $("#btn-city2").linkbutton({
                onClick: function () {
                    getCity(function (o) {
                        $("#txt-city2").val(o.n);
                    });
                }
            });
        })
    </script>
    <title>测试</title>
</head>
<body>
<div>
    <input id="txt-city">
    <a id="btn-city" class="easyui-linkbutton" data-options="text:'获取城市'"></a>
    <input id="txt-city2">
    <a id="btn-city2" class="easyui-linkbutton" data-options="text:'获取城市'"></a>
</div>
</body>
</html>
