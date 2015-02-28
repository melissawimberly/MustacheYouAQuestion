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
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :view_count, :user_id)
  end 

end


