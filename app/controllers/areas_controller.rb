class AreasController < ApplicationController
  before_action :set_area, only: [:show, :update, :edit, :destroy]
  before_action :set_tasks, only: [:show]

  def index
    @areas = Area.all
  end

  def show

  end

  def new
    @area = Area.find(params[:area_id])
    @task = Task.new
  end

  def create
    @task = Task.new
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end

  def set_tasks
    @tasks = @area.tasks.all.order("created_at")
  end
end
