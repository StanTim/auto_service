class OrderList < ApplicationRecord
  belongs_to :order
  belongs_to :category
  belongs_to :specialist
end
