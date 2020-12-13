class EventsController < ApplicationController
    def event 
        @user = User.find_by(id: session[:user_id])
        @posts = Post.all
    end
end
