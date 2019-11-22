# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session

  def index
    @products = Product.order(:name).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    product_id = parse_id

    session[:cart] << product_id unless session[:cart].include?(product_id)

    redirect_to root_path
  end

  def remove_from_cart
    product_id = parse_id
    session[:cart].delete(product_id)

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
    @cart = Product.find(session[:cart])
  end
end
