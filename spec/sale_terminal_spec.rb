require 'product'
require 'sale_terminal'

describe SaleTerminal do
  it 'should allow me to scan products' do
    product = Product.new('EEE')
    product.price = 5

    terminal = SaleTerminal.new [product]
    terminal.scan(product)
  end

  it 'should return the correct total' do
    product1 = Product.new('FFF')
    product1.price = 10
    product2 = Product.new('GGG')
    product2.price = 15

    terminal = SaleTerminal.new [product1, product2]
    2.times { terminal.scan(product1) }
    3.times { terminal.scan(product2) }
    terminal.total.should == (10 * 2) + (15 * 3)
  end

  it 'should use the right volume when calculating the total' do
    product = Product.new('HHH')
    product.price = 1
    product.price = { :price => 3, :volume => 4 }

    terminal = SaleTerminal.new [product]
    5.times { terminal.scan(product) }
    terminal.total.should == (3 + 1)
  end

  it 'should raise an error if ordering less than the minimum limit' do
    product = Product.new('III')
    product.price = { :price => 5, :volume => 2 }

    terminal = SaleTerminal.new [product]
    terminal.scan(product)
    lambda { terminal.total }.should raise_error(MinimumVolumeNotMet)
  end
end
