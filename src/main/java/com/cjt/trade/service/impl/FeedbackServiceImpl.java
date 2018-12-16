package com.cjt.trade.service.impl;

import com.cjt.trade.dao.IFeedbackDao;
import com.cjt.trade.dto.FeedbackDto;
import com.cjt.trade.model.Feedback;
import com.cjt.trade.service.IFeedbackService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FeedbackServiceImpl implements IFeedbackService{

    @Resource
    private IFeedbackDao iFeedbackDao;

    @Override
    public boolean saveFeedback(Feedback feedback) {
        if(feedback == null || StringUtils.isEmpty(feedback.getContent())){
            return false;
        }
        return iFeedbackDao.saveFeedback(feedback) > 0;
    }

    @Override
    public List<Feedback> queryFeedbackPg(FeedbackDto feedbackDto, boolean isEntry) {
        if(feedbackDto.getStart()!=null && feedbackDto.getLimit()!=null){
            List<Feedback> feedList = iFeedbackDao.queryFeedbackPg(feedbackDto);
            if(isEntry){
                if(feedList!=null && feedList.size()>0){
                    for(Feedback fb : feedList){
                        String email = fb.getEmail();
                        int index = email.indexOf("@");
                        if(index > 0){
                            String first = email.substring(0, index);
                            String last = email.substring(index, email.length());
                            if(first.length()<=3){
                                first = "***";
                            }else{
                                first = first.substring(0, 3) + "***";
                            }
                            fb.setEmail(first + last);
                        }else{
                            if(email.length() <= 4){
                                email = "***";
                            }else{
                                email = email.substring(0, 2) + "***" + email.substring(email.length() - 2, email.length());
                            }
                            fb.setEmail(email);
                        }
                    }
                }
            }
            return feedList;
        }
        return null;
    }

    @Override
    public Integer queryFeedbackPgCount(FeedbackDto feedbackDto) {
        if(feedbackDto.getStart()!=null && feedbackDto.getLimit()!=null){
            return iFeedbackDao.queryFeedbackPgCount(feedbackDto);
        }
        return null;
    }

    @Override
    public boolean updateFeedback(Feedback feedback) {
        if(feedback.getId() == null){
            return false;
        }
        return iFeedbackDao.updateFeedback(feedback) > 0;
    }

    @Override
    public boolean removeFeedbackById(Integer id) {
        if(id != null && id > 0){
            return iFeedbackDao.removeFeedbackById(id) > 0;
        }
        return false;
    }

    @Override
    public Feedback queryFeedbackById(Integer id) {
        if(id == null){
            return null;
        }
        return iFeedbackDao.queryFeedbackById(id);
    }
}
