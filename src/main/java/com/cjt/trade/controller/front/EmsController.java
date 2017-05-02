package com.cjt.trade.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.model.Ems;
import com.cjt.trade.service.IEmsService;

@Controller("emsFrontCtl")
@RequestMapping(value="/")
public class EmsController extends BaseFrontController {

	@Resource
	private IEmsService emsService;
	
	/**
	 * EMS信息页
	 */
	@RequestMapping(value="/ems.action")
	public String ems(int id, Model model, HttpServletRequest request){
		initFixModule(request, model);
		
		Ems ems = emsService.getEmsById(id);
		model.addAttribute("ems", ems);
		return "front/build/ems";
	}
}
