class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user
  private
  def current_user
    if session[:login_uid]
      User.find_by(uid: session[:login_uid])
    end
  end
end
