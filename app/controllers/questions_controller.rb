class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Questiona.all
  end 

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def question_params
    params.require(:question).permit(:title, :description, :vote_count, :user_id)
  end 

end