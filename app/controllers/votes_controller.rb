class VotesController < ApplicationController

  def new
    vote = Vote.new(user_id: 1, vote_value: params[:vote_value])
    answer = Answer.find( params[:answer_id])
    p vote.vote_value
    p params

    p'*'*40

    if vote.vote_value == 1
      answer.votes.push(vote)
    else
      answer.votes.delete(answer.votes.count - 1)
    end

    redirect_to '/questions/2'
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def upvote
    vote = Vote.new(user_id: 1, vote_value: params[:vote_value]
  end

end