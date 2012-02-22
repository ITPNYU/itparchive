class AddPublicToNotes < ActiveRecord::Migration
  def change
    change_table :notes do |t|
      t.boolean :public
    end
  end
end
