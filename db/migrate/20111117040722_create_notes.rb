class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :user_id
      t.string :notable_type
      t.integer :notable_id

      t.timestamps
    end
    
    u = User.find 1
    Thesis.all.each do |t|
      if t.notes != nil && t.notes != " "
        Note.create :body => t.notes, :notable => t, :user_id => u.id
      end
    end
    
    remove_column :theses, :notes

  end
end
