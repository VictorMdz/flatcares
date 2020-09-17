class TasksController < ApplicationController
  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to area_path(@task.area_id)
    else
      render area_path(@task.area_id)
    end
  end

  private

  def task_params
    params.require(:task).permit(:completed)
  end
end
