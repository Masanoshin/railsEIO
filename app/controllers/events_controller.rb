class EventsController < ApplicationController
    def event 
        @user = User.find_by(id: session[:user_id])
        @posts = Post.all
        @coment = Coment.new
    end

    def detal
        if params[:id] != nil
          @posted_id = params[:id]
        else
          @posted_id = params[:postedd_id]
        end
        user_id = session[:user_id]
        # @coment = params[:coment]
        if params[:coment] != nil
          coment = params[:coment]
          comentsub = Coment.new(coment: coment, user_id: user_id, posted_id: @posted_id)
          
          if comentsub.save
              flash[:notice] = "コメントしました"
              redirect_to ("/detal/#{@posted_id}")
          else
              flash[:notice] = "エラー"
              redirect_to ("/detal/#{@posted_id}")
          end
        end


        
        

    end
end
