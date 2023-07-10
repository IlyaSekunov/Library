<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.example.library.search_classes.BookSearcher.*" %>
<%@ page import="com.example.library.database_classes.Book" %>
<%@ page import="com.example.library.database_classes.Database" %>
<%@ page import="com.example.library.search_classes.BookSearcher" %>

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

        <div class="book_list">
                <% List<Book> bookList;
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
                       } else {
                           bookList = Database.getAllBooks();
                       }
                   } else {
                       bookList = Database.getAllBooks();
                   }
                %>
                <h5 style="text-align: left; margin-top: 10px; float: left; width: 65%">Найдено книг: <%=bookList.size()%></h5>
                <%@include file="books_page.jspf"%>
            </div>
        </div>
    </body>
</html>





