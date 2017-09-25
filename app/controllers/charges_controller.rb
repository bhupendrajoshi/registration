class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    # Amount in cents
    @amount = 500
  end
  
  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    
    Payment.create!(user: current_user, stripe_id: customer.id, amount: @amount)

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
end
