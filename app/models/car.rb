#encoding: utf-8
class Car < ActiveRecord::Base
  attr_accessible :model, :plate, :load_limit, :current_trip, :since, :age

  has_many :driverships
  has_many :drivers, through: :driverships

  has_many :accidents
  has_many :supervises

  validates :plate, :presence => {:message => '车牌不能为空'}, Length: { maximum: 50 },
            :uniqueness => {:case_sensitive => false, :message => '车牌重复'}
  validates :model, :presence => {:message => '车型不能为空'}, Length: { maximum: 50 }

  validates :since, :presence => {:message => 'Since不能为空'}
  validates_numericality_of :load_limit, :allow_nil => true

  scope :in_use, -> { where("current_trip > ?", 0) }

  before_destroy :confirm_car_not_in_trip

  def model_plate
    self.model + "/" + self.plate
  end

  def self.page(page)
    paginate :per_page => 10, :page => page,
             :order => 'model'
  end

  private
  def confirm_car_not_in_trip
    unless self.driverships.empty?
      errors.add(:base, "该车有出车记录，无法删除！")
      return false
    end
  end

end
