class SessionsController < ApplicationController

    # Log user in
    def new
        @user = User.new
        render 'signin'
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            redirect_to "/signin"
        end
    end

    #logout method
    def destroy
        session.clear
        redirect_to '/'
    end

end