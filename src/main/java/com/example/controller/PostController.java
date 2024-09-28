package com.example.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.constant.Constant;
import com.example.db.CompanyDbUtil;
import com.example.db.PostDbUtil;
import com.example.model.Company;
import com.example.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/post")
public class PostController {
	@RequestMapping("/update")
	public String addPost(
	        HttpSession session,
	        @RequestParam("id") String id,
	        @RequestParam("title") String title,              // Tiêu đề
	        @RequestParam("description") String description,  // Mô tả công việc
	        @RequestParam("experience") String experience,    // Kinh nghiệm
	        @RequestParam("quantity") int quantity,           // Số người cần tuyển
	        @RequestParam("address") String address,          // Địa chỉ
	        @RequestParam("deadline") String deadline,        // Hạn ứng tuyển
	        @RequestParam("salary") double salary,            // Lương
	        @RequestParam("type") String type,                // Loại công việc (fulltime, parttime, ...)
	        @RequestParam("category") String category,        // Danh mục công việc
	        Model model) throws NumberFormatException, SQLException {
		
		
		PostDbUtil.getInstance().UpdatePost(Integer.parseInt(id), title, description, experience, quantity, address, deadline, salary, type, category);
	    
	    return "redirect:/company/page/posts";
	}
	
	@RequestMapping("/delete")
	public String deletePost(@RequestParam("id") String id) throws NumberFormatException, SQLException {
		
		PostDbUtil.getInstance().DeletePost(Integer.parseInt(id));
		
	    return "redirect:/company/page/posts";

	}

}
