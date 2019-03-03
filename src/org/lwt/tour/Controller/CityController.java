package org.lwt.tour.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lwt.tour.model.Account;
import org.lwt.tour.model.Admin;
import org.lwt.tour.model.City;
import org.lwt.tour.model.Country;
import org.lwt.tour.model.Province;
import org.lwt.tour.model.User;
import org.lwt.tour.service.impl.AccountManager;
import org.lwt.tour.service.impl.CityManager;
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
@RequestMapping("/city")
@SessionAttributes("currUser")
public class CityController {
	
	private CityManager cityMgr;
	private ProvinceManager provinceMgr;
	private CountryManager countryMgr;

	public ProvinceManager getProvinceMgr() {
		return provinceMgr;
	}

	@Autowired
	@Qualifier("provinceMgr")
	public void setProvinceMgr(ProvinceManager provinceMgr) {
		this.provinceMgr = provinceMgr;
	}
	
	public CityManager getCityMgr() {
		return cityMgr;
	}
	
	@Autowired
	@Qualifier("cityMgr")
	public void setCityMgr(CityManager cityMgr) {
		this.cityMgr = cityMgr;
	}

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
		List<City> cityList = cityMgr.getCityDao().getAllObject();
		List<Country>  countryList = countryMgr.getCountryDao().getAllObject();
		List<Province>  provinceList = provinceMgr.getProvinceDao().getAllObject();
		model.addAttribute("cityList",cityList);
		model.addAttribute("countryList",countryList);
		model.addAttribute("provinceList",provinceList);
		model.addAttribute("admin",admin);
		return "admin/city";
	}
	
	//新增分类
	@RequestMapping(value="/view/new",method=RequestMethod.GET)
	public String newObjectInfo( Model model) {
		City city = new City();
		List<Country>  countryList = countryMgr.getCountryDao().getAllObject();
		List<Province>  provinceList = provinceMgr.getProvinceDao().getAllObject();
		model.addAttribute("city",city);
		model.addAttribute("countryList",countryList);
		model.addAttribute("provinceList",provinceList);
		model.addAttribute("type",1);
		return "admin/cityForm";
	}
	
	//编辑分类
	@RequestMapping(value="/view/edit",params="id",method=RequestMethod.GET)
	public String editObjectInfo(@RequestParam int id, Model model) {
		City city = cityMgr.getCityDao().get(id);
		List<Country>  countryList = countryMgr.getCountryDao().getAllObject();
		List<Province>  provinceList = provinceMgr.getProvinceDao().getAllObject();
		model.addAttribute("city",city);
		model.addAttribute("countryList",countryList);
		model.addAttribute("provinceList",provinceList);
		model.addAttribute("type",2);
		return "admin/cityForm";
	}
	
	//搜索图书分类
	@RequestMapping(value="/revealObject") 
	public String revealObject(HttpServletRequest request,Model model) {
		
		String classword = request.getParameter("classword");
		String keyword = request.getParameter("keyword");
		List<City> cityList = cityMgr.getCityDao().revealObject(classword, keyword);
		List<Country> countryList = countryMgr.getCountryDao().getAllObject();
		List<Province>  provinceList = provinceMgr.getProvinceDao().getAllObject();
		model.addAttribute("cityList",cityList);
		model.addAttribute("countryList",countryList);
		model.addAttribute("provinceList",provinceList);
		return "admin/city";
	}
	
	//***************  data controller ********************//
	
	// 新增分类
	@ResponseBody
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private MessageObject newObjectInfo( @RequestBody City city, Model model) {
		MessageObject messageObject = new MessageObject();
		try {
			cityMgr.saveObject(city);
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
	private MessageObject editObjectInfo( @RequestBody City city, Model model) {
		MessageObject messageObject = new MessageObject();
		try {
			cityMgr.updateObject(city);
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
			cityMgr.delObject(ids);
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
