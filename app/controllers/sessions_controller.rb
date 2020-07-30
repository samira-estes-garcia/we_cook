class SessionsController < ApplicationController

    # Log user in
    def new
        @user = User.new
        render '/account/sign_in'
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            redirect_to "/account/sign_in"
        end
    end

    #logout method
    def destroy
        session.clear
        redirect_to '/'
    end

end