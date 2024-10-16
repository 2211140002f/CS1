class TopController < ApplicationController
    def main
        if session[:login_uid]
            render"main"
        else
            render"login"
        end
    end   
    
    def login
        user = User.find_by(uid: params[:uid])
        if  user and BCrypt::Password.new(user.pass) == params[:pass]
            logger.debug "-" * 50
            logger.debug user
            session[:login_uid] = params[:uid]
            redirect_to top_main_path
        else
            render "error",status:422 
        end
        

    end
end
