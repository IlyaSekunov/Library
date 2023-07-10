<%@ page import="java.util.Enumeration" %>
<%@ page import="com.example.library.database_classes.Database" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%! public void jspInit() {
    Database.connect();
}%>
<%
    Enumeration<String> attributes = session.getAttributeNames();
    if (attributes != null) {
        while (attributes.hasMoreElements()) {
            session.removeAttribute(attributes.nextElement());
        }
    }
%>
<html>
<head>
    <title>Онлайн библиотека::Вход</title>
    <link href="css/start_page.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="content">
        <p class="title"><span class="text"><img src="images/start_page_books.png" width="76" height="77" /></span></p>
        <p class="title">Онлайн библиотека</p>
        <p class="text">Добро пожаловать в онлайн библиотеку, где вы сможете найти любую книгу на ваш вкус. Доступны функции поиска, просмотра, сортировки и многие другие</p>
        <p class="text">Проект находится в разработке, поэтому дизайн и функционал будет постоянно дорабатываться.</p>
        <p class="text">По всем вопросам обращайтесь по адресу <a href="mailto:sekunovila@gmail.com">sekunovila@gmail.com</a></p>
        <p>&nbsp;</p>
    </div>
    <div class="login_div">
        <p class="title">Для входа введите свои данные:</p>
        <form class="content" name="username" action="books?page=1" method="post">
            Имя: <input type="text" name="username" value="" size="20" />
            <input type="submit" value="Войти" />
        </form>
    </div>
    <div class="footer">
        Разработчик: Секунов Илья, 2023г.
    </div>
</div>
</body>
</html>
