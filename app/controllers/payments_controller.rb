class PaymentsController < ApplicationController
  before_action :set_payment, only: [:update]

  def update
    if @payment.update(payment_params)
      redirect_to flat_bill_path(@payment.bill.flat, @payment.bill, anchor: "payment-#{@payment.id}")
    else
      render flat_bill_path
    end
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:paid)
  end
end
