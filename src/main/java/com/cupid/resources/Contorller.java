package com.cupid.resources;

import com.cupid.dataObjects.User;
import com.cupid.wrappers.UserWrapper;
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
public class WelcomeContorller {

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

//    @RequestMapping(value="/ispitt",method= RequestMethod.POST)
//    public String addEmployee(@ModelAttribute("pitt")int pitt, Model model){
//        model.addAttribute("pitt",pitt);
//        return "redirect:/";
//    }


}
