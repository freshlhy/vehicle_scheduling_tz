#encoding: utf-8
class Driver < User

  has_many :driverships
  has_many :cars, through: :driverships

  before_destroy :confirm_driver_not_in_trip

  private
  def confirm_driver_not_in_trip
    unless self.driverships.empty?
      errors.add(:base, "该司机有出差记录，无法删除！")
      return false
    end
  end
end