class SpecialsController < ApplicationController
  before_action :logged_in_member, only: [:new, :create, :edit, :update, :destroy]
  before_action :exec_member, only: [:create, :update]
  before_action :admin_member, only: [:new, :destroy]

  def new
    @special = Special.new
  end

  def create
    @special = Special.new(special_params)
    if @special.save
      flash[:success] = "Success dawg."
      redirect_to about_path
    else
      render 'new'
    end
  end

  def edit
    @special = Special.find(params[:id])
  end

  def update
    @special = Special.find(params[:id])
    if @special.update_attributes(special_params)
      flash[:success] = "Updated special content"
      redirect_to about_path
    else
      render 'edit'
    end
  end

  def destroy
    Special.find(params[:id]).destroy
    flash[:success] = "Destroyed"
    redirect_to about_path
  end

  private

    def special_params
      params.require(:special).permit(:title, :tag, :content)
    end
end
