<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="header.jspf"%>
<%@ include file="left_menu.jspf"%>
<%@ page import="com.example.library.*" %>
<%
    int genreId = Integer.parseInt(request.getParameter("genre_id"));
    String name = request.getParameter("name");
    List<Book> bookList = Database.getBooksByGenre(genreId);
    session.setAttribute("currentBookList", bookList);
%>

<div class="book_list">
    <h3><%=name%></h3>

        <% for (Book book : bookList) {
            Author author = Database.getAuthorById(book.getAuthorId());%>
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
                <p style="margin: 10px;"> <a href="#">Читать</a></p>
            </div>
        </div>
        <%}%>

</div>
<%@ include file="footer.jspf"%>





