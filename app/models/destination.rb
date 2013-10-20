#encoding: utf-8
class Destination < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => {:message => '目的地名称不能为空'}, Length: { maximum: 50 },
            :uniqueness => {:case_sensitive => false, :message => '目的地重名'}

  has_many :trips

  before_destroy :confirm_not_in_trip

  private
  def confirm_not_in_trip
    unless self.trips.empty?
      errors.add(:base, "该目的地包含在出差记录中，无法删除！")
      return false
    end
  end

end
