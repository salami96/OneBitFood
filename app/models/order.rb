class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :order_products
  
  validates :name, :phone_number, :total_value, :city, :neighborhood, :street, :number, presence: true
  
  enum status: { waiting: 0, delivered: 1 }

  accepts_nested_attributes_for :order_products, allow_destroy: true
  
  before_vallidation :set_price

  private

  def set_price
    final_price = 0
    order_products.each { |op| final_price += op.quantity * op.product.price }
    self.total_value = final_price + self.restaurant.delivery_tax
  end
end
