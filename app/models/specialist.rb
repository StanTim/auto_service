class Specialist < ApplicationRecord
  has_many :services, through: :order_lists

  validates :name, presence: true, length: { maximum: 50 }
end
