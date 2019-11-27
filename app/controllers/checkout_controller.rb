# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    load_cart_instance

    if @cart.nil?
      redirect_to cart_path
      return
    end

    # Build line items

    line_items = []
    @cart.each_with_index do |product, i|
      line_items << {
        name: product.name,
        description: nil,
        amount: (product.price * 100).to_i,
        currency: 'cad',
        quantity: session[:cart][i]['quantity']
      }
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js # render create.js.erb
    end
  end

  def success; end

  def cancel; end
end
