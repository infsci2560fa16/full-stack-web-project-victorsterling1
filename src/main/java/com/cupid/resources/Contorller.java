package com.cupid.resources;

import com.cupid.dao.UserDAO;
import com.cupid.dataObjects.User;
import com.cupid.wrappers.UserWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;


/**
 * Created by victorzhao on 12/2/16.
 */
@Controller
public class Contorller {

    @RequestMapping(value = "/")
    public String welcome(Model model) {
        List<User> users = UserWrapper.getInstance().getUsers();
        model.addAttribute("users", users);
        model.addAttribute("pitt", 0);
        return "welcome";
    }

    @RequestMapping(value = "/{pitt}")
    public String pitt(@PathVariable(value = "pitt") int pitt, Model model) {
        List<User> users = UserWrapper.getInstance().getUsers();
        model.addAttribute("users", users);
        model.addAttribute("pitt", pitt);
        return "welcome";
    }

    @RequestMapping(value = "/index")
    public String index(Model model) {
        return "index";
    }

    @RequestMapping(value = "/signup")
    public String signup(Model model) {
        return "signup";
    }
    @RequestMapping(value = "/login")
    public String login(Model model) {
        return "login";
    }

    @RequestMapping(value = "/home")
    public String home(Model model) {
        return "home";
    }

    @RequestMapping(value = "/forget")
    public String forget(Model model) {
        return "forget";
    }

    @RequestMapping(value = "/person/{pid}")
    public String person(@PathVariable(value = "pid") int pid, Model model) {
        model.addAttribute("pid", pid);
        return "person";
    }

    @RequestMapping(value = "/account")
    public String account(Model model) {
        return "account";
    }



//
//    @RequestMapping(value = "/signup1")
//    public String signup( Model model) {
//        if (email != null && pass != null) {
//            model.addAttribute("email", email);
//            model.addAttribute("pass", pass);
//        }
//
//        return "signup";
//    }
//
//    @RequestMapping(value="/signup",method= RequestMethod.POST)
//    public String passValue(@ModelAttribute("email") String email, @ModelAttribute("password") String pass, Model model){
////        this.email = email;
////        this.pass = pass;
////        return "redirect:/signup1";
//        model.addAttribute("email", email);
//        model.addAttribute("pass", pass);
//        return "signup";
//    }



}
