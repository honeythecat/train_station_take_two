require('rspec')
require('stations')
require('lines')
require('pg')
require('pry')

DB = PG.connect({:dbname => "train_station_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines *;")
  end
end