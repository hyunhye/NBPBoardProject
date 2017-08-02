package com.hyunhye.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.expression.SecurityExpressionOperations;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;

import com.hyunhye.board.service.BoardService;

public class CustomSecurityExpressionHandler extends DefaultWebSecurityExpressionHandler {
	Logger logger = LoggerFactory.getLogger(CustomSecurityExpressionHandler.class);

	@Autowired
	BoardService service;


	@Override
	protected SecurityExpressionOperations createSecurityExpressionRoot(Authentication authentication,
		FilterInvocation fi) {
		CustomSecurityExpressionRoot root = new CustomSecurityExpressionRoot(authentication, fi, service);
		root.setPermissionEvaluator(getPermissionEvaluator());
		root.setRoleHierarchy(getRoleHierarchy());

		return root;
	}
}