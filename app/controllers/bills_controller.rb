class BillsController < ApplicationController
  before_action :set_bill, only: [:show]

  def show
  end

  def index
    @bills = Bill.all
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @bill = Bill.new
  end

  def create

    @bill = Bill.new(bill_params)

    @bill.flat = @flat

    if @bill.save
      redirect_to flat_bills_path(@flat)
    else
      render "bills/show"
    end
  end

  private

  def bill_params
    params.require(:bill).permit(
      :name,
      :amount,
      :due_date,
      :paying_user_id
    )
  end

  def set_bill
    @bill = Bill.find(params[:id])
  end
end
