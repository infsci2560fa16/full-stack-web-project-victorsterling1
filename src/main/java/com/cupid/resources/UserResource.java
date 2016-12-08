package com.cupid.resources;

import com.cupid.dao.UserDAO;
import com.cupid.dataObjects.ResultMSG;
import com.cupid.dataObjects.User;
import com.cupid.wrappers.ResultMSGWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by victorzhao on 11/4/16.
 */
@RestController
@CrossOrigin
public class UserResource {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @RequestMapping(value = {"/users"}, method = RequestMethod.GET)
    public List<User> getALL() {
        UserDAO userdao = new UserDAO();
        return userdao.getAllUsers(jdbcTemplate);
    }

    @RequestMapping(value = {"/users/{id}"}, method = RequestMethod.GET)
    public User queryById(@PathVariable(value = "id") long id) {
        UserDAO userdao = new UserDAO();
        return userdao.getById(jdbcTemplate, id);
    }

    @RequestMapping(value = {"/users"}, method = RequestMethod.POST, consumes = "application/json")
    public ResultMSGWrapper receive (@RequestBody List<User> users) throws InterruptedException {
        UserDAO userdao = new UserDAO();
        long id = userdao.getMaxId(jdbcTemplate);
        List<ResultMSG> res = new LinkedList<>();
        for (User user : users) {
            id++;
            ResultMSG temp = new ResultMSG();
            temp.setId(id);
            userdao.create(jdbcTemplate, user.getFirstName(), user.getLastName(), user.getAge(), user.getEmail(), user.getPassword(),
                    user.isSmoke(), user.getNote());
            temp.setMsg("Succeed!");
            res.add(temp);
        }
        return new ResultMSGWrapper(res);

    }
}
