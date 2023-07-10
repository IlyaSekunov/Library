package com.example.library.help_classes;

public class CustomizeHelper {
    public static String parseAuthorName(String name) {
        String[] names = name.split(" ");
        if (names.length == 3) {
            return names[0].substring(0, 1) + "." + names[1].substring(0, 1) + ". " + names[2];
        } else {
            return names[0].substring(0, 1) + ". " + names[1];
        }
    }
}
