package com.example.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.constant.Constant;
import com.example.db.ApplicantDbUtil;
import com.example.db.PostDbUtil;
import com.example.model.Applicant;
import com.example.model.Post;
import com.example.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/applicant")
public class ApplicantController {
	@RequestMapping("/request")
	public String ApplyRequest(@RequestParam("id") int id, HttpSession session) throws SQLException {
    	User user = (User) session.getAttribute("user");
    	if(user == null) {
    		return "redirect:/page/login";
    	}
    	Post post = PostDbUtil.getInstance().GetPost(id);
    	Applicant apply = new Applicant(user.getId(), post);
    	ApplicantDbUtil.getInstance().RequestApply(apply);
		return "redirect:/";
	}
	
	@RequestMapping("/pass")
	public String PassRequest(@RequestParam("id") int id,
							  @RequestParam("post") int postId,
							  HttpSession session) throws SQLException {
		
    	User user = (User) session.getAttribute("user");
    	if(user == null) {
    		return "redirect:/page/login";
    	} else if(user.getRoleId() == 1) {
    		return "redirect:/";
    	}
    	
    	
    	ApplicantDbUtil.getInstance().AcceptApply(id, postId);
    	
    	
		
		return "redirect:/company/page/requests";
		
	}
}
