package com.cjt.trade.controller.backend.mall;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.User;
import com.cjt.trade.service.IDictionaryService;
import com.cjt.trade.service.IUserService;
import com.cjt.trade.util.JSONUtil;

@Controller
@RequestMapping(value = "/backend/")
public class UserController extends BaseController {

	@Resource
	private IUserService userService;
	
	@Resource
	private IDictionaryService dictionaryService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="userList.action")
	public String userList(Model model){
		// 县郡
		Map countiesMap = dictionaryService.getOptsBySetId(1);
		model.addAttribute("countiesMap", countiesMap);
		return "backend/mall/userList";
	}
	
	@RequestMapping(value = "getAllUsers.action")
	@ResponseBody
	public JSONObject getAllUsers(int page, int rows, BaseDto dto) {
		dto.setStart((page - 1) * rows);
		dto.setLimit(rows);
		List<User> users = userService.getAllUsers(dto);
		int count = userService.getAllUsersCount();
		return JSONUtil.toGridJson(users, count);
	}

	@RequestMapping(value = "getUserByEmail.action")
	@ResponseBody
	public User getUserByEmail(String email) {
		User ems = userService.getUserByEmail(email);
		return ems;
	}

	@RequestMapping(value = "deleteUserByEmail.action")
	@ResponseBody
	public boolean deleteUserByEmail(String email) {
		int lines = userService.deleteUserByEmail(email);
		return lines > 0;
	}
}
