# frozen_string_literal: true

class SuppliersController < ApplicationController
  before_action :load_cart_instance

  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end
end
