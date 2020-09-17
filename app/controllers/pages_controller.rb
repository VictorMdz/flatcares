class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @resource = User.new()
    @resource_name = :user

    if current_user && !current_user.flats.empty?
      redirect_to flat_path current_user.flats.first
    end
  end
end
