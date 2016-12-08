package com.cupid.wrappers;

import com.cupid.dataObjects.User;

import java.util.List;

/**
 * Created by victorzhao on 11/4/16.
 */
public class UserWrapper {
    private List<User> users;

    public UserWrapper() {}

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
