package com.cjt.trade.dao;

import com.cjt.trade.dto.FeedbackDto;
import com.cjt.trade.model.Feedback;

import java.util.List;

public interface IFeedbackDao {

    int saveFeedback(Feedback feedback);

    List<Feedback> queryFeedbackPg(FeedbackDto feedbackDto);

    int updateFeedback(Feedback feedback);

    int removeFeedbackById(int id);

    int queryFeedbackPgCount(FeedbackDto feedbackDto);

    Feedback queryFeedbackById(Integer id);
}
