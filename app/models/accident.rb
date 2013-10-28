class Accident < ActiveRecord::Base
  attr_accessible :a_date, :car_id, :casualties, :damage, :driver_id, :location, :responsible

  validates :driver_id, :presence => {:message => '驾驶员不能为空'}, Length: { maximum: 50 }
  validates :car_id, :presence => {:message => '驾驶车辆不能为空'}, Length: { maximum: 50 }
  validates :location, :presence => {:message => '肇事地点不能为空'}, Length: { maximum: 150 }
  validates :a_date, :presence => {:message => '肇事时间不能为空'}

  validates_numericality_of :casualties, :allow_nil => true

  belongs_to :car
  belongs_to :driver

end
