class ChangeNotesToNotation < ActiveRecord::Migration
  def change
    rename_column :documentations, :notes, :notation
  end
end
