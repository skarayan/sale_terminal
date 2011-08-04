class ProductAlreadyCreated < Exception; end
class MinimumVolumeNotMet < Exception; end

class Product
  attr_reader :product_code

  def self.all
    ObjectSpace.each_object(Product)
  end

  def self.find_by_product_code(product_code)
    self.all.each { |product| return product if product.product_code == product_code }
    nil
  end

  def initialize(product_code)
    raise ProductAlreadyCreated if Product.find_by_product_code(product_code)
    @product_code = product_code
    @prices = {}
  end

  def price=(price_or_hash)
    if price_or_hash.class == Hash
      volume, price = price_or_hash[:volume], price_or_hash[:price]
    else
      volume, price = 1, price_or_hash
    end
    @prices[volume] = price
  end

  def get_price_and_volume_for_largest_price_set(count)
    volumes = @prices.keys.sort.reverse
    volumes.each { |volume| return [@prices[volume], volume] if count >= volume }
    raise MinimumVolumeNotMet
  end
end

