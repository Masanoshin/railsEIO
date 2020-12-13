class UsersController < ApplicationController
    

    def new
        @user = User.new
    end

    def create
         @user = User.new(user_params) #このコードは @user = User.new(naem: name, email:email, password: password, password_confirmation:pasword_confirtion)と同じ
         
        # @user = User.new(name: name, email: email, password: password, password_confirmation: password_confirmation)
        if @user.save
            flash[:success] = "登録が完了しました"
            redirect_to ("/login")
        else
            render "new"
        end
    end

    def mypage
        @user = User.find_by(id: session[:user_id])

    end

    def edit
        @user = User.find_by(id: params[:id])
    end

        private
        def user_params
            params.require(:user).permit(:name, :email, :password,:password_confirmation)
        end
end
