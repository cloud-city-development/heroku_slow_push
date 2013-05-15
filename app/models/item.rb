class Item < ActiveRecord::Base
  attr_accessible :description, :name, :position

  def self.background_response
    Pusher["items-channel"].trigger("items-event", self.all.to_json)
  end
end
