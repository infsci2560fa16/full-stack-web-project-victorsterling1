package com.cupid.wrappers;

import com.cupid.dataObjects.User;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by victorzhao on 11/4/16.
 */
@XmlRootElement(name = "UserWrapper")
public class UserWrapper {
    private List<User> users;
    private boolean empty;
    private static UserWrapper instance;

    public UserWrapper() {}

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public static UserWrapper getInstance(){
        if (instance == null) {
            instance = new UserWrapper();
            List<User> tmp = new LinkedList<>();
            tmp.add(new User(1,"/image/1.jpg","Are you my Mr. Right?"));
            tmp.add(new User(2,"/image/2.jpg","Looking for soul mate."));
            tmp.add(new User(3,"/image/3.jpg","Hello darling."));
            instance.setUsers(tmp);
        }
        return instance;

    }

    public boolean isEmpty() {
        return empty;
    }

    public void setEmpty(boolean empty) {
        this.empty = empty;
    }
}
