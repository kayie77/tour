package org.lwt.tour.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lwt.tour.model.About;
import org.lwt.tour.model.Account;
import org.lwt.tour.model.LineClass;
import org.lwt.tour.model.ScenicClass;
import org.lwt.tour.model.User;
import org.lwt.tour.service.impl.AccountManager;
import org.lwt.tour.service.impl.IntroduceManager;
import org.lwt.tour.service.impl.LineClassManager;
import org.lwt.tour.service.impl.ScenicClassManager;
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
@RequestMapping("/account")
@SessionAttributes("currUser")
public class AccountController {
	
	private AccountManager accountMgr;
	private UserManager userMgr;
	private ScenicClassManager scenicClassMgr;
	private LineClassManager lineClassMgr;

	public UserManager getUserMgr() {
		return userMgr;
	}

	@Autowired
	@Qualifier("userMgr")
	public void setUserMgr(UserManager userMgr) {
		this.userMgr = userMgr;
	}

	public AccountManager getAccountMgr() {
		return accountMgr;
	}

	@Autowired
	@Qualifier("accountMgr")
	public void setAccountMgr(AccountManager accountMgr) {
		this.accountMgr = accountMgr;
	}
	
	public ScenicClassManager getScenicClassMgr() {
		return scenicClassMgr;
	}

	@Autowired
	@Qualifier("scenicClassMgr")
	public void setScenicClassMgr(ScenicClassManager scenicClassMgr) {
		this.scenicClassMgr = scenicClassMgr;
	}

	public LineClassManager getLineClassMgr() {
		return lineClassMgr;
	}

	@Autowired
	@Qualifier("lineClassMgr")
	public void setLineClassMgr(LineClassManager lineClassMgr) {
		this.lineClassMgr = lineClassMgr;
	}
	
	private IntroduceManager introduceMgr;
	
	public IntroduceManager getIntroduceMgr() {
		return introduceMgr;
	}

	@Autowired
	@Qualifier("introduceMgr")
	public void setIntroduceMgr(IntroduceManager introduceMgr) {
		this.introduceMgr = introduceMgr;
	}
	
	
	@RequestMapping("/login") 
	public String login() {
		return "singin";
	}
	
	//注册
	@RequestMapping(value="/view/register",method=RequestMethod.GET) 
	public String register(Model model) {
		Account account = new Account() ;
		model.addAttribute("account",account);
		return "registerForm";
	}
	
	
	//登录
	@RequestMapping(value="/process/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {
		String a_name = request.getParameter("a_name");
		String password = request.getParameter("password");
		Account account = (Account)accountMgr.login(a_name, password);
		if(account==null){
			return "redirect:/account/login?error=1";
		}
			model.addAttribute("currUser", account);
			return "redirect:/account/index";

	}

	//登陆系统主页
	@RequestMapping("/index")
	public String index(Model model) {
		List<ScenicClass>  scenicClassList = scenicClassMgr.getScenicClassDao().getAllObject();
		List<LineClass> lineClassList = lineClassMgr.getLineClassDao().getAllObject();
		About introduce = (About)introduceMgr.getIntroduceDao().getObject();
		
		model.addAttribute("introduce",introduce);
		model.addAttribute("scenicClassList",scenicClassList);
		model.addAttribute("lineClassList",lineClassList);
	
		return "index";
	}
	
	//退出系统
	@RequestMapping(value="/index",params="logout",method=RequestMethod.GET)
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/account/index";
	}
	
	//编辑密码
	@RequestMapping(value="/view/password",method=RequestMethod.GET)
	public String editPasswordView(@ModelAttribute("currUser") Account account, Model model) {
		model.addAttribute("account",account);
		return "accountForm";
	}
		
	/***************  data controller ********************/
		
	// 新增用户
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	private MessageObject newAccountInfo( @RequestBody Account account, Model model) {
		MessageObject messageObject = new MessageObject();

		if(accountMgr.findByStudentID(account.getA_name())==null){
			User user = new User();//新建用户信息表  唯一
			user.setU_name(account.getA_name());
		try {
			accountMgr.saveAccount(account);
			userMgr.save(user,account);
			model.addAttribute("currUser", account);
			messageObject.setMessage("保存成功!");
			messageObject.setStatus(true);
		} catch (Exception e) {
			e.printStackTrace();
			messageObject.setMessage("保存失败!");
			messageObject.setStatus(false);
		}
		}else{
			messageObject.setMessage("保存失败!");
			messageObject.setStatus(false);
		}
		return messageObject;
	}

	// 编辑密码
	@ResponseBody
	@RequestMapping(value = "/password/edit", method = RequestMethod.POST)
	private MessageObject editPassword( @RequestBody Account account, Model model) {
		MessageObject messageObject = new MessageObject();
		try {
			accountMgr.update(account);
			messageObject.setMessage("保存成功!");
			messageObject.setStatus(true);
		} catch (Exception e) {
			e.printStackTrace();
			messageObject.setMessage("保存失败!");
			messageObject.setStatus(false);
		}
			
		return messageObject;
	}
	
}
