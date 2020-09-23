class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :set_flatmembers, :destroy]

  def show
    @flat_flatmembers =  @flat.flatmembers
    @flat_areas = @flat.areas
    @notifications = current_user.notifications
    @notifications = @notifications.sort_by(&:updated_at)
    @notifications.reverse!
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
    redirect_to flats_path
  end

  private

  def set_flat
      @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :full_address)
  end
end
