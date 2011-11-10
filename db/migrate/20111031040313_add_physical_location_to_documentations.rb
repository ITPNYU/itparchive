class AddPhysicalLocationToDocumentations < ActiveRecord::Migration
  def change
    add_column :documentations, :physical_location, :string
  end
end
