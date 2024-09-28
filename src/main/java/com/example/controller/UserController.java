package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.constant.Constant;
import com.example.db.UserDbUtil;
import com.example.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/page/profile")
    public String showProfilePage(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/page/login";
        }
        return Constant.USER.PROFILE;
    }
	

    @PostMapping("/update-profile")
    public String doUpdateProfile(
            HttpSession session,
            @RequestParam("email") String email,
            @RequestParam("fullName") String fullName,
            @RequestParam("address") String address,
            @RequestParam("phone") String phone,
            @RequestParam("description") String describe,
            Model model) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/page/login";
        }


        try {
            UserDbUtil.getInstance().UpdateUser(user, fullName, phone, email, address, describe);
            session.setAttribute("user", user); // Cập nhật thông tin người dùng trong phiên
        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("error", "Lỗi cập nhật thông tin, vui lòng thử lại!");
            if(user.getRoleId() != 3) {
            	return Constant.USER.PROFILE; 
            } else {
            	return Constant.COMPANY.PROFILE;
            }
            
        }

        return "redirect:/";
    }
}
