class ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
    respond_with @items
  end

  def show
    @item = Item.find params[:id]
    respond_with @item
  end

  def background
    Pusher["items-channel"].trigger("items-event", Item.find( params[:id] ).to_json)
    render json: {}
  end
end
