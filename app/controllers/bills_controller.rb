class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :update, :edit, :destroy]
  before_action :set_bills, only: :index
  before_action :check_display_index, only: :index

  def index
    @flat = policy_scope(Flat).find(params[:flat_id])

    @bills = Bill.where(flat_id: params[:flat_id])


    if params[:category].present? && params[:category] != ""
      @bills = @bills.by_category(params[:category])
    end

    if params[:amount_cents].present? && params[:amount_cents] != ""
      @bills = @bills.by_amount(@amounts[params[:amount_cents].to_sym].to_a)
    end

    if (params[:pending].present? && params[:pending] == "true") && (params[:overdue].present? && params[:overdue] == "true")
      @bills = @bills.by_pending + @bills.by_overdue
    elsif params[:pending].present? && params[:pending] == "true"
      @bills = @bills.by_pending
    elsif params[:overdue].present? && params[:overdue] == "true"
      @bills = @bills.by_overdue
    end

    respond_to do |format|
      format.html
      format.json {
        render json: {
          bills: json_with_html(@bills)
        }
      }
    end

  end

  def show
    authorize @bill
    @notification = current_user.notifications.find_by(notifiable_id: params[:id], notifiable_type: "Bill")

    if @notification
      @notification.update opened_at: Date.today
    end

    @flat = Flat.find(params[:flat_id])
    @chatroom = @flat.chatrooms.first
  end

  def new
    @flat = policy_scope(Flat).find(params[:flat_id])
    @users = @flat.users
    @user = current_user
    @bill = Bill.new
    @payment = Payment.new
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.user_id = current_user.id

    @flat = policy_scope(Flat).find(params[:flat_id])
    @bill.flat_id = @flat.id

    if @bill.save
      redirect_to flat_bill_path(@flat, @bill)
    else
      render "bills/new"
    end
  end

  def edit
    @flat = Flat.find(params[:flat_id])
    authorize @bill
  end

  def update
    @flat = policy_scope(Flat).find(params[:flat_id])
    if @bill.update(bill_params)
      redirect_to flat_bill_path
    else
      render "bills/new"
    end
  end

  def destroy
    @flat = Flat.find(params[:flat_id])
    @bill.destroy
    authorize @bill
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
      :category,
      :sharing_member, sharing_member: []
    )
  end

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def set_bills
    @bills = Bill.all

    @categories = @bills.map { |bill| bill.category }
    @categories.uniq!

    @dates = @bills.map { |bill| bill.due_date }
    @dates.uniq!

    @amounts = {
      "€0 - €50": [0, 50],
      "€50 - €100": [50, 100],
      "€100 - €150": [100, 150],
      "€150 - €200": [150, 200],
      "€200 - €250": [200, 250],
      "€250 +": [250, 50000000]
    }
  end

  def check_display_index
    @your_index = !params[:user_id].present?
  end

  def json_with_html(bills)
    bills.map do |bill|
      bill_hash = bill.as_json

      bill_hash.merge({
        html: render_to_string(partial: "bills/bill_card", locals: { bill: bill }, formats: :html)
      })
    end
  end
end
