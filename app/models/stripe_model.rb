class StripeModel
  include Mongoid::Document

  def self.chargeCreditCard(token, email, quantity, amount)
		customer = Stripe::Customer.create(
      :email => email,
      :card  => token
    )

 		#charge user's credit card
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => quantity + ' lesson package',
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      puts "in rescue************"
      puts e.message
      # flash[:error] = e.message
      # redirect_to purchase_path
	end
end