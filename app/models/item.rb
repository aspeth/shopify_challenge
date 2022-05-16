class Item < ApplicationRecord
  belongs_to :store

  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :quantity
end
