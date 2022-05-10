class ItemsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
  end
end