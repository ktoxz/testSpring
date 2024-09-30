package com.example.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.constant.Constant;
import com.example.db.ApplicantDbUtil;
import com.example.db.CompanyDbUtil;
import com.example.db.PostDbUtil;
import com.example.db.UserDbUtil;
import com.example.model.User;
import com.example.model.Applicant;
import com.example.model.Company;
import com.example.model.Post;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company")
public class CompanyController {
    @RequestMapping("/page/profile")
    public String showProfilePage(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/page/login";
        }
        return Constant.COMPANY.PROFILE;
    }
    
    @RequestMapping("/page/posts")
    public String showPostsPage(HttpSession session, Model model) throws SQLException {
        Company company = (Company) session.getAttribute("company");
        if (company == null) {
            return "redirect:/page/login";
        }
        model.addAttribute("postList", PostDbUtil.getInstance().getPostsByIdList(company.getId()));
        return Constant.COMPANY.POST;
    }
    
    @RequestMapping("/page/requests")
    public String showRequestsPage(HttpSession session, Model model) throws SQLException {
        User user = (User) session.getAttribute("user");
        Company company = (Company) session.getAttribute("company");
        if (user == null) {
            return "redirect:/page/login";
        }
        List<Applicant> applies = ApplicantDbUtil.getInstance().getApplicants("Select * from applicant where company_id = "+company.getId());
        
        model.addAttribute("applies", applies);
        
        return Constant.COMPANY.REQUEST;
    }
//    
//    @RequestMapping("/page/requests")
//    public String showRequests(HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        if (user == null) {
//            return "redirect:/page/login";
//        }
//        return Constant.COMPANY.REQUEST;
//    }
//    
    @PostMapping("/addJob")
    public String addJob(
            HttpSession session,
            @RequestParam("title") String title,              // Tiêu đề
            @RequestParam("description") String description,  // Mô tả công việc
            @RequestParam("experience") String experience,    // Kinh nghiệm
            @RequestParam("quantity") int quantity,           // Số người cần tuyển
            @RequestParam("address") String address,          // Địa chỉ
            @RequestParam("deadline") String deadline,        // Hạn ứng tuyển
            @RequestParam("salary") double salary,            // Lương
            @RequestParam("type") String type,                // Loại công việc (fulltime, parttime, ...)
            @RequestParam("category") String category,        // Danh mục công việc
            Model model) {

        Company company = (Company) session.getAttribute("company");
        User user = (User) session.getAttribute("user");

        if (company == null) {
            return "redirect:/page/login";
        }

        // Gọi hàm trong CompanyDbUtil để lưu bài đăng mới
        try {
            PostDbUtil.getInstance().AddPost(title, description, experience, quantity, address, java.sql.Date.valueOf(deadline), salary, type, category, company.getId(), user.getId());
        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("error", "Lỗi thêm bài đăng, vui lòng thử lại!");
            return Constant.COMPANY.POST;
        }

        return "redirect:/company/page/posts"; // Sau khi thêm bài đăng thành công, quay lại danh sách bài đăng
    }

    
    
    @PostMapping("/update-profile")
    public String doUpdateProfile(
            HttpSession session,
            @RequestParam("companyEmail") String email,
            @RequestParam("nameCompany") String name,
            @RequestParam("companyAddress") String address,
            @RequestParam("companyPhone") String phone,
            @RequestParam("companyDescription") String describe,
            Model model) {

        User user = (User) session.getAttribute("user");
        Company company = (Company) session.getAttribute("company");
        if (user == null || company == null) {
            return "redirect:/page/login";
        }


        try {
            CompanyDbUtil.getInstance().UpdateCompany(company, name, email, phone, address, describe);
            session.setAttribute("company", company);
        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("error", "Lỗi cập nhật thông tin, vui lòng thử lại!");
            return Constant.COMPANY.PROFILE;
        }

        return "redirect:/";
    }
    
}
