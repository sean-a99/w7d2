class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to users_url
    else
      render :new
    end
  end

  def new
    render :new
  end


  private
  def user_params
    params.require(:user).permit(:email, :password_digest, :session_token)
  end

end