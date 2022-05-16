class ItemsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
  end
  
  def new
    @store = Store.find(params[:store_id])
  end
  
  def create
    @store = Store.find(params[:store_id])
    @store.items.create!(item_params)
    redirect_to "/stores/#{@store.id}/items"
  end
  
  def edit
    @store = Store.find(params[:store_id])
    @item = Item.find(params[:id])
  end
  
  def update
    @store = Store.find(params[:store_id])
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.save
    redirect_to "/stores/#{@store.id}/items"
  end
  
  def destroy
    @store = Store.find(params[:store_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to "/stores/#{@store.id}/items"
  end
  
  private

    def item_params
      params.permit(:name, :price, :quantity)
    end
end