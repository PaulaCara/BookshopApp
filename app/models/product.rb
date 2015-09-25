class Product < ActiveRecord::Base
  belongs_to :category
  has_one :image, validate: true

  validates :title, presence: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than: 0.0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :category_id, presence: true

  scope :available, ->(available) { where((available == "soon") ? "stock = 0" : "stock > 0") }
end
