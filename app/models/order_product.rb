class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true

  enum status: { waiting: 0, delivered: 1 }
end
