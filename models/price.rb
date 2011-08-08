class Price < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :volume, :price

  scope :all_by_product_id, lambda { |id|    where(['prices.product_id = ?', id]) }
  scope :largest_volume,    lambda { |count| where(['? >= prices.volume', count]).order('prices.volume desc').limit(1) }
end
