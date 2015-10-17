class SessionsController < ApplicationController
  def new
  end
  def createo
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: "SIGNED IN"
  end
  def create
    @user = User.find_by_email(params[:session][:email])
  if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to '/'
  else 
    flash.now[:danger] = 'Incorrect email or password.'
    render 'new'

  end 
end
  def destroyo
      session[:user_id] = nil
      session[:omniauth] = nil
      redirect_to root_url, notice: "SIGNED OUT"
  end
  def destroy 
  session[:user_id] = nil 
  redirect_to '/' 
end
  
end