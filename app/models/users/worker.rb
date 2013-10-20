#encoding: utf-8
class Worker < User

  has_many :workerships
  has_many :trips, through: :workerships

  belongs_to :group

  before_destroy :confirm_worker_has_no_trip

  private
  def confirm_worker_has_no_trip
    unless self.workerships.empty?
      errors.add(:base, "该司机有出差记录，无法删除！")
      return false
    end
  end

end