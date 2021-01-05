class EventsController < ApplicationController
    def event 
        @user = User.find_by(id: session[:user_id])
        @posts = Post.all
        @coment = Coment.new
    end

    def detal
        #コメントの保存
        if params[:id] != nil
          @posted_id = params[:id]
        else
          @posted_id = params[:posted_id]
        end
        user_id = session[:user_id]
        if params[:coment] != nil
          coment = params[:coment]
          comentsub = Coment.new(coment: coment, user_id: user_id, post_id: @posted_id)
          if comentsub.save
            flash[:notice] = "コメントしました"
            redirect_to ("/detal/#{@posted_id}")
          else
            flash[:notice] = "エラー"
            redirect_to ("/detal/#{@posted_id}")
          end
        end
        
        posted_id = @posted_id
        #詳細ページのコメント
        # @detal_id = Coment.find_by(posted_id: @posted_id)
        # @coments = Coment.all.where(post_id: @posted_id).order(created_at: :desc)
        # @coments = User.joins(:coments).select("users.name, users.id,coments.*").all.where(coments: {post_id: posted_id}).order(created_at: :desc)
        @coments = User.joins(:coments).select("users.name, users.id, users.img, coments.coment, coments.created_at").all.where(coments: {post_id: posted_id}).order(created_at: :desc)
        
        # 詳細ページの右側
        @posteds = Post.find_by(id: @posted_id)
    end

    def join
      user_id = session[:user_id]
    end
end
