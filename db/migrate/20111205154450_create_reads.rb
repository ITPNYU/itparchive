class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|
      t.string :readable_type
      t.integer :readable_id
      t.integer :user_id

      t.timestamps
    end

    u = User.find(1)
    Documentation.where(:read => true).each do |d|
      Read.create :readable => d, :user_id => u.id
    end

    remove_column :documentations, :read
  end
end
