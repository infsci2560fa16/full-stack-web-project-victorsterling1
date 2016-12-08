package com.cupid.resources;

import com.cupid.dao.ConnectionDAO;
import com.cupid.dao.UserDAO;
import com.cupid.dataObjects.Connection;
import com.cupid.dataObjects.ResultMSG;
import com.cupid.dataObjects.User;
import com.cupid.wrappers.UserWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by victorzhao on 12/7/16.
 */
@RestController
public class ConnectionResource {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @RequestMapping(value = {"/connection"}, method = RequestMethod.POST, consumes = "application/json")
    public ResultMSG recevie(@RequestBody Connection con) {
        ResultMSG res = new ResultMSG();
        ConnectionDAO condao = new ConnectionDAO();
        condao.create(jdbcTemplate, con.getUfrom(), con.getUto());
        res.setId(condao.getMaxId(jdbcTemplate));
        res.setMsg("success");
        return res;
    }

    @RequestMapping(value = {"/concheck/{ufrom}/{uto}"}, method = RequestMethod.GET)
    public boolean check(@PathVariable(value = "ufrom") int ufrom, @PathVariable(value = "uto") int uto) {
        ConnectionDAO condao = new ConnectionDAO();
        return condao.checkconnection(jdbcTemplate,ufrom,uto);
    }

    @RequestMapping(value = {"/list/{uto}"}, method = RequestMethod.GET)
    public UserWrapper getList(@PathVariable(value = "uto") int uto) {
        UserWrapper res = new UserWrapper();
        ConnectionDAO condao = new ConnectionDAO();
        List<Connection> IdList = condao.getList(jdbcTemplate, uto);
        List<User> tmp = new LinkedList<>();
        if (IdList.isEmpty()) {
            res.setEmpty(true);
            res.setUsers(tmp);
        } else {
            res.setEmpty(false);
            UserDAO userdao = new UserDAO();
            for (Connection c : IdList) {
                User u = userdao.getById(jdbcTemplate, c.getUfrom());
                tmp.add(u);
            }
            res.setUsers(tmp);
        }
        return res;
    }
}
