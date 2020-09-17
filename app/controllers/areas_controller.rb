class AreasController < ApplicationController
  before_action :set_area, only: [:show, :update, :edit, :destroy]
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
end
