class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]
  # byebug
  # def create
  #   if @user.save
  #     NotificationMailer.send_confirm_to_user(@user).deliver_later
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def edit
    if @user == current_user
      @user = User.find(params[:id])
				render :edit
			else
        @user = current_user
        # render user_path(current_user.id)
        render :edit
      end
    end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
   end   
  end
  end
