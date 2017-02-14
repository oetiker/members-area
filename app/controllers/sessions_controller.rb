class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  #skip_before_action(:require_user, {only: [:new, :create]})
  skip_before_action :require_admin, only: [:new, :create, :destroy]
  #after_action :ensure_changed_password, only: [:create]

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      ensure_changed_password
      #redirect_to '/songs'
    else
      redirect_to '/login'
      flash[:error] = "Oops, something went wrong! Ensure you type in the correct password.
        If you don't have an account, please contact the administrator."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def ensure_changed_password
    if current_user.changed_password?
      redirect_to '/songs'
    else
      flash[:notice] = "You have to change your password first."
      redirect_to '/reset_password'
    end
  end

end
