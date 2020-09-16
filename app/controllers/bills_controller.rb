class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :update]

  def index
    @bills = Bill.all
  end

  def show
    @flat = Flat.find(params[:flat_id])

  end

  def new
    @flat = Flat.find(params[:flat_id])
    @users = @flat.users
    @user = current_user
    @bill = Bill.new
    @payment = Payment.new
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.user_id = current_user.id

    @flat = Flat.find(params[:flat_id])
    @bill.flat_id = @flat.id

    @bill.save

    @bill.flat.users.each do |user|
      if user.id == @bill.paying_user_id
        Payment.create(user_id: user.id, bill_id: @bill.id, amount: amount_by_user, status: true)
      else
        Payment.create(user_id: user.id, bill_id: @bill.id, amount: amount_by_user)
      end
    end

    if @bill.save
      redirect_to flat_bill_path(@flat, @bill)
    else
      render "bills/show"
    end
  end

  def update
    @flat = Flat.find(params[:flat_id])
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

  def amount_by_user
    @bill.amount / @flat.users.count
  end
end
