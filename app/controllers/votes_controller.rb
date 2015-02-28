class VotesController < ApplicationController

  def new
    vote = Vote.new(user_id: 1, vote_value: params[:vote_value])
    answer = Answer.find( params[:answer_id])

    if vote.vote_value == 1
      answer.votes.push(vote)
    else
      answer.votes.delete(answer.votes.count - 1)
    end

    redirect_to question_path(@answer.question)
  end

  def create

    @vote = Vote.create(user_id: current_user.id, vote_value: params[:vote_value])
    question = Question.find(params[:question_id])
    question.votes.push(@vote)

    p '*' *60
   redirect_to question_path(question)

  end

  def show
  end

  def edit
  end

  def update
  end
  ####
  def destroy
  end


  private

  def vote_params
    params.require(:vote).permit(:vote_value, :user_id)
  end

end