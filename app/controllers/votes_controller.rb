class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(votes_params)
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