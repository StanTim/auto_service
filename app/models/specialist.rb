class Specialist < ApplicationRecord
  has_many :orders, through: :order_lists
  has_many :services, through: :order_lists
  has_many :order_lists

  validates :name, presence: true, length: { maximum: 50 }
end
