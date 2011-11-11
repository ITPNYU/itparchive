class AddHasImagesToDocumentation < ActiveRecord::Migration
  def change
      add_column :documentations, :has_images, :boolean
  end
end
