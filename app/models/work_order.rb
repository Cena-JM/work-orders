class WorkOrder < ApplicationRecord
  NUMBER_OF_PERMITTED_WORKERS = 5
  has_many :workers, dependent: :destroy, before_add: :validate_worker_limit

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 600 }
  validates :deadline, presence: true

  private

  def validate_worker_limit(worker)
    raise Exception.new if workers.size >= NUMBER_OF_PERMITTED_WORKERS
  end
end
