# frozen_string_literal: true

# The WorkOrder model handles work order validations and associations
class WorkOrder < ApplicationRecord
  has_many :assignments
  has_many :workers, through: :assignments

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 600 }
  validates :deadline, presence: true

  def work_order_limit
    5
  end

  scope :with_workers,
        lambda {
          includes(
            :work_orders
          )
        }
end
