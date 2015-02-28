class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @id = session[:user_id]
<<<<<<< HEAD
    @answer = Answer.create(user_id: , description: params[:description], question_id: params[:question_id])
    p'*'*50
=======
    p'*'*50
    p session[:user_id]
    @answer = Answer.create(user_id: session[:user_id] , description: params[:answer][:description], question_id: params[:question_id])

>>>>>>> 18f25009024df13c95fe9b9613c6d65896e9cfff
    p params[:question_id]
    redirect_to "/questions/#{params[:question_id]}"
  end

  def show
  end

  def edit
    @answer = Answer.find_by(question_id: params[:question_id], user_id: session[:user_id])
    @question = Question.find(params[:question_id])
  end

  def update
    @answer = Answer.find_by(question_id: params[:question_id], user_id: session[:user_id])
<<<<<<< HEAD
    @answer.update_attributes(description: params[:action][:description])
=======
    @answer.update_attributes(description: params[:description])
    redirect_to "/questions/#{params[:question_id]}"
>>>>>>> 18f25009024df13c95fe9b9613c6d65896e9cfff
  end

  def destroy
    @answer = Answer.find_by(question_id: params[:question_id], user_id: session[:user_id])
    @answer.destroy
    redirect_to "/questions/#{params[:question_id]}"
  end

   def answer_params
    params.require(:answer).permit(:description, :user_id, :question_id)
  end


end