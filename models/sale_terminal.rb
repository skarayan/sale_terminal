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
        price = product.price_by_largest_volume count
        total += price.price
        count -= price.volume
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
end

