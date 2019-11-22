# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :category

  has_one_attached :image
end
