class PostsController < ApplicationController
  before_action :authenticate_member!
  before_action :correct_member, only: :destroy

  def create
    @post = current_member.posts.build(post_params)
    if @post.save
      redirect_to current_member, notice: 'Post was created'
    else
      redirect_to current_member, notice: 'Your post needs content and location'
    end
  end

  def destroy
    @post.destroy
    redirect_to current_member, notice: 'Post deleted'
  end

  private

    def post_params
      params.require(:post).permit(:content, :video, :photo, :project)
    end

    def correct_member
      @post = current_member.posts.find_by(id: params[:id])
      redirect_to current_member if @post.nil?
    end
end
