class UsersController < ApplicationController
before_action :authenticate_user!,only: [:index,:show,:edit]

  def top
  end

  def index
  	@users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
  	  redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @book = @user
    if @user.update(user_params)
       redirect_to user_path(@user), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end



  private
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
