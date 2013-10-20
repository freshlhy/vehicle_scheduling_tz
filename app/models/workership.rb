class Workership < ActiveRecord::Base
  attr_accessible :trip_id, :worker_id

  validates_numericality_of :trip_id
  validates_numericality_of :worker_id

  validates :trip_id, presence: true
  validates :worker_id, presence: true

  belongs_to :trip
  belongs_to :worker

end
