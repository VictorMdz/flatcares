class AreasController < ApplicationController
before_action :set_area, only: [:show]
before_action :set_tasks, only: [:show]

  def index
    @areas = Area.all
  end

  def show

  end

  private

  def set_area
    @area = Area.find(params[:id])
  end

  def set_tasks
    @tasks = @area.tasks.all.order("created_at")
  end
end
