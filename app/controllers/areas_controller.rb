class AreasController < ApplicationController
  before_action :set_area, only: [:show, :update, :edit, :destroy]
  before_action :set_tasks, only: [:show]

  def index
    @flat = Flat.find(params[:flat_id])
    @areas = Area.all
    @areas = Area.where(flat_id: params[:flat_id])
  end

  def show
    @flat = @area.flat
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @users = @flat.users
    @user = current_user
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    @flat = Flat.find(params[:flat_id])
    @area.flat_id = @flat.id

    if @area.save
      redirect_to flat_areas_path(@flat)
    else
      render "areas/index"
    end
  end

  def edit
    @flat = @area.flat
  end

  def update
    @flat = @area.flat
    if @area.update(area_params)
      redirect_to area_path(@area)
    else
      render area_path(@area)
    end
  end

  def destroy
    @flat = @area.flat
    @area.destroy
    redirect_to flat_areas_path(@area.flat_id)
  end


  private

  def set_area
    @area = Area.find(params[:id])
  end

  def area_params
    params.require(:area).permit(:name, :description)
  end

  def set_tasks
    @tasks = @area.tasks.all.order("created_at")
  end
end
