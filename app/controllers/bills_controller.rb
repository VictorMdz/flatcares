class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :update, :edit, :destroy]
  before_action :set_bills, only: :index
  before_action :check_display_index, only: :index

  def index
    @flat = Flat.find(params[:flat_id])
    @bills = Bill.where(flat_id: params[:flat_id])

    if params[:category].present? && params[:category] != ""
      @bills = @bills.by_category(params[:category])
    end

    if params[:amount_cents] != "" && params[:amount_cents].present?
      raise
      @bills = @bills.by_amount(@amounts[params[:amount_cents].to_sym].to_a)
    end

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

    if @bill.save
      redirect_to flat_bill_path(@flat, @bill)
    else
      render "bills/new"
    end
  end

  def edit
    @flat = Flat.find(params[:flat_id])
  end

  def update
    @flat = Flat.find(params[:flat_id])
    if @bill.update(bill_params)
      redirect_to flat_bill_path
    else
      render "bills/new"
    end
  end

  def destroy
    @flat = Flat.find(params[:flat_id])
    @bill.destroy
    redirect_to flat_bills_path
  end

  private

  def bill_params
    params.require(:bill).permit(
      :name,
      :amount,
      :due_date,
      :paying_user_id,
      :invoice,
      :category
    )
  end

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def set_bills
    @bills = Bill.all

    @categories = @bills.map { |bill| bill.category }
    @categories.uniq!

    @amounts = {
      "€0 - €50": 0..5000,
      "€50 - €100": 5000..10000,
      "€100 - €150": 10000..15000,
      "€150 - €200": 15000..20000,
      "€200 - €250": 20000..25000,
      "€250 +": 25000..50000000
    }
  end

  def check_display_index
    @your_index = !params[:user_id].present?
  end
end
