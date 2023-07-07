<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% request.setCharacterEncoding("UTF-8");%>
    <%= request.getParameter("username") %>
</body>
</html>
