class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  skip_before_action :require_admin, only: [:index]


  def index
    if params[:q].present?
      @users = User.search(params[:q])
    else
      @users = User.all
    end
  end

  # def show
  # end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
       redirect_to '/users', notice: "User was successfully created."
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to '/users', notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
      redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role, :password, :changed_password, :mobil_number, :date_of_joining,
                                    :exit_date, :choir_active, :voice)
    end
end
