class Part < ActiveRecord::Base
  attr_accessible :model, :name, :rating_life, :rating_mileage

  validates :name, :presence => {:message => '部件名称不能为空'}, Length: { maximum: 50 }
  validates :model, :presence => {:message => '部件型号不能为空'}, Length: { maximum: 50 }

  validates_numericality_of :rating_life, :allow_nil => true
  validates_numericality_of :rating_mileage, :allow_nil => true

  def model_plate
    self.name + "/" + self.model
  end

end
