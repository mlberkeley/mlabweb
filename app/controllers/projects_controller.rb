class ProjectsController < ApplicationController
  before_action :logged_in_member, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :correct_member, only: [:edit, :update]
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
    # @members = @project.members.paginate(page: params[:page], per_page: 5)
  end

  def index
    @industry = Project.where(tag: 'industry')
    @research = Project.where(tag: 'research')
  end

  private

    def project_params
      params.require(:project).permit(:name, :tag, :current, :description, :picture)
    end

    def correct_member
      # @member = Member.find(params[:id])
      # redirect_to(root_url) unless (current_member?(@member) or current_member.admin?)

      # execs OR project members should be able to :edit, :update
    end
end
