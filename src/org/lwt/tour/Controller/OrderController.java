package org.lwt.tour.Controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lwt.tour.jackson.mixin.LineMixin;
import org.lwt.tour.jackson.mixin.ScenicMixin;
import org.lwt.tour.model.Account;
import org.lwt.tour.model.Admin;
import org.lwt.tour.model.City;
import org.lwt.tour.model.Country;
import org.lwt.tour.model.Line;
import org.lwt.tour.model.LineClass;
import org.lwt.tour.model.Order;
import org.lwt.tour.model.Province;
import org.lwt.tour.model.Scenic;
import org.lwt.tour.model.ScenicClass;
import org.lwt.tour.model.User;
import org.lwt.tour.service.impl.AccountManager;
import org.lwt.tour.service.impl.LineClassManager;
import org.lwt.tour.service.impl.LineManager;
import org.lwt.tour.service.impl.OrderManager;
import org.lwt.tour.service.impl.UserManager;
import org.lwt.tour.tool.MessageObject;
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

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/order")
@SessionAttributes("currUser")
public class OrderController {
	
	private static final ObjectMapper objectMapper = new ObjectMapper();
	
	private OrderManager orderMgr;

	public OrderManager getOrderMgr() {
		return orderMgr;
	}

	@Autowired
	@Qualifier("orderMgr")
	public void setOrderMgr(OrderManager orderMgr) {
		this.orderMgr = orderMgr;
	}

	//***************  view controller ********************//
	
	//界面
	@RequestMapping(value="/view") 
	public String objectView(@ModelAttribute("currUser") Admin admin,Model model) {
		List<Order> orderList = orderMgr.getOrderDao().getAllObject();
		model.addAttribute("orderList",orderList);
		model.addAttribute("admin",admin);
		return "admin/order";
	}
	
	//***************  data controller ********************//
	
	// 新增分类
	@ResponseBody
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	private MessageObject newObjectInfo( @ModelAttribute("currUser") Account account,HttpServletRequest request, Model model) {
		MessageObject messageObject = new MessageObject();
		String spot = request.getParameter("spot");
		int type = Integer.valueOf(request.getParameter("type"));
		Order order = new Order();
		order.setAccount(account);
		order.setSpot(spot);
		order.setType(type);
		try {
			orderMgr.saveObject(order);
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
	private MessageObject delObjectInfo(@RequestParam("id") int[] ids) {
		MessageObject messageObject = new MessageObject();
		try {
			orderMgr.delObject(ids);
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
