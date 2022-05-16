class ShipmentItem < ApplicationRecord
  belongs_to :item
  belongs_to :shipment

  validates_presence_of :quantity
end
