class Payment < ActiveRecord::Base
  before_create :assign_public_token
  after_create  :send_receipt

  attr_accessor :credit_card
  attr_accessor :credit_card_token

  belongs_to :subscription
  belongs_to :site_user

  def self.public_fetch(payment_id, params)
    find_by_id_and_public_token! payment_id , params[:public_token]
  end

  def send_receipt
    #Jackpot::Notifier.send_receipt(self).deliver
  end 

  def assign_public_token
    # Sets a public token so it can be accessed without being signed in
    self.public_token  ||= SecureRandom.hex(16)
  end 

  def customer_email
    customer.email  if customer.present?
  end 

  #def amount
  #  amount_in_cents / 100 if amount_in_cents.present?
  #end 

  def amount_in_cents
    read_attribute(:amount) 
  end 
end

