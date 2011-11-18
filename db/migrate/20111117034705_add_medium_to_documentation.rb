class AddMediumToDocumentation < ActiveRecord::Migration
  def change
    change_table :documentations do |t|
      t.string :medium
    end
  end
end
