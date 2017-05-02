package com.cjt.trade.controller.backend.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.controller.BaseController;

@Controller
public class FeedbackController extends BaseController {

	@RequestMapping(value="feedback.action")
	public String feedback(){
		return "backend/page/feedback";
	}
}
