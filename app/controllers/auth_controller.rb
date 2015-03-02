class AuthController < ApplicationController


  def welcome
    user = current_user
    if user
      redirect_to '/'
    else
      render "welcome"
    end
  end

  def get_login
    if params[:error]
      flash[:notice] = "Invalid email and/or password"
    end
    render "login"
  end

  def get_logout
    session.clear
    redirect_to '/'
  end

  def post_login
    #TODO remove this - for test only
    # if true
    #   redirect_to '/login?error=1'
    #   return false
    # end

    user = User.find_by({email: params[:user][:email]})

    if (user == nil || !user.authenticate(params[:user][:password]))

      redirect_to '/login?error=1'
    else
      session[:user_id] = user.id
      p "-------------- #{session[:last_question_id]}"
      redirect
    end
  end


  def get_signup

    if params[:error]
      @error = "Invalid account information is provided. Please check your entries and try again"
    end
    render "signup"
  end

  def post_signup

    begin
      #verify that password and confirmation password match
      #verify that all info is provided
      user = User.create(user_params);
      session[:user_id] = user.id
      redirect
    rescue Exception => e
      p e
      redirect_to '/signup?error=2'
    end
  end


  private


   def user_params
    params.require(:user).permit(:username, :email, :password)
   end

   def redirect
    if session[:last_question_id]
        redirect_to question_path(session[:last_question_id])
      else
        redirect_to questions_path
      end
      return false
   end

end
