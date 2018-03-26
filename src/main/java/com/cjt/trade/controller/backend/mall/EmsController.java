package com.cjt.trade.controller.backend.mall;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Ems;
import com.cjt.trade.service.IEmsService;
import com.cjt.trade.util.JSONUtil;

/**
 * @author caojiantao
 */
@Controller
@RequestMapping(value = "/backend/")
public class EmsController extends BaseController {

	@Resource
	private IEmsService emsService;

	@RequestMapping(value = "/emsList.action")
	public String emsList() {
		return "backend/mall/emsList";
	}

	@ResponseBody
	@RequestMapping(value = "getAllEms.action")
	public JSONObject getAllEms(int page, int rows, BaseDto dto) {
		dto.setStart((page - 1) * rows);
		dto.setLimit(rows);
		List<Ems> ems = emsService.getAllEms(dto);
		int count = emsService.getAllEmsCount();
		return JSONUtil.toGridJson(ems, count);
	}

	@RequestMapping(value = "addEms.action")
	public String addEms(Ems ems, Model model) {
		Integer id = ems.getId();
		int lines;
		if (id == null || id == 0) {
			// 新增
			lines = emsService.insertEms(ems);
			if (lines > 0) {
				model.addAttribute("returnUrl", "emsAdd.action");
				return "success";
			}
		} else {
			// 更新
			lines = emsService.updateEms(ems);
			if (lines > 0) {
				return emsList();
			}
		}
		return "ERROR";
	}

	@RequestMapping(value = "emsAdd.action")
	public String emsAdd() {
		return "backend/mall/emsAdd";
	}

	@ResponseBody
	@RequestMapping(value = "getEmsById.action")
	public Ems getEmsById(int id) {
		return emsService.getEmsById(id);
	}

	@ResponseBody
	@RequestMapping(value = "deleteEmsById.action")
	public boolean deleteEmsById(int id) {
		int lines = emsService.deleteEmsById(id);
		return lines > 0;
	}
}
