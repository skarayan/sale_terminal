require 'rubygems'
require 'activerecord'

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :dbfile  => ":memory:")
ActiveRecord::Migrator.migrate('db/migrate')

require 'models/price'
require 'models/product'
require 'models/sale_terminal'

