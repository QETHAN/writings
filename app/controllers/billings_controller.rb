class BillingsController < ApplicationController
  before_filter :require_logined
  layout 'dashboard'

  def show
    @invoices = current_user.invoices.desc(:created_at)
  end
end