class QuestionsController < ApplicationController


  def index
    @questions = Question.last(10)
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


