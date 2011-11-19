class ChangeFavoritesToPolymorphic < ActiveRecord::Migration
  def change
    change_table :favorites do |t|
      t.string :favoritable_type
      t.integer :favoritable_id
    end

    Favorite.all.each do |t|
      Favorite.create :user_id => t.user_id, :favoritable => Thesis.find(t.thesis_id)
      t.des
    end

    remove_column :favorites, :thesis_id
    remove_column :favorites, :documentation_id
  end
end
