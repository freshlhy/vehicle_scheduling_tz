#encoding: utf-8
class Car < ActiveRecord::Base
  attr_accessible :model, :plate, :load_limit, :current_trip

  has_many :driverships
  has_many :drivers, through: :driverships

  validates :plate, :presence => {:message => '车牌不能为空'}, Length: { maximum: 50 },
            :uniqueness => {:case_sensitive => false, :message => '车牌重复'}
  validates :model, :presence => {:message => '车型不能为空'}, Length: { maximum: 50 }
  validates_numericality_of :load_limit, :allow_nil => true

  before_destroy :confirm_car_not_in_trip

  def model_plate
    self.model + "|" + self.plate
  end

  def self.page(page)
    paginate :per_page => 10, :page => page,
             :order => 'model'
  end

  private
  def confirm_car_not_in_trip
    unless self.driverships.empty?
      errors.add(:base, "该车有出差记录，无法删除！")
      return false
    end
  end

end
