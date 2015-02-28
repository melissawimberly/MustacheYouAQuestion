class CommentsController < ApplicationController

  def new

    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new(answer: @answer)

  end

  def create
    question = Question.find(params[:question_id])
    if make_sure_that_user_logged_in
      #add comment
      user = current_user
      params[:comment][:user_id] = user.id
      comment = Comment.create(question_params())
      question.comments.push(comment)
    end
    redirect_to question_path(question)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

   private

    def question_params
      params.require(:comment).permit(:content, :user_id)
    end

  def make_sure_that_user_logged_in
    user = current_user
    if user == nil
      @error = "Please login to add your comments"
      return false
    else
      return true
    end
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      return nil
    end
  end

end
