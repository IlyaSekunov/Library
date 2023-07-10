package com.example.library.search_classes;
import com.example.library.database_classes.Book;
import com.example.library.database_classes.Database;

import java.util.List;

public class BookSearcher {
    public enum SearchType {
        TITLE, AUTHOR
    }

    public static List<Book> getBooksByLetter(String letter) {
        String query = "select * from book where name like '%" + letter + "%' order by name";
        return Database.getBooks(query);
    }

    public static List<Book> getBooksBySearch(String searchString, SearchType searchType) {
        StringBuilder query = new StringBuilder("select * from book ");
        if (searchType == SearchType.AUTHOR) {
            query.append("inner join author on author.id = book.author_id " +
                    "where lower(author.fio) like '%" + searchString.toLowerCase() +
                    "%' order by book.name");
        } else if (searchType == SearchType.TITLE) {
            query.append("where lower(name) like '%" + searchString.toLowerCase() + "%' order by name");
        }
        return Database.getBooks(query.toString());
    }
}
