class ItemsController < ApplicationController
  respond_to :json

  def background
    Pusher[params[:channel]].delay.trigger( "item-event", Item.slow_query.to_json  )
    render json: {}
  end
end
