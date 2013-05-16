class Item < ActiveRecord::Base
  attr_accessible :description, :name, :position

  def self.slow_query
    sleep(0.1) # imaginary processing
    self.order("RANDOM()").first
  end
end
