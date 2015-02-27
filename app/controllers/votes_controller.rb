class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(user_id: 1, vote_value: params[:vote_value])
    question = Question.find(params[:question_id])
    question.votes.push(@vote)
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

  def vote_params
    params.require(:vote).permit(:vote_value, :user_id)
  end 
end