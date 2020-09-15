class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :set_flatmembers]

  def show
    @flat_flatmembers =  @flat.flatmembers
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
