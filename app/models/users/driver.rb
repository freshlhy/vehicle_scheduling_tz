#encoding: utf-8
class Driver < User

  has_many :driverships
  has_many :cars, through: :driverships


  has_many :accidents
  has_one  :driver_stat

  before_destroy :confirm_driver_not_in_trip

  private
  def confirm_driver_not_in_trip
    unless self.driverships.empty?
      errors.add(:base, "该司机有出车记录，无法删除！")
      return false
    end
  end
end