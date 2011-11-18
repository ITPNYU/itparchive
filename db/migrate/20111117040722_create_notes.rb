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
    Thesis.find(:all, :conditions => ["notes is not null and notes != \" \""]).each do |t|
      Note.create :body => t.notes, :notable => t, :user_id => u.id
    end
    
    remove_column :theses, :notes

  end
end
