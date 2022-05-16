class Shipment < ApplicationRecord
  has_many :shipment_items
  has_many :items, through: :shipment_items

  validates_presence_of :origin
  validates_presence_of :destination
end
