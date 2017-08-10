class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :members]
  before_action :authenticate_member!, only: [:index, :new, :edit, :create, :update, :destroy, :members]
  before_action :exec_member, only: [:new, :create, :destroy]
  before_action :correct_member, only: [:edit, :update, :members]

  # GET /projects
  # GET /projects.json
  def index
    @industry = Project.where(tag: 'industry')
    @research = Project.where(tag: 'research')
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @posts = Post.where(project: @project.id)
    @post = current_member.posts.build if member_signed_in? and  current_member.projects.includes(@project)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  def members
    @members = Member.all
    render 'team'
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :sname, :tag, :semester, :year, :description, :picture, :background, member_ids: [])
    end

    def correct_member
      unless (exec_or_higher? or current_member.project_ids.include?(params[:id]))
        flash[:danger] = "Action restricted to EXECs or Project Team Members"
        redirect_to request.referrer
      end
    end
end
