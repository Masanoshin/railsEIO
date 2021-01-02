class PostsController < ApplicationController
    before_action :post_params, only:[:create]
    def show
        @user = User.find_by(id: session[:user_id])
        @post = Post.new
 
        render 'post'
    end

    def create
        
        user_id = session[:user_id]
        title = params[:post][:title]
        content = params[:post][:content]
        date = params[:post][:date]
        img = params[:post][:img]
        @post = Post.new(title: title, content: content,user_id: user_id, date: date, img: img)
        # @post = Post.new(post_params)
        
        # @post = Post.new(title: :title, content: :conten ,date: :date)
        # @post = Post.new(post_params)
        
        if @post.save
            # redirect_to "events"
            redirect_to "/event"
        else 

            render "post"
            flash[:notice] = "error"
        end
    end

    def destroy
        posted_id = params[:id]
        posted = Post.find_by(id: posted_id)
        posted.destroy
    
        redirect_to "/event"
      end
  
      def edit
        user = User.find_by(id: session[:user_id])
 
        user_admin = user.admin
        if user_admin == 1
            posted_id = params[:id]
            @posted = Post.find_by(id: posted_id)
            render :edit
        else    
            flash[:notice] = "権限がありません"
            redirect_to "/login"
        end
      end
  
      def update
        posted_id = params[:id]
        @posted = Post.find_by(id: posted_id)
        title = params[:title]
        date = params[:date]
        content = params[:content]
        img = params[:img]
        if @posted.update(title: title, date: date, content: content, img: img)
            flash[:notice] = "編集しました"
            redirect_to "/event"
        else
            flash[:notice] = "エラーです"
            redirect_to "/event"
        end
        
        
      end

      private
      def post_params
        params.require(:post).permit(:title, :content, :date, :img)
      end

      
end
