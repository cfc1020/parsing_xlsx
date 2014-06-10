class CreateSpareParts < ActiveRecord::Migration
  def change
    create_table :spare_parts do |t|
      t.string :sleng

      t.integer :section_id

      t.timestamps
    end
  end
end
