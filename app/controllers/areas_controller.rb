class AreasController < ApplicationController
  before_action :set_area, only: [:show, :update, :edit, :destroy]
  before_action :set_tasks, only: [:show]
  skip_before_action :verify_authenticity_token, :only => [:update]

  def index
    @flat = policy_scope(Flat).find(params[:flat_id])
    @areas = Area.all
    @areas = Area.where(flat_id: params[:flat_id])
  end

  def show
    @flat = @area.flat
    authorize @area
    @notification = current_user.notifications.find_by(notifiable_id: params[:id], notifiable_type: "Area")

    if @notification
      @notification.update opened_at: Date.today
    end
  end

  def new
    @flat = policy_scope(Flat).find(params[:flat_id])
    @users = @flat.users
    @user = current_user
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    @flat = policy_scope(Flat).find(params[:flat_id])
    @area.flat_id = @flat.id

    if @area.save
      redirect_to flat_areas_path(@flat)
    else
      render "areas/new"
    end
  end

  def edit
    @flat = @area.flat
    authorize @area
  end

  def update
    flat = policy_scope(Flat).find(params[:flat_id])
    @flat = @area.flat
    @area.update(area_params)
      respond_to do |format|
        format.html
        format.json { render json: { area: @area } }
      end
  end

  def destroy
    @flat = @area.flat
    @area.destroy
    authorize @area
    redirect_to flat_areas_path(@area.flat_id)
  end


  private


  def set_area
    @area = Area.find(params[:id])
  end

  def area_params
    params.require(:area).permit(:name, :category)
  end

  def set_tasks
    @tasks = @area.tasks.all.order("created_at")
  end
end
