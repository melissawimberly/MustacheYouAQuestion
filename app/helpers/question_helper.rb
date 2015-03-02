

module QuestionHelper
  DAY = 24*360

  def format_asked_time(question)
    formated_string = ""
    Time.zone= "Eastern Time (US & Canada)"
    now = Time.zone.local_to_utc(Time.now)

    interval = (now-question.created_at).to_i

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

  def question_tab_status(tab)
      return "class=active" if @active_question_tab == tab
  end
end
