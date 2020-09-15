class BillsController < ApplicationController
  before_action :set_bill, only: [:show]

  def show
  end

  def index
    @bills = Bill.all
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end





end
