class QuestionsController < ApplicationController

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


end


