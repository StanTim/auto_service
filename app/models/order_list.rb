class OrderList < ApplicationRecord
  belongs_to :service
  belongs_to :specialist
  belongs_to :order
end
