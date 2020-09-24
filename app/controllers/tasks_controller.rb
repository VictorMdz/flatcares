class TasksController < ApplicationController
  before_action :set_task, only: [:update]

  def new
    @area = Area.find(params[:area_id])
    @flat = @area.flat
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @area = Area.find(params[:area_id])
    @flat = @area.flat
    @task.area_id = @area.id


    if @task.save
      redirect_to area_path(@area)
    else
      render "tasks/new"
    end
  end

  def edit
    @area = Area.find(params[:area_id])
    @flat = @area.flat
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to area_path(@task.area_id, anchor: "task-#{@task.id}")
    else
      render area_path(@task.area_id)
    end
  end

  def destroy
    @area = Area.find(params[:area_id])
    @flat = @area.flat
    @task = Task.find(params[:id])

    @task.destroy

    redirect_to area_path(@area)
  end

  private

  def task_params
    params.require(:task).permit(:completed, :name)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
