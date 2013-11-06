class Part < ActiveRecord::Base
  attr_accessible :model, :name, :rating_life, :rating_mileage

  validates :name, :presence => {:message => '部件名称不能为空'}, Length: { maximum: 50 }
  validates :model, :presence => {:message => '部件型号不能为空'}, Length: { maximum: 50 }

  validates_numericality_of :rating_life, :allow_nil => true, :message => "额定寿命需为数字"
  validates_numericality_of :rating_mileage, :allow_nil => true, :message => "额定里程需为数字"

  has_many :supervises

  def name_model
    self.name + "/" + self.model
  end

end
