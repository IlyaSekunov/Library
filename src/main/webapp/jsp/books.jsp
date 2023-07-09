<%@page contentType="text/html" pageEncoding="UTF-8" %>


<html>
<head>
    <title>Онлайн библиотека</title>
    <link href="css/main_page.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
<%@ include file="header.jspf"%>
<%@ include file="left_menu.jspf"%>
<%@ include file="letters.jspf"%>
<%@ page import="com.example.library.*" %>
<%@ page import="com.example.library.BookSearcher.*" %>

    <div class="book_list">
    <% List<Book> bookList = null;
       if (request.getParameter("genre_id") != null) {
           int genreId = Integer.parseInt(request.getParameter("genre_id"));
           bookList = Database.getBooksByGenre(genreId);
       } else if (request.getParameter("letter") != null) {
            String letter = request.getParameter("letter");
            bookList = BookSearcher.getBooksByLetter(letter);
        } else if (request.getParameter("search_string") != null) {
           String searchString = request.getParameter("search_string");
           SearchType searchType = SearchType.TITLE;
           if (request.getParameter("search_option").equals("Автор")) {
               searchType = SearchType.AUTHOR;
           }
           if (searchString != null && !searchString.trim().equals("")) {
               bookList = BookSearcher.getBooksBySearch(searchString, searchType);
           }
       } else {
           bookList = Database.getAllBooks();
       }
       session.setAttribute("currentBookList", bookList);
    %>
    <h5 style="text-align: left; margin-top: 10px; float: left; width: 65%">Найдено книг: <%=bookList.size()%></h5>
    <%
        for (Book book : bookList) {
            Author author = Database.getAuthorById(book.getAuthorId());
    %>
    <div class="book_info">
        <div class="book_title">
            <p><%=book.getName()%></p>
        </div>
        <div class="book_image">
            <img src="<%=book.getImageUrl()%>" height="250" width="190"/>
        </div>
        <div class="book_details">
            <br><strong>Количество страниц:</strong> <%=book.getPageCount()%>
            <br><strong>Год публикации:</strong> <%=book.getPublishYear()%>
            <br><strong>Автор:</strong> <%=CustomizeHelper.parseAuthorName(author.getName())%>
            <p style="margin: 10px;"> <a href="<%=book.getContentUrl()%>">Читать</a></p>
        </div>
    </div>
    <%}%>
</div>

    </div>
</body>
</html>





