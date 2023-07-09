<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%! public void jspInit() {
    Database.connect();
}%>

<html>
<head>
    <title>Онлайн библиотека</title>
    <link href="css/main_page.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
<%@include file="header.jspf"%>
<%@include file="left_menu.jspf"%>
<%@include file="letters.jspf"%>
</div>
</body>
</html>