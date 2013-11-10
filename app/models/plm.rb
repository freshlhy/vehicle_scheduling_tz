class Plm < ActiveRecord::Base
  attr_accessible :start, :car_id, :is_active, :last, :nextd, :plm_type, :value

  validates :car_id, :presence => {:message => '维护车辆不能为空'}
  validates :plm_type, :presence => {:message => '周期名称不能为空'}
  validates :value, :presence => {:message => '维护周期不能为空'}
  
	scope :active, -> { where(is_active: "是")}

  belongs_to :car

end
