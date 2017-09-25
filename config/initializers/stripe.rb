Rails.configuration.stripe = {
  :publishable_key => Figaro.env.PUBLISHABLE_KEY,
  :secret_key      => Figaro.env.SECRET_KEY
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]