package com.cupid.mappers;

import com.cupid.dataObjects.Connection;
import com.cupid.dataObjects.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by victorzhao on 12/7/16.
 */
public class ConnectionMapper implements RowMapper<Connection> {

    public Connection mapRow(ResultSet rs, int rowNum) throws SQLException {
        Connection con = new Connection();
        con.setCid(rs.getLong("cid"));
        con.setUfrom(rs.getInt("ufrom"));
        con.setUto(rs.getInt("uto"));
        return con;
    }
}
