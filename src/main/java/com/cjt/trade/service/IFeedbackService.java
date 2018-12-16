package com.cjt.trade.service;

import com.cjt.trade.dto.FeedbackDto;
import com.cjt.trade.model.Feedback;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IFeedbackService {

    boolean saveFeedback(Feedback feedback);

    List<Feedback> queryFeedbackPg(FeedbackDto feedbackDto, boolean isEntry);

    Integer queryFeedbackPgCount(FeedbackDto feedbackDto);

    boolean updateFeedback(Feedback feedback);

    boolean removeFeedbackById(Integer id);

    Feedback queryFeedbackById(Integer id);
}
