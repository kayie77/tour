package org.lwt.tour.Controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lwt.tour.model.Admin;
import org.lwt.tour.tool.MessageObject;
import org.lwt.tour.model.Account;
import org.lwt.tour.model.Line;
import org.lwt.tour.model.Order;
import org.lwt.tour.model.Scenic;
import org.lwt.tour.model.User;
import org.lwt.tour.service.impl.AccountManager;
import org.lwt.tour.service.impl.LineManager;
import org.lwt.tour.service.impl.OrderManager;
import org.lwt.tour.service.impl.ScenicManager;
import org.lwt.tour.service.impl.UserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/user")
@SessionAttributes("currUser")
public class UserController {
	
	private UserManager userMgr;

	public UserManager getUserMgr() {
		return userMgr;
	}

	@Autowired
	@Qualifier("userMgr")
	public void setUserMgr(UserManager userMgr) {
		this.userMgr = userMgr;
	}
	
	private OrderManager orderMgr;

	public OrderManager getOrderMgr() {
		return orderMgr;
	}

	@Autowired
	@Qualifier("orderMgr")
	public void setOrderMgr(OrderManager orderMgr) {
		this.orderMgr = orderMgr;
	}
	
	private ScenicManager scenicMgr;
	
	public ScenicManager getScenicMgr() {
		return scenicMgr;
	}

	@Autowired
	@Qualifier("scenicMgr")
	public void setScenicMgr(ScenicManager scenicMgr) {
		this.scenicMgr = scenicMgr;
	}
	
	private LineManager lineMgr;
	
	public LineManager getLineMgr() {
		return lineMgr;
	}
	
	@Autowired
	@Qualifier("lineMgr")
	public void setLineMgr(LineManager lineMgr) {
		this.lineMgr = lineMgr;
	}

	
	
	/***************  view controller ********************/
	
	//用户主页
	@RequestMapping("/view")
	public String index(@ModelAttribute("currUser") Account account,Model model) {
		int a_id =  account.getA_id();
		User user = (User)userMgr.getUserByAccount(a_id);
		List<Order> orderList =orderMgr.getObjectByUser(a_id);
		Iterator iterator = orderList.iterator();  
		List<Scenic> scenicList=new ArrayList<Scenic>();
		List<Line> lineList=new ArrayList<Line>();
        while(iterator.hasNext()){  
        	Order order = (Order)iterator.next();  
        	if(order.getType()==1){
        		Scenic scenic  = scenicMgr.getScenicDao().get(Integer.parseInt(order.getSpot()));
            	scenicList.add(scenic);
        	}else{
        		Line line  = lineMgr.getLineDao().get(Integer.parseInt(order.getSpot()));
        		lineList.add(line);
        	}
        	
        }  
		model.addAttribute("user",user);
		model.addAttribute("scenicList",scenicList);
		model.addAttribute("lineList",lineList);
		model.addAttribute("account",account);
		return "user";
	}
	
	//编辑个人信息
	@RequestMapping(value="/view/edit",method=RequestMethod.GET)
	public String editUserInfo(@ModelAttribute("currUser") Account account, Model model) {
		int a_id =  account.getA_id();
		User user = (User)userMgr.getUserByAccount(a_id);
		model.addAttribute("user",user);
		model.addAttribute("account",account);
		return "userForm";
	}
	
	//编辑个人信息
	@RequestMapping(value="/admin/view/edit",params="id",method=RequestMethod.GET)
	public String adminEditUserInfo(@RequestParam int id, Model model) {
		User user = (User)userMgr.getUserDao().get(id);
		int aId = user.getAccount().getA_id();
		model.addAttribute("user",user);
		model.addAttribute("aId",aId);
		return "admin/userForm";
	}
	
	//返回全部用户信息列表
	@RequestMapping("/allUserInfo")
	public String allUserInfoView(@ModelAttribute("currUser") Admin admin,Model model) {
		List<User> userList = userMgr.getAllUserInfo();
		model.addAttribute("userList",userList);
		model.addAttribute("admin",admin);
		return "admin/user";
	}
		
	/***************  data controller ********************/

	// 编辑个人信息
	@ResponseBody
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	private MessageObject editUserInfo( @RequestBody User user, Model model) {
		MessageObject messageObject = new MessageObject();
		try {
			userMgr.update(user);
			messageObject.setMessage("保存成功!");
			messageObject.setStatus(true);
		} catch (Exception e) {
			e.printStackTrace();
			messageObject.setMessage("保存失败!");
			messageObject.setStatus(false);
		}
		
		return messageObject;
	}

	@RequestMapping(value="/del", method=RequestMethod.POST)
	@ResponseBody
	//删除
	private MessageObject delUserInfo(@RequestParam("id") int[] ids) {
		MessageObject messageObject = new MessageObject();
		try {
			userMgr.del(ids);
			messageObject.setMessage("删除成功!");
			messageObject.setStatus(true);
		} catch (Exception e) {
			// TODO: handle exception
			messageObject.setMessage("删除失败!");
			messageObject.setStatus(false);
		}
		return messageObject;
	}
	
}
