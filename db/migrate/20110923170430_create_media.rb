class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :kind

      t.timestamps
    end
  end
end
