class AreasController < ApplicationController
  before_action :set_area, only: [:show, :update, :edit, :destroy]
  before_action :set_tasks, only: [:show]

  def index
    @flat = Flat.find(params[:flat_id])
    @areas = Area.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end

  def set_tasks
    @tasks = @area.tasks.all.order("created_at")
  end
end
