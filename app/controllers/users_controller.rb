class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
  end

  def show
    render @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render  @user, status: :created
    else
      render  @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render @user
    else
      render @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :user_type, :user_photo, :address, :email, :password)
  end
end
