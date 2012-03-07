class AddParsedPaperFieldToDocumentation < ActiveRecord::Migration
  def up
    add_column :documentations, :paper_excerpt, :text
    
    Documentation.all.each do |d|
      if d.paper
        d.paper_excerpt = d.paper.gsub(/\n|\r|\t/, ' ')[0..2000]
        d.save
      end
    end
  
  end
  
  def down
    remove_column :documentations, :paper_excerpt
  end
end
