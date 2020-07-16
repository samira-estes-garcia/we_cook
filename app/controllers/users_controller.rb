class UsersController < ApplicationController

    def new
       @user = User.new 
    end
    # Create new user and set their session id to the user id, redirect to show path or rerender the /new page
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    # Show page for once the user is signed in
    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
