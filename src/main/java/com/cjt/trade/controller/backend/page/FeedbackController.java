package com.cjt.trade.controller.backend.page;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.dto.FeedbackDto;
import com.cjt.trade.dto.ResultDTO;
import com.cjt.trade.model.Feedback;
import com.cjt.trade.service.IFeedbackService;
import com.cjt.trade.util.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.controller.BaseController;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller("feedbackController")
@RequestMapping(value = "/backend")
public class FeedbackController extends BaseController {

	@Resource
	private IFeedbackService IFeedbackService;

	@RequestMapping(value="/feedback.action")
	public String feedback(){
		return "backend/page/feedback";
	}

	@ResponseBody
	@RequestMapping(value="/listAllFeedbacks.action")
	public JSONObject listAllFeedbacks(FeedbackDto dto){
		List<Feedback> feedList = IFeedbackService.queryFeedbackPg(dto, false);
		Integer count = IFeedbackService.queryFeedbackPgCount(dto);
		return JSONUtil.toGridJson(feedList, count);
	}

	@ResponseBody
	@RequestMapping(value="/queryFeedbackById.action")
	public Feedback queryFeedbackById(Integer id){
		return IFeedbackService.queryFeedbackById(id);
	}

	@ResponseBody
	@RequestMapping(value="/deleteFeedbackById.action")
	public ResultDTO deleteFeedbackById(Integer id){
		if(id == null){
			return ResultDTO.failure().setMessage("id不能为空");
		}
		if(IFeedbackService.removeFeedbackById(id)){
			return ResultDTO.success();
		}else{
			return ResultDTO.failure().setMessage("删除失败");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/saveFeedback.action")
	public ResultDTO saveFeedback(HttpServletRequest request, Feedback feedback){
		if(IFeedbackService.saveFeedback(feedback)){
			return ResultDTO.success().setMessage("成功");
		}else{
			return ResultDTO.failure().setMessage("保存失败");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/updateFeedback.action")
	public ResultDTO updateFeedback(HttpServletRequest request, Feedback feedback){
		if(IFeedbackService.saveFeedback(feedback)){
			return ResultDTO.success().setMessage("成功");
		}else{
			return ResultDTO.failure().setMessage("保存失败");
		}
	}
}
