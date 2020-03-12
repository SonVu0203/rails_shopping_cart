class Product < ApplicationRecord
  belongs_to :shop
  has_many :images, as: :imageable, dependent: :destroy

  default_scope -> { order(id: :asc) }

  validates :shop_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :price , presence: true
end
