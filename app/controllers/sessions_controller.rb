class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:login][:email].downcase)

        if user && user.authenticate(params[:login][:password])
            session[:user_id] = user.id.to_s
            redirect_to root_path
        else
            flash.now.alert = "Incorrect Email or Password!!!"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end
end
