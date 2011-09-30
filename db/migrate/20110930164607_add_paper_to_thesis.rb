class AddPaperToThesis < ActiveRecord::Migration
  def change
    add_column :theses, :paper, :text
  end
end
