package com.cjt.trade.controller.front;

import com.cjt.trade.dto.FeedbackDto;
import com.cjt.trade.dto.ResultDTO;
import com.cjt.trade.model.Feedback;
import com.cjt.trade.service.IFeedbackService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller("frontFeedbackController")
@RequestMapping(value = "feedback")
public class FrontFeedbackController extends BaseFrontController{

    @Resource
    private IFeedbackService IFeedbackService;

    @ResponseBody
    @RequestMapping(value = "/queryFaqsPg.action")
    public ResultDTO<List<Feedback>> queryFaqsPg(HttpServletRequest request, FeedbackDto feedbackDto){
        if(feedbackDto.getStart() == null){
            feedbackDto.setStart(0);
        }
        if(feedbackDto.getLimit() == null){
            feedbackDto.setLimit(10);
        }
        List<Feedback> feedList = IFeedbackService.queryFeedbackPg(feedbackDto, true);
        Integer count = IFeedbackService.queryFeedbackPgCount(feedbackDto);

        return ResultDTO.success().setData(feedList).put("count", count);
    }

    @ResponseBody
    @RequestMapping(value = "/queryFaqsPgCount.action")
    public ResultDTO queryFaqsPgCount(HttpServletRequest request, FeedbackDto feedbackDto){
        if(feedbackDto.getStart() == null){
            feedbackDto.setStart(0);
        }
        if(feedbackDto.getLimit() == null){
            feedbackDto.setLimit(10);
        }
        Integer count = IFeedbackService.queryFeedbackPgCount(feedbackDto);
        return ResultDTO.success().setData(count);
    }

    @RequestMapping(value = "/faq.action")
    public String faq(Model model, HttpServletRequest request) {
        initFixModule(request, model);
        return "front/build/faq";
    }

    @ResponseBody
    @RequestMapping(value = "/saveFaq.action")
    public ResultDTO saveFaq(HttpServletRequest request, Feedback feedback, String verifyCode, HttpSession session){
        String code = (String)session.getAttribute("verification");
        if(StringUtils.isEmpty(verifyCode) || !verifyCode.equalsIgnoreCase(code)){
            return ResultDTO.failure().setCode(501).setMessage("検証コードの誤り");
        }
        if(feedback == null || StringUtils.isEmpty(feedback.getContent())){
            return ResultDTO.failure().setCode(501).setMessage("情報が不全である");
        }
        if(IFeedbackService.saveFeedback(feedback)){
            return ResultDTO.success().setMessage("成功");
        }else{
            return ResultDTO.failure().setCode(500).setMessage("伝言に失敗した");
        }
    }
}
