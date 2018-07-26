<%--
  Created by IntelliJ IDEA.
  User: cier
  Date: 2018/7/25
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>城市列表</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        var citysName = ["长沙", "株洲", "湘潭", "衡阳", "娄底", "益阳", "吉首"];

        for (var i = 0; i < citysName.length; i++) {
            $("<div>").css({
                height: '40px',
                fontSize: '18px',
                lineHeight: '40px',
                textAlign: 'center',
                cursor: 'pointer'
            })
                .html(citysName[i])
                .appendTo($("#citys"));
        }
    });
</script>
<div id="citys"></div>
</body>
</html>
