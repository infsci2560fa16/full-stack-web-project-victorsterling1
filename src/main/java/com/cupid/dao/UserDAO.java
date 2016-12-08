package com.cupid.dao;

import com.cupid.dataObjects.User;
import com.cupid.mappers.UserMapper1;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by victorzhao on 11/4/16.
 */

@Repository
public class UserDAO {

    public void create (JdbcTemplate jdbcTemplate, String firstName, String lastName, int age, String email, String password,
                       boolean smoke, String note) {
        String sql = "insert into users (firstName, lastName, age, email, password, smoke, note) values(?,?,?,?,?,?,?);";
        jdbcTemplate.update(sql, firstName, lastName, age, email, password, smoke, note);
    }

//    public void addFlowers(JdbcTemplate jdbcTemplate, int uid) {
//        int num = 0;
//        String sql = "select flower from users where uid = " + uid + ";";
//
//    }

    public List<User> getAllUsers(JdbcTemplate jdbcTemplate) {
        String sql = "select * from users;";
        List<User> result = jdbcTemplate.query(sql, new UserMapper1());
        return result;
    }

    public long getMaxId(JdbcTemplate jdbcTemplate) {
        return jdbcTemplate.queryForObject("select COALESCE(max(uid), 0) as id from users;", Long.class);
    }


    public User getById (JdbcTemplate jdbcTemplate, long id) {
        String sql = "select * from users where uid = ?;";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new UserMapper1());
    }


}
