class Order < ApplicationRecord
  has_many :specialists, through: :order_lists
  has_many :services, through: :order_lists
  has_many :order_lists, dependent: :destroy
  accepts_nested_attributes_for :order_lists, allow_destroy: true


  validates :client_name, presence: true,
            length: { maximum: 50 }

  validates :phone, presence: true,
            :numericality => true,
            :length => { :minimum => 6, :maximum => 15 }
end
