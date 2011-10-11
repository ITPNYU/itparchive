class CreateDocumentations < ActiveRecord::Migration
  def change
    create_table :documentations do |t|
      t.string :type
      t.string :aws_url
      t.integer :condition
      t.integer :thesis_id
      t.string :title
      t.text :paper

      t.timestamps
    end
  end
end
