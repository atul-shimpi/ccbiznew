class BusinessUser::PaymentsController < ApplicationController
  before_filter :authenticate_business_user!
  

  def index
    @payments = Payment.all
  end 

end

