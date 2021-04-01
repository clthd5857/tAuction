package org.spring5.controller;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model)
	{
		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/customLogin")
	public void login(String error,String logout,Model model)
	{
		log.info("error: "+error);
		log.info("logout: "+logout);
		if(error != null)
		{
			model.addAttribute("error", "로그인 안됨.");
		}
		if(logout != null)
		{
			model.addAttribute("logout", "로그아웃");
		}
	
	}
	
	@GetMapping("/customLogout")
	public String logout(HttpSession session)
	{
	 session.invalidate();
	 
	 return "redirect:/index/index";
	}
	

	
}
