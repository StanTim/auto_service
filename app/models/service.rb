class Service < ApplicationRecord
  belongs_to :category
  has_many :order_lists
  has_many :specialists, through: :order_lists
end
