class BillsController < ApplicationController
  before_action :set_bill, only: [:show]

  def show
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

end
