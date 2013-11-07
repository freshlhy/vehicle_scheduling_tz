class DriverStat < ActiveRecord::Base
  attr_accessible :accident_count, :driver_age, :driver_id, :trip_count

  belongs_to :driver
  
end
