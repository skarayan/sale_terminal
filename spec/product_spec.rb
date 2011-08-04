require 'product'

describe Product do
  it 'should return all objects' do
    5.times { |i| Product.new(i) }
    Product.all.count.should == 5
  end

  it 'should find by product_code' do
    product = Product.new('AAA')
    Product.find_by_product_code('AAA').should == product
  end

  it 'should raise an error if creating a product with the same product code' do
    Product.new('BBB')
    lambda { Product.new('BBB') }.should raise_error(ProductAlreadyCreated)
  end

  it 'should allow me to set the price' do
    product = Product.new('CCC')
    product.set_price(5)
  end

  it 'should allow me to set the price and volume' do
    product = Product.new('DDD')
    product.set_price(5, 3)
  end
end
