class ShipmentsController < ApplicationController
  def new
    @store = Store.find(params[:store_id])
  end

  def create
    require 'pry'; binding.pry
    params[:add_items].each do |item|
      ShipmentItem.create!(item_id: item.id, shipment_id: params)
  end
end