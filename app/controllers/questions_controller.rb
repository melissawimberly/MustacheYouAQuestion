class QuestionsController < ApplicationController
  LISTING_LIMIT = 10

  def index
    tab = params[:tab]
    p "select tab #{tab}"
    @active_question_tab = GlobalConstants::TAB_OPTION_LATEST
    if tab == GlobalConstants::TAB_OPTION_TRENDING
      @questions = Question.get_trending(LISTING_LIMIT)
      @active_question_tab = GlobalConstants::TAB_OPTION_TRENDING
    elsif tab == GlobalConstants::TAB_OPTION_MOST_VOTED
      @questions = Question.get_most_voted_on(LISTING_LIMIT)
      @active_question_tab = GlobalConstants::TAB_OPTION_MOST_VOTED
    else
      @questions = Question.last(LISTING_LIMIT)
    end

    @questions = @questions.sort_by{|q| q.created_at.to_i}.reverse
  end

  def new
    @question = Question.new
  end

  def create
    params[:question][:user_id] = current_user.id
    @question = Question.create(question_params)
    redirect_to questions_path
  end

  def show

    # begin
      @question = Question.find_by(id: params[:id])

      @sum = QuestionVote.joins(:vote).where('question_id =?', @question.id).sum('votes.vote_value')

    views = @question.view_count || 0
      views +=1
      @question.view_count = views;
      @question.save

    # rescue Exception => e
    #   #log the error and continue
    #   p e
    # end
  end


  def edit
    @question = Question.find_by(id: params[:id])
  end

  def update
    question = Question.find_by(id: params[:id])
    question.update_attributes(question_params)
    redirect_to '/questions'
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    #bc we are not using ajax, we need to redirect after this is destroyed
    redirect_to '/questions'
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :view_count, :user_id)
  end

end


