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

  private

    def item_params
      params.permit(:name, :price)
    end
end