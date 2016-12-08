package com.cupid.resources;

import com.cupid.dao.UserDAO;
import com.cupid.dataObjects.ResultMSG;
import com.cupid.dataObjects.User;
import com.cupid.wrappers.ResultMSGWrapper;
import com.cupid.wrappers.UserWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by victorzhao on 11/4/16.
 */
@RestController
public class UserResource {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @RequestMapping(value = {"/users"}, method = RequestMethod.GET)
    public List<User> getALL() {
        UserDAO userdao = new UserDAO();
        return userdao.getAllUsers(jdbcTemplate);
    }



    @RequestMapping(value = {"/check"}, method = RequestMethod.GET)
    public boolean checkEmail(@RequestParam(value="email") String email) {
        UserDAO userdao = new UserDAO();
        return userdao.checkEmail(jdbcTemplate, email);


    }

    @RequestMapping(value = {"/users/{id}"}, method = RequestMethod.GET)
    public User queryById(@PathVariable(value = "id") long id) {
        UserDAO userdao = new UserDAO();
        return userdao.getById(jdbcTemplate, id);
    }

    @RequestMapping(value = {"/addflower/{id}"}, method = RequestMethod.POST, consumes = "application/json")
    public ResultMSG addFlowerById(@PathVariable(value = "id") int id) {
        ResultMSG res = new ResultMSG();
        UserDAO userdao = new UserDAO();
        userdao.addFlowers(jdbcTemplate,id);
        return res;
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
            userdao.create(jdbcTemplate, user.getFirstName(), user.getLastName(), user.getByear(), user.getBmon(), user.getBday(),
                    user.getEmail(), user.getPassword(), user.isSmoke(), user.getNote(), user.getPhoto(), user.isGender(), user.getRelationship());
            temp.setMsg("Succeed!");
            res.add(temp);
        }
        return new ResultMSGWrapper(res);

    }
    @RequestMapping(value = {"/user"}, method = RequestMethod.POST, consumes = "application/json")
    public ResultMSG receive2 (@RequestBody User user) throws InterruptedException {
        UserDAO userdao = new UserDAO();
        long id = userdao.getMaxId(jdbcTemplate);
        id++;
        ResultMSG res = new ResultMSG();
        res.setId(id);
        userdao.create(jdbcTemplate, user.getFirstName(), user.getLastName(), user.getByear(), user.getBmon(), user.getBday(),
                user.getEmail(), user.getPassword(), user.isSmoke(), user.getNote(), user.getPhoto(), user.isGender(), user.getRelationship());
        res.setMsg("Succeed!");

        return res;

    }

    @RequestMapping(value = {"/checkuser"}, method = RequestMethod.POST, consumes = "application/json")
    public ResultMSG checkUser(@RequestBody User user) throws InterruptedException {
        ResultMSG res = new ResultMSG();
        UserDAO userdao = new UserDAO();
        long id = userdao.checkUser(jdbcTemplate,user.getEmail(),user.getPassword());
        res.setId(id);
        res.setMsg("Success");
        return res;
    }

//    @RequestMapping(value = "/{name}.xml", method = RequestMethod.GET, produces = "application/xml")
//    public User getEmployeeInXML(@PathVariable String name) {
//        User test = new User();
//        test.setFirstName(name);
//        test.setLastName(name);
//        return test;
//
//    }

    @RequestMapping(value = "/user/{id}.xml", method = RequestMethod.GET, produces = "application/xml")
    public User getUserXML(@PathVariable long id) {
        UserDAO userdao = new UserDAO();
        return userdao.getById(jdbcTemplate, id);

    }

//    @RequestMapping(value = {"/users/init"}, method = RequestMethod.POST, consumes = "application/json")
//    public int receive2(@RequestBody User user) throws InterruptedException {
//        UserDAO userdao = new UserDAO();
//        long id = userdao.getMaxId(jdbcTemplate);
//        id++;
//        ResultMSG res = new ResultMSG();
//        res.setId(id);
//
//
//    }
}
