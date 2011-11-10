class AddReadToDocumentations < ActiveRecord::Migration
  def change
    add_column :documentations, :read, :boolean
  end
end
