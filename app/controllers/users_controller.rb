class UsersController < ApplicationController
    # before_action :log_in, only:[:edit, :update, :mypage, :destroy] ログインしてなくても観覧できるようになっている

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
        user_id = session[:user_id]
        # joinedEvent = Join.where(user_id: session[:user_id]).all
        @joins = Post.joins(:joins).select("posts.*, joins.user_id, joins.post_id").where(joins: {user_id: user_id})
        
    end

    def notjoin
        post_id = params[:id]
        Join.find_by(post_id: post_id).delete
        redirect_to "/mypage"
    end

    def edit
        user_id = params[:id].to_i
        id = session[:user_id]
       
        if user_id == id
           @user = User.find_by(id: params[:id])
        else
            flash[:notice] = "ログインしてくだい"
            redirect_to ('/login')
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            flash[:notice] = "変更しました"
            redirect_to "/mypage"
        else
            flash[:notice] = "エラーです"
            render "mypage"
        end
    end

        private
        def user_params
            params.require(:user).permit(:name, :email, :password,:password_confirmation, :img, :intro)
        end

        def loginuser

        end
end
