class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  protected
  def authorize_blogger!
    if user_signed_in?
      return
    else
      flash[:notice] = 'You need to sign in first'
      redirect_to new_user_session_path
    end
  end
end
