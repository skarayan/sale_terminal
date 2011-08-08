class MinimumVolumeNotMet < Exception; end

class Product < ActiveRecord::Base
  has_many :prices
  validates_presence_of :product_code
  validates_uniqueness_of :product_code

  def hash_prices
    prices.inject({}) do |hash,price|
      hash[price.volume] = price.price
      hash
    end
  end

  def price=(price_or_hash)
    if price_or_hash.class == Hash
      volume, price = price_or_hash[:volume], price_or_hash[:price]
    else
      volume, price = 1, price_or_hash
    end
    # hash_prices[volume] = price
    prices << Price.create(:volume => volume, :price => price)
  end

  def get_price_and_volume_for_largest_price_set(count)
    volumes = hash_prices.keys.sort.reverse
    volumes.each { |volume| return [hash_prices[volume], volume] if count >= volume }
    raise MinimumVolumeNotMet
  end
end

