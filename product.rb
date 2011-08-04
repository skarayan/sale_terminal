class ProductAlreadyCreated < Exception
end

class Product
  attr_reader :product_code, :prices

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

  def set_price(price, volume=1)
    @prices[volume] = price
  end
end

