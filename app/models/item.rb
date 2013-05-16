class Item < ActiveRecord::Base
  attr_accessible :description, :name, :position

  def self.slow_query(channel, event)
    sleep(1) # imaginary processing
    items = self.order("RANDOM()").first
    Pusher[channel].trigger(event, items.to_json)
  end
end
