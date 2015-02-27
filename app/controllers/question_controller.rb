class QuestionController < ApplicationController
  TAB_OPTION_LATEST = "latest".freeze
  TAB_OPTION_WEEK = "week".freeze
  TAB_OPTION_MONTH = "month".freeze
  #show the list of questions based on the ?tab
  #query. Default is latest
  def index
    tabOption = params[:tab]
    @questions = nil

  end

  def new
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


end
