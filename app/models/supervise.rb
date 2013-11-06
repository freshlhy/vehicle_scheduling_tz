class Supervise < ActiveRecord::Base
  attr_accessible :car_id, :current_life, :current_mileage, :is_active, :life_status, :mileage_status, :part_id, :start,:mileage_status_value, :life_status_value

  validates_numericality_of :current_life, :allow_nil => true, :message => "已用时长需为数字"
  validates_numericality_of :current_mileage, :allow_nil => true, :message => "当前里程需为数字"

  belongs_to :part
  belongs_to :car

end
