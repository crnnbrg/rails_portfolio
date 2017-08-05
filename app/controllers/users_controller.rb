class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User added successfully!'
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end
end
