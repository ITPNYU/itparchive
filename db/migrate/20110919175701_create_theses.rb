class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.string :title
      t.integer :person_id
      t.integer :year

      t.timestamps
    end
  end
end
