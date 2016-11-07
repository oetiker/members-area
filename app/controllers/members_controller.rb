class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_admin, only: [:index, :show]
  

  def index
    if params[:q].present?
      @members = Member.search(params[:q])
    else 
      @members = Member.all
    end
  end

  def show
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    if @member.save
       redirect_to @member, notice: 'Member was successfully created.' 
    else
      render :new
    end
  end

  def update
        if @member.update(member_params)
          redirect_to @member, notice: 'Member was successfully updated.'
        else
          render :edit
        end
    end

    def destroy
      @member.destroy
        redirect_to members_url, notice: 'Member was successfully destroyed.'
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:first_name, :last_name, :email, :mobil_number, :date_of_joining, :exit_date, :choir_active, :voice)
    end
end
