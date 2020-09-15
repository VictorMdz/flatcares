class BillsController < ApplicationController

  def index
    @bills = Bill.all
  end

end
