class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      render :show
    end
  end

  def new
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end