class CreateDocumentations < ActiveRecord::Migration
  def change
    create_table :documentations do |t|
      t.string :type
      t.string :aws_url
      t.integer :condition
      t.integer :thesis_id
      t.string :title
      t.text :paper
      
      # paperclip
      t.string :media_file_name
      t.string :media_content_type
      t.integer :media_file_size
      t.datetime :media_updated_at

      t.timestamps
    end
  end
end
