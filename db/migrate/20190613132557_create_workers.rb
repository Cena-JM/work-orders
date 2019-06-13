class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.text :name
      t.text :company_name
      t.text :email
      t.references :work_order, foreign_key: true

      t.timestamps
    end
  end
end
