#encoding: utf-8
#require "date"
class Trip < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessible :drivership_id, :destination_id, :note_id, :back_time, :departure_time, :workers_ids, :ing, :workers_names

  validates :drivership_id, :presence => {:message => '车辆或司机不能为空'}
  validates :destination_id, :presence => {:message => '出差地不能为空'}
  validates :note_id, :presence => {:message => '事由不能为空'}
  validates :departure_time, :presence => {:message => '出发时间不能为空'}
  validates :back_time, :presence => {:message => '预计归来时间不能为空'}
  validate :departure_time_is_date?
  validate :back_time_is_date?
  validates :back_time, :date => {:after_or_equal_to => :departure_time, :message => '归来时间必须在出发时间之后'}

  belongs_to :drivership
  belongs_to :destination
  belongs_to :note

  has_many :workerships
  has_many :workers, through: :workerships

  has_one :car, through: :drivership
  has_one :driver, through: :drivership

  def generate_workers_names
    workers_names = []
    self.workers.each do |worker|
      workers_names << worker.name
    end
    workers_names.join("，")
  end


  private

  def departure_time_is_date?
    if !departure_time.is_a?(Date)
      errors.add(:departure_time, '出发时间必须为有效值')
    end
  end

  def back_time_is_date?
    if !back_time.is_a?(Date)
      errors.add(:back_time, '归来时间必须为有效值')
    end
  end


end
