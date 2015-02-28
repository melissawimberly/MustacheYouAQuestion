module QuestionHelper
  DAY = 24*360

  def format_asked_time(question)
    formated_string = ""
    end_time = DateTime.now

    start_time = question.updated_at.to_datetime
    interval = ((end_time - start_time) * 24 * 60 * 60).to_i

    ##TODO add days
    if interval > DAY
      formated_string = (interval/DAY).to_s<< " days"
    elsif interval > 360
      formated_string = (interval/360).to_s<< " hours"
    elsif interval >60
      formated_string = (interval/60).to_s<< " mins"
    else
      formated_string = interval.to_i.to_s<< " secs"
    end
    formated_string<<" ago"
  end

  def get_view_count(question)
    return 0 if question.view_count == nil
    question.view_count
  end
end
