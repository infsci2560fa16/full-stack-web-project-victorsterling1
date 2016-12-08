package com.cupid.dao;

import com.cupid.dataObjects.User;
import com.cupid.mappers.UserMapper1;
import com.cupid.mappers.UserMapper2;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by victorzhao on 11/4/16.
 */

@Repository
public class UserDAO {

    public void create (JdbcTemplate jdbcTemplate, String firstName, String lastName, int byear, int bmon, int bday,
                        String email, String password, boolean smoke, String note, String photo,
                        boolean gender, int relationship) {
        String sql = "insert into users (firstname, lastname, byear, bmon, bday, email, password, smoke, note, photo, " +
                "gender, relationship) values(?,?,?,?,?,?,?,?,?,?,?,?);";
        jdbcTemplate.update(sql, firstName, lastName, byear, bmon, bday, email, password, smoke, note, photo, gender, relationship);
    }



    public void addFlowers(JdbcTemplate jdbcTemplate, int uid) {
        long num = 0;
        String sql = "select flower from users where uid = " + uid + ";";
        num = jdbcTemplate.queryForObject(sql,Long.class);
        num++;
        sql = "UPDATE users set flower = ? where uid = ?;";
        jdbcTemplate.update(sql, new Object[]{num, uid});
    }



    public List<User> getAllUsers(JdbcTemplate jdbcTemplate) {
        String sql = "select * from users;";
        return jdbcTemplate.query(sql, new UserMapper1());
    }

    public long getMaxId(JdbcTemplate jdbcTemplate) {
        return jdbcTemplate.queryForObject("select COALESCE(max(uid), 0) as id from users;", Long.class);
    }

    public long checkUser(JdbcTemplate jdbcTemplate, String email, String pass) {
        String sql = "select uid from users where email=? and password=?;";
        List<User> list = jdbcTemplate.query(sql, new Object[]{email, pass}, new UserMapper2());
        if (list == null || list.isEmpty()) {
            return 0;
        } else {
            return list.get(0).getUid();
        }

    }


    public User getById (JdbcTemplate jdbcTemplate, long id) {
        String sql = "select * from users where uid = ?;";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new UserMapper1());
    }

    public boolean checkEmail(JdbcTemplate jdbcTemplate, String email) {
        String sql = "select * from users where email = ?;";
        //System.out.println(email);
        List<User> list = jdbcTemplate.query(sql, new Object[]{email}, new UserMapper1());
        //System.out.println("the size is " + list.size());
        if (list == null || list.isEmpty()) {
            return true;
        } else {
            return false;
        }
    }


}
