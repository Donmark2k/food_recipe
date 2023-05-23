class Inventory < ApplicationRecord
  belongs_to :user, counter_cache: true

  has_many :inventory_foods, dependent: :destroy
  validates :name, presence: true
end
