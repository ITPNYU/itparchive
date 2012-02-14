class AddAbstractToThesis < ActiveRecord::Migration
  def change
    change_table :theses do |t|
      t.text :abstract
    end
  end
end
