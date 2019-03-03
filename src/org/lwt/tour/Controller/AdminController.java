package org.lwt.tour.Controller;

import javax.servlet.http.HttpServletRequest;

import org.lwt.tour.model.Account;
import org.lwt.tour.model.Admin;
import org.lwt.tour.model.User;
import org.lwt.tour.service.impl.AccountManager;
import org.lwt.tour.service.impl.AdminManager;
import org.lwt.tour.service.impl.UserManager;
import org.lwt.tour.tool.MessageObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@RequestMapping("/admin")
@SessionAttributes("currUser")
public class AdminController {
	
	private AdminManager adminMgr;
	private UserManager userMgr;
	
	public AdminManager getAdminMgr() {
		return adminMgr;
	}

	@Autowired
	@Qualifier("adminMgr")
	public void setAdminMgr(AdminManager adminMgr) {
		this.adminMgr = adminMgr;
	}

	public UserManager getUserMgr() {
		return userMgr;
	}

	@Autowired
	@Qualifier("userMgr")
	public void setUserMgr(UserManager userMgr) {
		this.userMgr = userMgr;
	}

	@RequestMapping("/login") 
	public String login() {
		return "admin/singin";
	}
	
	//登录
	@RequestMapping(value="/program/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Admin admin = (Admin)adminMgr.login(name, password);
		if(admin==null){
			return "redirect:/admin/login?error=1";
		}
			model.addAttribute("currUser", admin);
			return "redirect:/admin/iframe";
	}
	
	//登陆系统框架主页
	@RequestMapping("/iframe")
	public String adminIframe(Model model) {
		return "admin/iframe";
	}
	
	//登陆系统主页
	@RequestMapping("/index")
	public String index(Model model) {
		return "admin/index";
	}
	
	//退出系统
	@RequestMapping(value="/index",params="logout",method=RequestMethod.GET)
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}
}
