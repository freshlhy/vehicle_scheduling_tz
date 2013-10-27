#encoding: utf-8
class Note < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => {:message => '用途名不能为空'}, Length: { maximum: 50 },
            :uniqueness => {:case_sensitive => false, :message => '用途重复'}

  has_many :trips

  before_destroy :confirm_not_in_trip

  private
  def confirm_not_in_trip
    unless self.trips.empty?
      errors.add(:base, "该用途包含在出车记录中，无法删除！")
      return false
    end
  end

end
