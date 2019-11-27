# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :load_cart_instance

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
