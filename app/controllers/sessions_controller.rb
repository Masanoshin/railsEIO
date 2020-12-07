class SessionsController < ApplicationController
    def login

    end
 
    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            log_in user
            redirect_to ("/event")
        else
            @error = "1"
            render 'login'
        end
    end

    def destroy
        session.delete(:user_id)
        @current_user = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/home")
    end
end
