class UsersController < ApplicationController

  def followers
    @user = User.find(params[:id])
  end

  def followeds
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
    redirect_to user_path(user),notice:"successfully!!"
    else
      @user = user
      render:edit
    end
  end


private

def user_params
  params.require(:user).permit(:name,:introduction,:profile_image)
end
end
