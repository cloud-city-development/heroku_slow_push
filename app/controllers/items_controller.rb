class ItemsController < ApplicationController
  respond_to :json

  def background
    # event name is received from the browser and passed to the query
    # method so it can be triggered when background job finishes
    Item.delay.slow_query("heroku_slow_push", params[:event])
    render json: {}
  end
end
