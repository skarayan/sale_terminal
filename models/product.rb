class MinimumVolumeNotMet < Exception; end

class Product < ActiveRecord::Base
  has_many :prices
  validates_presence_of :product_code
  validates_uniqueness_of :product_code

  def price=(price_or_hash)
    if price_or_hash.class == Hash
      volume, price = price_or_hash[:volume], price_or_hash[:price]
    else
      volume, price = 1, price_or_hash
    end
    prices << Price.create(:volume => volume, :price => price)
  end

  def price_by_largest_volume(volume)
    p = Price.all_by_product_id(id).largest_volume(volume)
    return p.first if p.first
    raise MinimumVolumeNotMet
  end
end

