class AuthController < ApplicationController


  def welcome
    user = current_user
    if user
      redirect_to "/groups/#{current_user.group.id}/schedules"
    else
      render "welcome"
    end
  end

  def get_login
    if params[:error]
      @error = "Invalid email and/or password"
    end
    render "login"
  end

  def get_logout
    session.clear
    redirect_to '/'
  end

  def post_login
    #TODO remove this - for test only
    if true
      redirect_to '/login?error=1'
      return false
    end

    user = User.find_by({email: params[:user][:email]})

    if (student == nil || !student.authenticate(params[:student][:password]))

      redirect_to '/login?error=1'
    else
      session[:user_id] = student.id
      redirect_to "/groups/#{student.group.id}/schedules"
    end
  end


  def get_signup
    @groups = Group.all
    if params[:error]
      @error = "Invalid account information is provided. Please check your entries and try again"
    end
    render "signup"
  end

  def post_signup

    begin
      #verify that password and confirmation password match
      #verify that all info is provided
      params[:user].delete("confirmpassword")
      user = User.create(params[:user]);
      redirect_to "/groups/#{student.group.id}/schedules"
    rescue Exception => e
      p e
      redirect_to '/signup?error=2'
    end
  end


end