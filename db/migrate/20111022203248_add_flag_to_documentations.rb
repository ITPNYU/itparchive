class AddFlagToDocumentations < ActiveRecord::Migration
  def change
    add_column :documentations, :flag, :boolean
  end
end
