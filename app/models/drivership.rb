#encoding: utf-8
class Drivership < ActiveRecord::Base
  attr_accessible :car_id, :driver_id

  validates_numericality_of :car_id
  validates_numericality_of :driver_id

  validates :car_id, presence: true
  validates :driver_id, presence: true

  belongs_to :car
  belongs_to :driver

  has_many :trips

  def driver_name
    self.driver.name
  end

end
