# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session

  def index
    @products = Product.order(:name).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def cart; end

  def add_to_cart
    product_id = parse_id

    unless session[:cart].any? { |hash| hash['id'] == product_id }
      session[:cart] << { id: product_id, quantity: 1 }
    end

    redirect_to root_path
  end

  def remove_from_cart
    product_id = parse_id
    session[:cart].delete_if { |hash| hash['id'] == product_id }

    redirect_to root_path
  end

  private

  def parse_id
    params[:id].to_i
  end

  def initialize_session
    session[:cart] ||= []
    load_cart
  end

  def load_cart
    @cart = Product.find(session[:cart].collect { |product| product['id'] })
    @total = 0
    @cart.each_with_index do |product, i|
      @total += product.price * session[:cart][i]['quantity']
    end
  end

  helper_method :load_cart
end
