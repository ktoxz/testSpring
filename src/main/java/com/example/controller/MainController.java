package com.example.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.constant.Constant;
import com.example.db.CompanyDbUtil;
import com.example.db.PostDbUtil;
import com.example.db.UserDbUtil;
import com.example.model.Company;
import com.example.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
    
    @RequestMapping("/")
    public String showPage(HttpSession session, Model model) throws SQLException {
    	User user = (User) session.getAttribute("user");
    	Company company = (Company) session.getAttribute("company");
    	//System.out.println(company)
        model.addAttribute("user", user);
        model.addAttribute("company", company);
        model.addAttribute("posts", PostDbUtil.getInstance().getRandomPost(3));
    	return Constant.MAIN;
    }
    
    @RequestMapping("/page/login")
    public String showLoginPage() {
        return Constant.LOGIN;
    }

    @RequestMapping("/page/register")
    public String showRegisterPage() {
        return Constant.REGISTER;
    }
    
    @PostMapping("/login")
    public String doLogin(@RequestParam("email") String email,
                          @RequestParam("password") String password,
                          HttpSession session,
                          Model model) throws SQLException {

        if (session.getAttribute("user") != null) {
            return "redirect:/";
        }

        User xUser = UserDbUtil.getInstance().LoginUser(email, password);
        if (xUser != null) {
            session.setAttribute("user", xUser);
            if(xUser.getRoleId() == 3) {
            	session.setAttribute("company", CompanyDbUtil.getInstance().getCompany(xUser.getId()));
            }
            return "redirect:/";
        }
        model.addAttribute("error", "Email hoặc mật khẩu sai, vui lòng thử lại!");
        return Constant.LOGIN;
    }

    @PostMapping("/register")
    public String doRegister(
            HttpSession session,
            @RequestParam("fullName") String fullName,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword,
            @RequestParam("role") String role,
            Model model) throws NumberFormatException, SQLException {

        if (session.getAttribute("user") != null) {
            return "redirect:/";
        }

        if (!password.equals(confirmPassword))  {
            model.addAttribute("error", "Nhập lại mật khẩu sai!");
            return Constant.REGISTER;
        }

        if (UserDbUtil.getInstance().RegisterUser(fullName, email, password, Integer.parseInt(role))) {
        	User newUser = UserDbUtil.getInstance().LoginUser(email, password);
            session.setAttribute("user", newUser);
            if(newUser.getRoleId() == 3) {
                session.setAttribute("company", CompanyDbUtil.getInstance().getCompany(newUser.getId()));
            }
            return "redirect:/";
        } else {
            model.addAttribute("error", "Lỗi xảy ra khi kết nối với database! Vui lòng thử lại sau");
            return Constant.REGISTER;
        }
    }

    @GetMapping("/logout")
    public String doLogout(HttpSession session) {
        session.setAttribute("user", null);
        session.setAttribute("company", null);
        return "redirect:/";
    }


}
