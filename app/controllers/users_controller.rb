class UsersController < ApplicationController
  # Sử dụng bộ lọc để kiểm tra trạng thái đăng nhập
  # Nếu người dùng truy cập vô edit, update thì chạy vào 'logged_in_user' để kiểm tra
  before_action :logged_in_user,  only:  [:edit, :update]
  before_action :correct_user,    only:  [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Xác nhận người dùng đã đăng nhập
  # Confirms a logged-in user
  def logged_in_user
    unless logged_in?       # nếu chưa đăng nhập thì chạy block dưới
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  # Xác nhận user đúng
  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end