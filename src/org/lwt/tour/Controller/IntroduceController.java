package org.lwt.tour.Controller;

import org.lwt.tour.model.Admin;

import org.lwt.tour.model.About;
import org.lwt.tour.service.impl.IntroduceManager;
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
@RequestMapping("/introduce")
@SessionAttributes("currUser")
public class IntroduceController {
	
	private IntroduceManager introduceMgr;
	
	public IntroduceManager getIntroduceMgr() {
		return introduceMgr;
	}

	@Autowired
	@Qualifier("introduceMgr")
	public void setIntroduceMgr(IntroduceManager introduceMgr) {
		this.introduceMgr = introduceMgr;
	}
	
	//***************  view controller ********************//
	
	//分类界面
	@RequestMapping(value="/view") 
	public String objectView(@ModelAttribute("currUser") Admin admin,Model model) {
		About  introduce = (About)introduceMgr.getIntroduceDao().getObject();
		model.addAttribute("introduce",introduce);
		model.addAttribute("admin",admin);
		return "admin/introduce";
	}

	//编辑分类
	@RequestMapping(value="/view/edit",params="id",method=RequestMethod.GET)
	public String editObjectInfo(@RequestParam int id, Model model) {
		About introduce = introduceMgr.getIntroduceDao().get(id);
		model.addAttribute("introduce",introduce);
		return "admin/introduceForm";
	}

	//***************  data controller ********************//
	
	// 编辑分类
	@ResponseBody
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	private MessageObject editObjectInfo( @RequestBody About introduce, Model model) {
		MessageObject messageObject = new MessageObject();
		try {
			introduceMgr.updateObject(introduce);
			messageObject.setMessage("修改成功!");
			messageObject.setStatus(true);
		} catch (Exception e) {
			e.printStackTrace();
			messageObject.setMessage("修改失败!");
			messageObject.setStatus(false);
		}
		
		return messageObject;
	}

}
