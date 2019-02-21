# frozen_string_literal: true

class Order < ApplicationRecord
  validates :name, :purchased_by, :product_price, presence: true
end
