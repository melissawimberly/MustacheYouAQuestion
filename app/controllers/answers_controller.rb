class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @id = session[:user_id]
    p'*'*50
    p session[:user_id]
    @answer = Answer.create(user_id: session[:user_id] , description: params[:answer][:description], question_id: params[:question_id])

    p params[:question_id]
    redirect_to "/questions/#{params[:question_id]}"
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

end