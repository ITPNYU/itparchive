class AddIntegrityToDocumentations < ActiveRecord::Migration
  def change
    add_column :documentations, :integrity, :integer
  end
end
