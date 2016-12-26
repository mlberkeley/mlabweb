class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success] = "Sup #{@member.name}. -David"
      redirect_to @member
    else
      render 'new'
    end
  end

  private

    def member_params
      params.require(:member).permit(:name, :email, :password, :password_confirmation)
    end
end
