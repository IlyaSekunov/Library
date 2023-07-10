package com.example.library.database_classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Database {

    private static class Configuration {
        private static final String USER_NAME = "root";
        private static final String PASSWORD = "vtcnm412";
        private static final String CONNECTION_URL = "jdbc:mysql://localhost:3306/library";
    }

    public static void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Author> getAllAuthors() {
        try (Connection connection = DriverManager.getConnection(Configuration.CONNECTION_URL,
                Configuration.USER_NAME, Configuration.PASSWORD);
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("select * from author order by fio");
            return getAuthorList(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Genre> getAllGenres() throws SQLException {
        try (Connection connection = DriverManager.getConnection(Configuration.CONNECTION_URL,
                Configuration.USER_NAME, Configuration.PASSWORD);
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("select * from genre order by name");
            return getGenreList(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Book> getAllBooks() {
        try (Connection connection = DriverManager.getConnection(Configuration.CONNECTION_URL,
                Configuration.USER_NAME, Configuration.PASSWORD);
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("select * from book");
            return getBookList(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Book> getBooksByGenre(int genreId) {
        try (Connection connection = DriverManager.getConnection(Configuration.CONNECTION_URL,
                Configuration.USER_NAME, Configuration.PASSWORD);
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("select * from book where book.genre_id = " + genreId);
            return getBookList(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Book> getBookList(ResultSet resultSet) throws SQLException {
        List<Book> bookList = new ArrayList<>();
        while (resultSet.next()) {
            Book book = new Book();
            book.setId(resultSet.getInt(1));
            book.setName(resultSet.getString(2));
            book.setPageCount(resultSet.getInt(3));
            book.setGenreId(resultSet.getInt(4));
            book.setAuthorId(resultSet.getInt(5));
            book.setPublishYear(resultSet.getInt(6));
            book.setImageUrl(resultSet.getString(7));
            book.setContentUrl(resultSet.getString(8));
            bookList.add(book);
        }
        resultSet.close();
        return bookList;
    }

    public static List<Author> getAuthorList(ResultSet resultSet) throws SQLException {
        List<Author> authorList = new ArrayList<>();
        while (resultSet.next()) {
            Author author = new Author();
            author.setId(resultSet.getInt(1));
            author.setName(resultSet.getString(2));
            author.setBirthday(resultSet.getDate(3));
            authorList.add(author);
        }
        resultSet.close();
        return authorList;
    }

    public static List<Genre> getGenreList(ResultSet resultSet) throws SQLException {
        List<Genre> genreList = new ArrayList<>();
        while (resultSet.next()) {
            Genre genre = new Genre();
            genre.setId(resultSet.getInt(1));
            genre.setName(resultSet.getString(2));
            genreList.add(genre);
        }
        resultSet.close();
        return genreList;
    }

    public static Author getAuthorById(int id) {
        try (Connection connection = DriverManager.getConnection(Configuration.CONNECTION_URL,
                Configuration.USER_NAME, Configuration.PASSWORD);
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("select * from author where author.id = " + id);
            Author author = new Author();
            resultSet.next();
            author.setId(resultSet.getInt(1));
            author.setName(resultSet.getString(2));
            resultSet.close();
            return author;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Book> getBooks(String query) {
        try (Connection connection = DriverManager.getConnection(Configuration.CONNECTION_URL,
                Configuration.USER_NAME, Configuration.PASSWORD);
        Statement statement = connection.createStatement()) {
          ResultSet resultSet = statement.executeQuery(query);
          return getBookList(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
