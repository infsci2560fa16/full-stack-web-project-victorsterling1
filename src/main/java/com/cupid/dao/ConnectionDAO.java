package com.cupid.dao;

import com.cupid.dataObjects.Connection;
import com.cupid.dataObjects.User;
import com.cupid.mappers.ConnectionMapper;
import com.cupid.mappers.UserMapper2;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by victorzhao on 12/7/16.
 */

@Repository
public class ConnectionDAO {

    public void create(JdbcTemplate jdbcTemplate, int ufrom, int uto) {
        String sql = "insert into connections (ufrom, uto) values (?,?);";
        //System.out.println(ufrom + "  "+ uto);
        jdbcTemplate.update(sql, ufrom, uto);
    }

    public long getMaxId(JdbcTemplate jdbcTemplate) {
        return jdbcTemplate.queryForObject("select COALESCE(max(cid), 0) as id from connections;", Long.class);
    }

    public boolean checkconnection(JdbcTemplate jdbcTemplate, int ufrom, int uto) {
        String sql = "select * from connections where ufrom=? and uto=?;";
        List<Connection> list = jdbcTemplate.query(sql, new Object[]{ufrom, uto}, new ConnectionMapper());
        if (list == null || list.isEmpty()) {
            return false;
        } else {
            return true;
        }

    }

    public List<Connection> getList(JdbcTemplate jdbcTemplate, int uto) {
        String sql = "select * from connections where uto=?;";
        List<Connection> list = jdbcTemplate.query(sql, new Object[]{uto}, new ConnectionMapper());
        return list;
    }
}
