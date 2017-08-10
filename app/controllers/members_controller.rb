class MembersController < ApplicationController
  before_action :authenticate_member!, only: [:index, :edit]
  before_action :correct_member, only: [:edit, :update]

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
    @post = @member.posts.build if member_signed_in? and @member == current_member
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      flash[:success] = "Profile updated"
      redirect_to @member
    else
      render 'edit'
    end
  end

  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = "Member deleted"
    redirect_to members_url
  end

  private

    def member_params
      params.require(:member).permit(:lname, :fname, :introduction, :major, :grade, :position, :exec, :officer, :picture)
    end

    def correct_member
      @member = Member.find(params[:id])
      redirect_to(@member) unless (current_member == @member or officer_or_higher?)
    end
end
