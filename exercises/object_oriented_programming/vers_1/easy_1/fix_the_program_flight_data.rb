#!/usr/bin/env ruby -wKU
# fix_the_program_flight_data.rb

class Flight
  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end