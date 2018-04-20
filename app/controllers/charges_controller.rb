class ChargesController < ApplicationController
  before_action :set_item

  def create
    @amount = @movie.price
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@amount * 100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'AUD'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
  def set_item
  @movie = Movie.find(params[:movie_id])
  end
end
