class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :date

      t.integer :model_id

      t.timestamps
    end
  end
end
