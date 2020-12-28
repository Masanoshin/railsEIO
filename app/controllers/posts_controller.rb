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

      private
      def post_params
        params.require(:post).permit(:title, :content, :user_id, :date, :img)
      end

      
end
