#encoding: utf-8
class Group < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => {:message => '班组名称不能为空'}, Length: { maximum: 50 },
            :uniqueness => {:case_sensitive => false, :message => '班组重复'}

  has_many :workers

  before_destroy :confirm_no_workers_in_group

  def size
    self.workers.size
  end

  private
  def confirm_no_workers_in_group
    unless self.workers.empty?
      errors.add(:base, "该班组包含成员，无法删除！")
      return false
    end
  end

end
