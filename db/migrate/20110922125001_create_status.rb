class CreateStatus < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      
    end
  end
end