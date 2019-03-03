package org.lwt.tour.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lwt.tour.model.Account;
import org.lwt.tour.model.Admin;
import org.lwt.tour.model.Country;
import org.lwt.tour.model.Province;
import org.lwt.tour.model.User;
import org.lwt.tour.service.impl.AccountManager;
import org.lwt.tour.service.impl.CountryManager;
import org.lwt.tour.service.impl.ProvinceManager;
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

@Controller
@RequestMapping("/province")
@SessionAttributes("currUser")
public class ProvinceController {
	
	private ProvinceManager provinceMgr;

	public ProvinceManager getProvinceMgr() {
		return provinceMgr;
	}

	@Autowired
	@Qualifier("provinceMgr")
	public void setProvinceMgr(ProvinceManager provinceMgr) {
		this.provinceMgr = provinceMgr;
	}
	
	private CountryManager countryMgr;

	public CountryManager getCountryMgr() {
		return countryMgr;
	}

	@Autowired
	@Qualifier("countryMgr")
	public void setCountryMgr(CountryManager countryMgr) {
		this.countryMgr = countryMgr;
	}

	
	//***************  view controller ********************//
	
	//分类界面
	@RequestMapping(value="/view") 
	public String objectView(@ModelAttribute("currUser") Admin admin,Model model) {
		List<Province>  provinceList = provinceMgr.getProvinceDao().getAllObject();
		List<Country>  countryList = countryMgr.getCountryDao().getAllObject();
		model.addAttribute("provinceList",provinceList);
		model.addAttribute("countryList",countryList);
		model.addAttribute("admin",admin);
		return "admin/province";
	}
	
	//新增分类
	@RequestMapping(value="/view/new",method=RequestMethod.GET)
	public String newObjectInfo( Model model) {
		Province province = new Province();
		List<Country>  countryList = countryMgr.getCountryDao().getAllObject();
		model.addAttribute("province",province);
		model.addAttribute("countryList",countryList);
		model.addAttribute("type",1);
		return "admin/provinceForm";
	}
	
	//编辑分类
	@RequestMapping(value="/view/edit",params="id",method=RequestMethod.GET)
	public String editObjectInfo(@RequestParam int id, Model model) {
		Province province = provinceMgr.getProvinceDao().get(id);
		List<Country>  countryList = countryMgr.getCountryDao().getAllObject();
		model.addAttribute("province",province);
		model.addAttribute("countryList",countryList);
		model.addAttribute("type",2);
		return "admin/provinceForm";
	}
	
	//搜索图书分类
	@RequestMapping(value="/revealObject") 
	public String revealObject(HttpServletRequest request,Model model) {
		
		String classword = request.getParameter("classword");
		String keyword = request.getParameter("keyword");
		
		List<Province> provinceList = provinceMgr.getProvinceDao().revealObject(classword,keyword);
		List<Country>  countryList = countryMgr.getCountryDao().getAllObject();
		model.addAttribute("provinceList",provinceList);
		model.addAttribute("countryList",countryList);
		
		return "admin/province";
	}
	
	//***************  data controller ********************//
	
	// 新增分类
	@ResponseBody
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private MessageObject newObjectInfo( @RequestBody Province province, Model model) {
		MessageObject messageObject = new MessageObject();
		try {
			provinceMgr.saveObject(province);
			messageObject.setMessage("保存成功!");
			messageObject.setStatus(true);
		} catch (Exception e) {
			e.printStackTrace();
			messageObject.setMessage("保存失败!");
			messageObject.setStatus(false);
		}
		
		return messageObject;
	}
	
	// 编辑分类
	@ResponseBody
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	private MessageObject editObjectInfo( @RequestBody Province province, Model model) {
		MessageObject messageObject = new MessageObject();
		try {
			provinceMgr.updateObject(province);
			messageObject.setMessage("修改成功!");
			messageObject.setStatus(true);
		} catch (Exception e) {
			e.printStackTrace();
			messageObject.setMessage("修改失败!");
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
			provinceMgr.delObject(ids);
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
