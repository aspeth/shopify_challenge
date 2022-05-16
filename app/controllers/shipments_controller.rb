class ShipmentsController < ApplicationController
  def new
    @store = Store.find(params[:store_id])
  end
  
  def create
    @store = Store.find(params[:store_id])
    shipment = Shipment.create!(shipment_params)
    items = Array.new

    params[:add_items].each do |item_id|
      items << Item.find(item_id)
    end

    items.each do |item|
      ShipmentItem.create!(item_id: item.id, shipment_id: shipment.id, quantity: item.quantity)
      item.update(quantity: 0)
      item.save
    end
    
    redirect_to "/stores/#{@store.id}/items"
  end

  private

  def shipment_params
    params.permit(:origin, :destination)
  end
end