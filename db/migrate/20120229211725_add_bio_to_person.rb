class AddBioToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.text :bio
    end
  end
end
