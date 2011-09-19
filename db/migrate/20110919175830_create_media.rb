class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :type
      t.integer :thesis_id

      t.timestamps
    end
  end
end
