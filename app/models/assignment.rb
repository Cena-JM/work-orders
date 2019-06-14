# The assignment model handles assignment validations and associations.
class Assignment < ApplicationRecord
  belongs_to :work_order
  belongs_to :worker

  validate :work_order_assignments_count_within_limit, on: :create
  validates_uniqueness_of :work_order_id, scope: :worker_id

  def work_order_assignments_count_within_limit
    errors.add(:base, 'Exceeded assignment limit')\
    if work_order.assignments.count >= work_order.work_order_limit
  end
end
