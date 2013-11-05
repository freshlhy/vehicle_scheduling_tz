class Supervise < ActiveRecord::Base
  attr_accessible :car_id, :current_life, :current_mileage, :is_active, :life_status, :mileage_status, :part_id, :start
end
