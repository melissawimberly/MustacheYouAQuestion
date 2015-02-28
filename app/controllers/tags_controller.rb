class TagsController < ApplicationController


  def new
  end

  def create
  end

  def show
    tag = Tag.find(params[:id])
    @questions = tag.questions
    render 'questions/index'
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
