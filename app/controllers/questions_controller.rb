class QuestionsController < ApplicationController


  def index
    @questions = Question.last(10)
  end

  def new
  end

  def create
  end

  def show
    @question = Question.find_by(id: params[:id])
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


