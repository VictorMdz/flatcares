class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :set_flatmembers]

  def show
    @flat_flatmembers =  @flat.flatmembers
    @flat_areas = @flat.areas
    @notifications = current_user.notifications
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

  end

  def invite_users
    user_emails = params[:emails].split ","

    user_emails.each do |email|
      user = User.find_by email: email

      if user
        # logic to add an existing user to the flat and send an email
      else
        user = User.invite!({ email: email }, current_user)
        user.flats.push current_user.living_in
      end
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name)
  end
end
