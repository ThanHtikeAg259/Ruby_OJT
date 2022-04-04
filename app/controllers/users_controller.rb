class UsersController < ApplicationController
  # before_action :redirect_cancel, only: [:create, :update]
  before_action :authorize, only: [:index, :edit, :new, :create]

    def new
        @user = User.new
    end

    def index
        @user = User.all
    end

    def confirm
        @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation, :type, :phone, :dob, :address, :profile))
        render :create
    end

    def create
      user = User.new(params.require(:user).permit(:name, :email, :password, :type, :phone, :dob, :address, :profile))
      user.create_user_id = session[:user_id]
      user.updated_user_id = session[:user_id]
      user.save
      redirect_to '/users'
    end
end