package com.hyunhye.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunhye.user.model.UserModel;
import com.hyunhye.user.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	public UserRepository repository;

	public void regist(UserModel model) throws Exception {
		repository.regist(model);
	}

	public boolean loginCheck(HttpSession session, UserModel model) throws Exception {
		boolean result = repository.loginCheck(model);
		if (result) {
			UserModel userModel = viewUser(model);

			session.setAttribute("userId", userModel.getUserId());
			session.setAttribute("id", userModel.getId());
			session.setAttribute("name", userModel.getName());
		}
		return result;
	}

	public UserModel viewUser(UserModel model) throws Exception {
		return repository.viewUser(model);
	}

	public void logout(HttpSession session) {
		session.removeAttribute("login");
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("userId");
		session.invalidate();
	}

	public int select(String id) throws Exception {
		return repository.select(id);
	}
}
