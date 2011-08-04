require 'product'
require 'sale_terminal'

Given /^that the prices of products are set by the store$/ do
  @product1 = Product.new('A')
  @product1.price = 2
  @product1.price = { :price => 7, :volume => 4 }
  @product2 = Product.new('B')
  @product2.price = 12
  @product3 = Product.new('C')
  @product3.price = 1.25
  @product3.price = { :price => 6, :volume => 6 }
  @product4 = Product.new('D')
  @product4.price = 0.15
end

When /^I scan the products with product codes "([^"]*)"$/ do |product_codes|
  @terminal = SaleTerminal.new [@product1, @product2, @product3, @product4]
  product_codes.split('').each do |product_code|
    product = Product.find_by_product_code(product_code)
    @terminal.scan product
  end
end

Then /^I should get a total of "([^"]*)"$/ do |total_price|
  @terminal.total.should == total_price.to_f
end
