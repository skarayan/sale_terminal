require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')
ActiveRecord::Migrator.migrate('db/migrate')

require 'models/price'
require 'models/product'
require 'models/sale_terminal'

