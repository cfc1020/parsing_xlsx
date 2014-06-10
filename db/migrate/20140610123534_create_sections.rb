class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name

      t.integer :year_id

      t.timestamps
    end
  end
end
