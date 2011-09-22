class CreateDocumentation < ActiveRecord::Migration
  def change
    create_table :documentation do |t|
      t.string :type
      t.integer :thesis_id

      t.timestamps
    end
  end
end
