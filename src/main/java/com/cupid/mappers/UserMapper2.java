package com.cupid.mappers;

import com.cupid.dataObjects.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by victorzhao on 12/6/16.
 */
public class UserMapper2 implements RowMapper<User> {
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setUid(rs.getLong("uid"));
        return user;

    }
}
