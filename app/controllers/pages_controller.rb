class PagesController < ApplicationController
  def home
    @needs_payment = false
    if user_signed_in?
      @needs_payment = !has_user_paid(current_user)
    end
  end

  private
  def has_user_paid(user)
    user_payment = Payment.where(user: user.id).order(created_at: :desc).limit(1).first
    if !user_payment.nil?
      return !user_payment.error? || !user_payment.declined?
    end
    return false
  end
end
