package org.lwt.tour.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lwt.tour.model.Admin;
import org.lwt.tour.model.ScenicClass;
import org.lwt.tour.service.impl.ScenicClassManager;
import org.lwt.tour.tool.MessageObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/scenicClass")
@SessionAttributes("currUser")
public class ScenicClassController {
	
	private ScenicClassManager scenicClassMgr;
	
	public ScenicClassManager getScenicClassMgr() {
		return scenicClassMgr;
	}

	@Autowired
	@Qualifier("scenicClassMgr")
	public void setScenicClassMgr(ScenicClassManager scenicClassMgr) {
		this.scenicClassMgr = scenicClassMgr;
	}

	//***************  view controller ********************//
	
	//分类界面
	@RequestMapping(value="/view") 
	public String objectView(@ModelAttribute("currUser") Admin admin,Model model) {
		List<ScenicClass>  scenicClassList = scenicClassMgr.getScenicClassDao().getAllObject();
		model.addAttribute("scenicClassList",scenicClassList);
		model.addAttribute("admin",admin);
		return "admin/scenicClass";
	}

	//新增分类
	@RequestMapping(value="/view/new",method=RequestMethod.GET)
	public String newObjectInfo( Model model) {
		ScenicClass scenicClass = new ScenicClass();
		model.addAttribute("scenicClass",scenicClass);
		model.addAttribute("type",1);
		return "admin/scenicClassForm";
	}
	
	//编辑分类
	@RequestMapping(value="/view/edit",params="id",method=RequestMethod.GET)
	public String editObjectInfo(@RequestParam int id, Model model) {
		ScenicClass scenicClass = scenicClassMgr.getScenicClassDao().get(id);
		model.addAttribute("scenicClass",scenicClass);
		model.addAttribute("type",2);
		return "admin/scenicClassForm";
	}
	
	//搜索图书分类
	@RequestMapping(value="/revealObject") 
	public String revealObject(HttpServletRequest request,Model model) {
		String keyword = request.getParameter("keyword");
		
		List<ScenicClass> scenicClassList = scenicClassMgr.getScenicClassDao().revealObject(keyword);
		model.addAttribute("scenicClassList",scenicClassList);
		return "admin/scenicClass";
	}
	
	//***************  data controller ********************//
	
	// 新增分类
	@ResponseBody
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private MessageObject newObjectInfo( @RequestBody ScenicClass scenicClass, Model model) {
		MessageObject messageObject = new MessageObject();
		try {
			scenicClassMgr.saveObject(scenicClass);
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
	private MessageObject editObjectInfo( @RequestBody ScenicClass scenicClass, Model model) {
		MessageObject messageObject = new MessageObject();
		try {
			scenicClassMgr.updateObject(scenicClass);
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
			scenicClassMgr.delObject(ids);
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
