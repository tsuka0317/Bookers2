class UsersController < ApplicationController


before_action :authenticate_user!,except: [:top,:about]
before_action :ensure_correct_user, only: [:update, :edit]

  
 def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @books = Book.where(user_id: @user.id)
    
 end
      

  def index
   @user = current_user
   @users = User.all
   @book = Book.new
   @books = Book.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :post_images)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end