class ProjectsController < ApplicationController
  before_action :logged_in_member, only: [:index, :new, :create, :edit, :update, :destroy, :members]
  before_action :correct_member, only: [:edit, :update, :members]
  before_action :exec_member, only: [:new, :create, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project successfully initialized"
      redirect_to portfolio_path
    else
      if @project.errors.messages[:tag]
        @project.errors.messages[:tag].append("must either be Research or Industry (case insensitive)")
      end
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project destroyed"
    redirect_to portfolio_path
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @industry = Project.where(tag: 'industry')
    @research = Project.where(tag: 'research')
  end

  def members
    @project = Project.find(params[:id])
    @members = Member.all
    render 'team'
  end

  private

    def project_params
      params.require(:project).permit(:name, :tag, :current, :description, :picture)
    end

    def correct_member
      unless (officer_or_higher? or current_member.project_ids.include?(params[:id]))
        flash[:danger] = "Action restricted to EXECs or Project Team"
        redirect_to request.referrer
      end
    end
end
