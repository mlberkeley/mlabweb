class BlogpostsController < ApplicationController
  before_action :logged_in_member, only: [:create, :destroy]

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
    @blogpost.published = true if (params[:blogpost][:published] == '1')
    debugger
    if @blogpost.save
      flash[:success] = "Blogpost created!"
      redirect_to current_member
    else
      render 'new'
    end
  end

  def destroy
  end

  private

    def blogpost_params
      params.require(:blogpost).permit(:title, :content)
    end
end
