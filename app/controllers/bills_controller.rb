class BillsController < ApplicationController
  before_action :set_bill, only: [:show]

  def show
  end

  def index

  end

  def new
    @flat = Flat.find params[:flat_id]
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(name: params[:bill][:name])
    @bill.user = current_user
    @bill.paying_user = current_user
    @bill.save!
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end
end
