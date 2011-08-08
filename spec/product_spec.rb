require 'app'

describe Product do
  it 'should return all objects' do
    5.times { |i| Product.create(:product_code => i) }
    Product.all.count.should == 5
  end

  it 'should find by product_code' do
    product = Product.create(:product_code => 'AAA')
    Product.find_by_product_code('AAA').should == product
  end

  it 'should raise an error if creating a product with the same product code' do
    Product.create(:product_code => 'BBB')
    lambda { Product.create!(:product_code => 'BBB') }.should raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should allow me to set the price' do
    product = Product.create(:product_code => 'CCC')
    product.price = 5
  end

  it 'should allow me to set the price and volume' do
    product = Product.create(:product_code => 'DDD')
    product.price = { :price => 5, :volume => 3 }
  end
end
