class TagsController < ApplicationController


  def new
  end

  def create
  end

  def show
    tag = Tag.find(params:id)
    @questions = tag.questions
    redirect_to questions_path
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
