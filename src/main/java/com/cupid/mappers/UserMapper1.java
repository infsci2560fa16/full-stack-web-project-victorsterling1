package com.cupid.mappers;

import com.cupid.dataObjects.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by victorzhao on 11/4/16.
 */
public class UserMapper1 implements RowMapper<User> {

    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setUid(rs.getLong("uid"));
        user.setFirstName(rs.getString("firstName"));
        user.setLastName((rs.getString("lastName")));
        user.setAge(rs.getInt("age"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setSmoke(rs.getBoolean("smoke"));
        user.setNote(rs.getString("note"));
        user.setFlower(rs.getInt("flower"));
        user.setPid(rs.getLong("pid"));
        return user;

    }
}
