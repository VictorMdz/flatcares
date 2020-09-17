class TasksController < ApplicationController
  def new
    @area = Area.find(params[:area_id])
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    @area = Area.find(params[:area_id])
    @task.area_id = @area.id

    if @task.save
      redirect_to area_path(@area)
    else
      render "tasks/new"
    end
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
