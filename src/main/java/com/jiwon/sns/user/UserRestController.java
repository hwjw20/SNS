package com.jiwon.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.sns.user.bo.UserBO;
import com.jiwon.sns.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		if(user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email) {
		
		int count = userBO.addUser(loginId, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/duplicate_id")
	public Map<String, Boolean> isDuplicate(@RequestParam("loginId") String loginId) {
		boolean isDuplicate = userBO.isDuplicatedId(loginId);
		
		Map<String, Boolean> result = new HashMap<>();
		
//		if(isDuplicate) {
//			result.put("is_duplicate", true);
//		} else {
//			result.put("is_duplicate", false);
//		}
		result.put("is_duplicate", isDuplicate);
		
		return result;
	}
	
	@GetMapping("/searchPw")
	public Map<String, Boolean> searchPw(
			@RequestParam("loginId") String loginId
			, @RequestParam("name") String name
			, @RequestParam("email") String email) {
		int count = userBO.searchPw(loginId, name, email);
		
		Map<String, Boolean> result = new HashMap<>();
		if(count == 1) {
			result.put("exist", true);
		} else {
			result.put("exist", false);
		}
		
		return result;
	}
}
