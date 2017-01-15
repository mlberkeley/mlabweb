class BlogpostsController < ApplicationController
  before_action :logged_in_member, only: [:create, :destroy]
  before_action :correct_member, only: :destroy

  def show
    @blogpost = Blogpost.find(params[:id])
    @blogpost.update_attribute(:views, @blogpost.views.next)
  end

  def new
    if logged_in?
      @blogpost = current_member.blogposts.build
    else
      flash[:warning] = "You must be logged in to write a post"
      redirect_to login_path
    end
  end

  def create
    @blogpost = current_member.blogposts.build(blogpost_params)
    if @blogpost.save
      flash[:success] = "Blogpost created!"
      redirect_to current_member
    else
      render 'new'
    end
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(blogpost_params)
      flash[:success] = "Blogpost updated"
      redirect_to current_member
    else
      render 'edit'
    end
  end

  def destroy
    @blogpost.destroy
    flash[:success] = "Blogpost deleted"
    redirect_to request.referrer || updates_path
  end

  private

    def blogpost_params
      params.require(:blogpost).permit(:title, :content, :published, :picture)
    end

    def correct_member
      @blogpost = current_member.blogposts.find_by(id: params[:id])
      redirect_to updates_path if @blogpost.nil?
    end
end
