# frozen_string_literal: true

class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :work_order, foreign_key: true
      t.references :worker, foreign_key: true

      t.timestamps
    end
    # add_index :assignments, %i[worker_order worker], unique: true
  end
end
