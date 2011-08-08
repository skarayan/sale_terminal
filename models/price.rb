class Price < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :volume, :price

  scope :get_highest_volume, lambda { |id,count| where(['product_id = ?', id]).where(['? >= prices.volume', count]).order('prices.volume desc').limit(1) }
end
