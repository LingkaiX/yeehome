class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    puts user.to_s
    if user && user.authenticate(params[:password])
      # 登入用户，然后重定向到用户的资料页面
      session[:user_id] = user.id
      @current_user ||= User.find_by(id: session[:user_id])
      redirect_to user
    else
      # 创建一个错误消息
      flash[:danger] = 'Invalid email/password combination' # 不完全正确
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
end
