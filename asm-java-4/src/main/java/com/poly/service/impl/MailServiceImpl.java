package com.poly.service.impl;

import javax.servlet.ServletContext;

import com.poly.entity.User;
import com.poly.service.EmailService;
import com.poly.util.SendMailUtil;

public class MailServiceImpl implements EmailService {

	
	private static final String EMAIL_WELCOME_SUBJECT = "Welcome to Ztube";
	private static final String EMAIL_FORGOT_PASSWORD = "Ztube account new password";

	@Override
	public void sendEmail(ServletContext context, User recipient, String type) {
        String host = context.getInitParameter("host");
        String port = context.getInitParameter("port");
        String user = context.getInitParameter("user");
        String pass = context.getInitParameter("pass");
		
        try {
        	String content = null;
        	String subject = null;
        	switch (type) {
			case "welcome":
				subject = EMAIL_WELCOME_SUBJECT;
				content = "Dear" +recipient.getUsername() + ", xin chao";
				break;
			case "forgot":
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Dear" +recipient.getUsername() + ", mat khau moi cua ban: " + recipient.getPassword();
				break;
				default:
					subject = "Ztube";
					content = "xin loi duoc chua";
			}
        	SendMailUtil.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
