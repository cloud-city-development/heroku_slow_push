class ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
    respond_with @items
  end

  def background
    Item.delay.background_response
    render json: {}
  end
end
