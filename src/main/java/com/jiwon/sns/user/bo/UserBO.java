package com.jiwon.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.sns.common.EncryptUtils;
import com.jiwon.sns.user.dao.UserDAO;
import com.jiwon.sns.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
	
	public int addUser(String loginId, String password, String name, String email) {
		String ecryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, ecryptPassword, name, email);
	}
	
	public boolean isDuplicatedId(String loginId) {
		int count = userDAO.selectCountUserByLoginId(loginId);
		return count != 0;
	}
	
	public int searchPw(String loginId, String name, String email) {
		return userDAO.selectPw(loginId, name, email);
	}
	
	public User getUserInfo(int id) {
		return userDAO.selectUserInfo(id);
	}
	
}
