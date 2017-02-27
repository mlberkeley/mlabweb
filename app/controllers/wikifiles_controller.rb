class WikifilesController < ApplicationController
  before_action :logged_in_member, only: [:index, :new, :create, :destroy]
  before_action :exec_member, only: [:new, :create, :destroy]

  def index
    @files = Wikifile.all
  end

  def new
    @file = Wikifile.new
  end

  def create
    @file = Wikifile.new(wikifile_params)
    if @file.save
      flash[:success] = "File successfully uploaded"
      redirect_to wikifiles_path
    else
      render 'new'
    end
  end

  def destroy
    @file = Wikifile.find(params[:id]).destroy
    flash[:success] = "File destroyed"
    redirect_to wikifiles_path
  end

  private

    def wikifile_params
      params.require(:wikifile).permit(:name, :attachment)
    end
end
