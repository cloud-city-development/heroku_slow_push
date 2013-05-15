class ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
    respond_with @items
  end

  def show
    @item = Item.find params[:id]
    sleep 0.1
    respond_with @item
  end

  def background
    Pusher["items-channel"].delay( run_at: Proc.new { 0.1.seconds.from_now } ).trigger( "items-event", Item.find( params[:id] ).to_json )
    render json: {}
  end
end
