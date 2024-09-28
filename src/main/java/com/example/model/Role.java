package com.example.model;


public enum Role {
	USER(1, "User"),
    ADMIN(2, "Administrator"),
    COMPANY(3, "Company");
    

    public final int id;
    public final String name;

    Role(int id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }
    
    public static String getNameById(int roleId) {
        Role[] roles = Role.values();
        int left = 0;
        int right = roles.length - 1;

        while (left <= right) {
            int mid = (left + right) / 2;
            int midId = roles[mid].getId();

            if (midId == roleId) {
                return roles[mid].getName();
            } else if (midId < roleId) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return "Unknown Role";
    }
}