class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @resource = User.new()
    @resource_name = :user
  end
end
