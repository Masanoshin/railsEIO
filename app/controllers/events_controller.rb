class EventsController < ApplicationController
    def event 
        @user = User.find_by(id: session[:user_id])
        @posts = Post.all
        
        # @posts = Post.page(params[:page]).per(20)
        @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)

        Coment.new
        Join.new
        user_id = session[:user_id]
        @joinedEvent = Join.where(user_id: session[:user_id]).all
        @joins = Post.joins(:joins).select("posts.*, joins.*").where(joins: {user_id: user_id})

        # 参加しているかどうか
        joinId = {}
        @joinedEvent.each do |u|
          joinId[u.post_id] = u.post_id
        end
        joinId
        @joinId = joinId.values
        
        
    end

    def detal
        #コメントの保存
        @user = session[:user_id]
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
        @coments = User.joins(:coments).select("users.name, users.id, users.img, coments.coment, coments.created_at").all.where(coments: {post_id: posted_id}).order('coments.created_at desc')
        
        
        # 詳細ページの右側
        @posteds = Post.find_by(id: @posted_id)

        # 参加人数の表示
        @num = Join.where(post_id: @posted_id).count

        # 参加しているかどうか
        @join = Join.where(post_id: posted_id).where(user_id: session[:user_id]).first
        
        
    end

    def join

      user_id = session[:user_id]
      posted_id = params[:id]
      join = Join.new(user_id: user_id, post_id: posted_id)
      if join.save
        flash[:notice] = "参加登録完了しました"
        redirect_to "/mypage"
      else
        flash[:notice] = "参加できませんでした"
        redirect_to "/event"
      end


    end
end
