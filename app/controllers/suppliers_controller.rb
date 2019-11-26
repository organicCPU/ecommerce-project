# frozen_string_literal: true

class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
    load_cart_instance
  end
end
