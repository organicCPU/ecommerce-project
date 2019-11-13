class Order < ApplicationRecord
  belongs_to :region
  belongs_to :user
end
