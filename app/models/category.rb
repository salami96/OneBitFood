class Category < ApplicationRecord
  has_many :retaurants

  validates :title, presence: true

  has_one_attached :image
end
