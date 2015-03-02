module ApplicationHelper
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      return nil
    end
  end

end
