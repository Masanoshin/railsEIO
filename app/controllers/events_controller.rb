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
          @posted_id = params[:postedd_id]
        end
        user_id = session[:user_id]
        if params[:coment] != nil
          coment = params[:coment]
          comentsub = Coment.new(coment: coment, user_id: user_id, posted_id: @posted_id)
          # comentsub = Coment.new(coment: coment, user_id: user_id)
          
        
          if comentsub.save
              flash[:notice] = "コメントしました"
              redirect_to ("/detal/#{@posted_id}")
          else
              flash[:notice] = "エラー"
              redirect_to ("/detal/#{@posted_id}")
          end
        end
        # @user = User.find_by(id: session[:user_id])
        
        
        #詳細ページのコメント
        # @detal_id = Coment.find_by(posted_id: @posted_id)
        @coments = Coment.all.where(posted_id: @posted_id).order(created_at: :desc)
        # @coments = User.joins(:coments).select("users.*, coments.*")
        # 詳細ページの右側
        @posteds = Post.find_by(id: @posted_id)
        binding.irb
        # コメントした人の名前の表示
        # comented_user_id 
        # user_id = array.
        # each
        # comented_user_id = 
        @comented_user = User.find_by(id: @comented_user_id)
        
    end

    
end
