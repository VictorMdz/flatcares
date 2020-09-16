class ComponentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def index
    @user = User.all
  end
end
