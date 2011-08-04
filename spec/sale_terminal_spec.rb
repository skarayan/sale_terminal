require 'product'
require 'sale_terminal'

describe SaleTerminal do
  it 'should allow me to scan products' do
    product = Product.new('EEE')
    product.set_price(5)

    terminal = SaleTerminal.new [product]
    terminal.scan(product)
  end

  it 'should return the correct total' do
    product1 = Product.new('FFF')
    product1.set_price(10)
    product2 = Product.new('GGG')
    product2.set_price(15)

    terminal = SaleTerminal.new [product1, product2]
    2.times { terminal.scan(product1) }
    3.times { terminal.scan(product2) }
    terminal.total.should == (10 * 2) + (15 * 3)
  end

  it 'should use the right volume when calculating the total' do
    product = Product.new('HHH')
    product.set_price(1)
    product.set_price(3, 4)

    terminal = SaleTerminal.new [product]
    5.times { terminal.scan(product) }
    terminal.total.should == (3 + 1)
  end

  it 'should raise an error if ordering less than the minimum limit' do
    product = Product.new('III')
    product.set_price(5, 2)

    terminal = SaleTerminal.new [product]
    terminal.scan(product)
    lambda { terminal.total }.should raise_error(MinimumOrderRequired)
  end
end
