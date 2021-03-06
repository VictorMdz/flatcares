class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :update, :set_flatmembers, :destroy]
  skip_before_action :verify_authenticity_token, only: [:update]

  def show
    @flat_flatmembers =  @flat.flatmembers
    @flat_areas = @flat.areas

    user = current_user
    authorize @flat

    @notifications = current_user.notifications.limit(15).order(created_at: :desc)
  end

  def new
    @flat = Flat.new
    @user = current_user
  end

  def create
    @flat = Flat.create(flat_params)
    @member = Flatmember.create(user: current_user, flat: @flat, is_admin: true)

    if @flat.save && @member.save
      redirect_to flat_path(current_user.flats.last)
    else
      render "flats/new"
    end
  end

  def destroy
    @flat.destroy
    authorize @flat

    redirect_to flats_path
  end


  def update
    @flat.update(flat_params)
      respond_to do |format|
        format.html
        format.json { render json: { flat: @flat } }
      end
    authorize @flat
  end

  private

  def set_flat
      @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :full_address)
  end
end
