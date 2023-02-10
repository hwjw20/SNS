package com.jiwon.sns.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.sns.user.model.User;

@Repository
public interface UserDAO {

	public User selectUser(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email);
	
	public User selectUserByLoginId(@Param("loginId") String loginId);
}
