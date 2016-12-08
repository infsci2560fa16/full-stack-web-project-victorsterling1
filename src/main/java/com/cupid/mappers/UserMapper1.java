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
        user.setLastName(rs.getString("lastName"));
        user.setByear(rs.getInt("byear"));
        user.setBmon(rs.getInt("bmon"));
        user.setBday(rs.getInt("bday"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setSmoke(rs.getBoolean("smoke"));
        user.setNote(rs.getString("note"));
        user.setFlower(rs.getInt("flower"));
        user.setPhoto(rs.getString("photo"));
        user.setGender(rs.getBoolean("gender"));
        user.setRelationship(rs.getInt("relationship"));

        return user;

    }
}
