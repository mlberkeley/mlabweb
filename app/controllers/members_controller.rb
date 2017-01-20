class MembersController < ApplicationController
  before_action :logged_in_member, only: [:index, :edit, :update, :destroy]
  before_action :correct_member, only: [:edit, :update, :join, :leave]
  before_action :exec_member, only: :destroy

  def index
    @members = Member.where(activated: true).all
  end

  def show
    @member = Member.find(params[:id])
    @blogposts = @member.blogposts.paginate(page: params[:page], per_page: 5)
    redirect_to root_url and return unless @member.activated?
    @event = Event.where(live: true).first
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      @member.send_activation_email
      flash[:info] = "Check your email to activate your ML@B account!  -David"
      redirect_to login_url
    else
      if @member.errors.messages[:email]
        @member.errors.messages[:email].append("must end in @ml.berkeley.edu")
      end
      render 'new'
    end
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

  # AJAX methods for accessing model methods
  def join
    member = Member.find(params[:id])
    project = Project.find(params[:p_id])
    member.join(project)
  end

  def leave
    member = Member.find(params[:id])
    project = Project.find(params[:p_id])
    member.leave(project)
  end

  def attend
    member = Member.find(params[:id])
    event = Event.where(live: true).first
    member.attend(event)
  end

  private

    def member_params
      params.require(:member).permit(:name, :email, :password, :password_confirmation, :picture, :exec, :officer, :grade, :major, :position, :introduction)
    end

    #Before filters

    def correct_member
      @member = Member.find(params[:id])
      redirect_to(root_url) unless (current_member?(@member) or officer_or_higher?)
    end
end
