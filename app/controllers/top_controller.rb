class TopController < ApplicationController
    def main
        if session[:login_uid] != nil
            render "main"
        else
            render "login_form"
        end
    end
    
    def login
        user = User.find_by(uid: params[:uid])
        if user && BCrypt::Password.new(user.pass) == params[:pass]
            session[:login_uid] = user.uid
            redirect_to tweets_path
        else
            render "error", status: 422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to top_main_path
    end
    
    
end
