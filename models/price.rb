class Price < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :volume, :price
end
