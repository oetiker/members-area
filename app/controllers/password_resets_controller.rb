class PasswordResetsController < ApplicationController
  skip_before_action :require_admin

  def edit
  end

  def update
    if !current_user.authenticate(user_params[:current_password])
      redirect_to '/reset_password', notice: "Current password is wrong."
      return
    end

    if current_user.update(user_params.slice(:password, :password_confirmation))
      current_user.update_attribute(:changed_password, true)
      flash[:notice] = "Password update succeed."
      redirect_to '/songs'
    else
      flash[:error] = "Password update failed."
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:current_password, :password, :password_confirmation)
    end

end
