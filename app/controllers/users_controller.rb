class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.index
            redirect_to user_path(@user.id)
        else
            render :new
        end
    end

    def show
        
    end
end
