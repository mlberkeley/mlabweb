class WikifilesController < ApplicationController
  before_action :authenticate_member!, only: [:index, :new, :create, :destroy]
  before_action :exec_member, only: [:new, :create, :destroy]

  # GET /wikifiles
  # GET /wikifiles.json
  def index
    @wikifiles = Wikifile.all
  end

  # GET /wikifiles/new
  def new
    @wikifile = Wikifile.new
  end

  # POST /wikifiles
  # POST /wikifiles.json
  def create
    @wikifile = Wikifile.new(wikifile_params)

    respond_to do |format|
      if @wikifile.save
        format.html { redirect_to wikifiles_path, notice: 'Wikifile was successfully created.' }
        format.json { render :show, status: :created, location: @wikifile }
      else
        format.html { render :new }
        format.json { render json: @wikifile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikifiles/1
  # DELETE /wikifiles/1.json
  def destroy
    @wikifile = Wikifile.find(params[:id])
    @wikifile.destroy
    respond_to do |format|
      format.html { redirect_to wikifiles_path, notice: 'Wikifile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def wikifile_params
      params.require(:wikifile).permit(:name, :attachment)
    end
end
