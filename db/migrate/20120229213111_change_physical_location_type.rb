class ChangePhysicalLocationType < ActiveRecord::Migration
  def change
    change_column :documentations, :physical_location, :text
    rename_column :documentations, :physical_location, :notes
  end
end
