class MinimumOrderRequired < Exception
end

class SaleTerminal
  def initialize(products)
    @products = products
    @scanned_products = []
  end

  def scan(product)
    @scanned_products.push product
  end

  def total
    order.inject(0) do |total,product_arr|
      product, count = product_arr
      while count > 0
        price, volume = get_price_and_volume_for_largest_price_set product, count
        total += price
        count -= volume
      end
      total
    end
  end

  private

  def order
    @scanned_products.inject({}) do |order,product|
      order[product] = 0 if order[product].nil?
      order[product] += 1
      order
    end
  end

  def get_price_and_volume_for_largest_price_set(product, count)
    volumes = product.prices.keys.sort.reverse
    volumes.each { |volume| return [product.prices[volume], volume] if count >= volume }
    raise MinimumOrderRequired
  end
end

